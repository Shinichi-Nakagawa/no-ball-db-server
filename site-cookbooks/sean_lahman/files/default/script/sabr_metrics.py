#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'Shinichi Nakagawa'


from script.tables import Team


class SabrMetrics(object):

    OUTPUT_DATA_TYPE_JSON = 'json'
    OUTPUT_DATA_TYPE_FLAME = 'flame'

    def __init__(self, session=None):
        # パスとか設定
        self.session = session

    def get_pytagorian__filter_by_league(self, year, lg, data_type=OUTPUT_DATA_TYPE_JSON):
        """
        ピタゴラス勝率を求める(リーグ指定)
        :param year: year(required)
        :param lg: league(required)
        :param data_type: output data type(default:json)
        :return:
        """
        return self._get_pytagorian(
            self.session.query(Team).filter(
                and_(
                    Team.yearID == year,
                    Team.lgID == lg,
                )
            )
        )

    def get_pytagorian__filter_by_division(self, year, lg, div, data_type=OUTPUT_DATA_TYPE_JSON):
        """
        ピタゴラス勝率を求める(地区指定)
        :param year: year(required)
        :param lg: league(required)
        :param div: division(required)
        :param data_type: output data type(default:json)
        :return:
        """
        return self._get_pytagorian(
            self.session.query(Team).filter(
                and_(
                    Team.yearID == year,
                    Team.lgID == lg,
                    Team.divID == div
                )
            )
        )

    def get_pytagorian__filter_by_team(self, year, lg, team, data_type=OUTPUT_DATA_TYPE_JSON):
        """
        ピタゴラス勝率を求める(チーム指定)
        :param year: year(required)
        :param lg: league(required)
        :param team: team name(required)
        :param data_type: output data type(default:json)
        :return:
        """
        return self._get_pytagorian(
            self.session.query(Team).filter(
                and_(
                    Team.yearID == year,
                    Team.lgID == lg,
                    Team.teamID == team,
                )
            )
        )

    def _get_pytagorian(self, query, data_type=OUTPUT_DATA_TYPE_JSON):
        """
        ピタゴラス勝率を求める
        :param query: query object(required)
        :param data_type: output data type(default:json)
        :return:
        """
        values = []
        for row in query.order_by(
            Team.yearID.asc(),
            Team.lgID.asc(),
            Team.divID.asc(),
            Team.Rank.asc()
        ).all():
            # チーム基本情報
            values.append(
                {
                    'year': row.yearID,
                    'team': row.teamID,
                    'W': row.W,
                    'L': row.L,
                    'R': row.R,
                    'ER': row.ER,
                    'pytagorian': SabrMetrics._calc_pytagorian(row.R, row.ER),
                    'win_percent': SabrMetrics._calc_win_percent(row.G, row.W),
                }
            )

        if data_type == SabrMetrics.OUTPUT_DATA_TYPE_JSON:
            return values
        elif data_type == SabrMetrics.OUTPUT_DATA_TYPE_FLAME:
            return []
        else:
            return values

    @classmethod
    def _calc_win_percent(cls, g, w):
        """
        勝率計算
        :param g: game
        :param w: win
        :return:
        """
        return w / g

    @classmethod
    def _calc_pytagorian(cls, r, er):
        """
        ピタゴラス勝率計算
        :param r: 得点
        :param er: 失点
        :return: ピタゴラス勝率(float)
        """
        return (r ** 2) / ((r ** 2) + (er ** 2))


from sqlalchemy import *
from sqlalchemy.orm import *

from script.database_config import CONNECTION_TEXT, ENCODING

import matplotlib.pyplot as plt

def main():
    engine = create_engine(CONNECTION_TEXT, encoding=ENCODING)
    Session = sessionmaker(bind=engine, autoflush=True)
    Session.configure(bind=engine)
    lh = SabrMetrics(session=Session())
    values = lh.get_pytagorian__filter_by_league(2013, 'AL')
    print(values)
    x, y, labels = [], [], []
    for value in values:
        x.append(value['win_percent'])
        y.append(value['pytagorian'])
        labels.append({'x': value['win_percent']-0.01, 'y':value['pytagorian'], 'text': "{team}".format(**value)})


    print(x)
    print(y)
    plt.title('Pytagorean expectation & Winning percentage')
    plt.xlabel('Winning percentage')
    plt.ylabel('Pythagorean expectation')
    for label in labels:
        plt.text(label['x'], label['y'], label['text'])
    plt.plot(x, y, 'o')
    plt.show()
    # values = lh.get_pytagorian__filter_by_division(2013, 'NL', 'W')
    # print(values)
    # values = lh.get_pytagorian__filter_by_team(2011, 'AL', 'OAK')
    # print(values)


if __name__ == '__main__':
    main()