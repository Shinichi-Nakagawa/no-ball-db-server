#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'Shinichi Nakagawa'


from tables import Batting, BattingTotal, Pitching, PitchingTotal, Salary, SalariesTotal


from sqlalchemy import *
from sqlalchemy.orm import *

from script.database_config import CONNECTION_TEXT, ENCODING


class GenerateStatsData(object):

    # 集計対象の項目
    KEYS_BATTING = [
        'G',
        'G_batting',
        'AB',
        'R',
        'H',
        '_2B',
        '_3B',
        'HR',
        'RBI',
        'SB',
        'CS',
        'BB',
        'SO',
        'IBB',
        'HBP',
        'SH',
        'SF',
        'GIDP',
        'G_old'
    ]
    KEYS_PITCHING = [
        'W',
        'L',
        'G',
        'GS',
        'CG',
        'SHO',
        'SV',
        'IPouts',
        'H',
        'ER',
        'HR',
        'BB',
        'SO',
        'IBB',
        'WP',
        'HBP',
        'BK',
        'BFP',
        'GF',
        'R',
        'SH',
        'SF',
        'GIDP',
    ]
    KEYS_SALARY = ['salary']

    def __init__(self, session=None):
        # パスとか設定
        self.session = session

    def run(self):
        """
        データ作成
        :return: Not result
        """
        self._save_records(self.gen_records(Batting, BattingTotal, self.KEYS_BATTING))
        self._save_records(self.gen_records(Pitching, PitchingTotal, self.KEYS_PITCHING))
        self._save_records(self.gen_records(Salary, SalariesTotal, self.KEYS_SALARY))

    def gen_records(self, base_model, record_model, key_lists):
        """
        Generate Stats

        成績を選手・年ごとに集計してリストに保存
        :param base_model: Recordを作る元のクラス
        :param record_model: Recordのクラス
        :param key_lists: 集計対象の項目リスト
        :return: Batting Stats Records
        """
        records = {}
        # 元クラスのレコードを取得、選手IDと年度毎にサマリーを取る
        for row in self.session.query(base_model)\
                .order_by(base_model.playerID.asc(), base_model.yearID.asc()).all():
            key = "_".join([row.playerID, str(row.yearID)])
            if key in records:
                record = self._update_record(records[key], row, key_lists)
            else:
                record = self._create_record(record_model, row, key_lists, row.playerID, row.yearID)

            records[key] = record
        return records.values()

    def _create_record(self, stats_class, base_model, base_model_keys, playerID, yearID):
        '''
        Create Stats Record
        :param stats_class: Recordのクラス
        :param base_model: Recordを作る元のモデル
        :param base_model_keys: 元のモデルインスタンスのKey
        :param playerID: Player's ID
        :param yearID: Stats Year
        :return: stats_classのインスタンス
        '''
        _record = stats_class()
        for key in base_model_keys:
            setattr(_record, key, getattr(base_model, key))
        _record.playerID = playerID
        _record.yearID = yearID
        return _record

    def _update_record(self, stats_model, base_model, base_model_keys):
        '''
        Update Stats Record
        :param stats_model: Recordのモデル
        :param base_model: Recordを作る元のモデル
        :param base_model_keys: 元のモデルインスタンスのKey
        :return: stats_classのインスタンス
        '''
        _record = stats_model
        for key in base_model_keys:
            # 基本的には足し算
            value = getattr(_record, key) + getattr(base_model, key)
            setattr(_record, key, value)
        return _record

    def _save_records(self, records):
        '''
        Recordを保存
        :param records: record's list
        :return: None
        '''

        self.session.add_all(records)
        self.session.commit()


def main():
    engine = create_engine(CONNECTION_TEXT, encoding=ENCODING)
    Session = sessionmaker(bind=engine, autoflush=True)
    Session.configure(bind=engine)
    lh = GenerateStatsData(session=Session())
    lh.run()

if __name__ == '__main__':
    main()