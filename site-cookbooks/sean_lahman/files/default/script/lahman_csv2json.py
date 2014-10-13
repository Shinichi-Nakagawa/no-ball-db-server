#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
lahman-csvをjsonにフォーマット
"""
__author__ = 'Shinichi Nakagawa'


import os
import shutil
import csv
import json


class LahmanCsv2Json(object):

    BASE_DIR = 'data'
    FILENAME = 'lahman-csv_2014-02-14'
    FILE_EXT = '.csv'
    OUTPUT_DIR = 'output'
    OUTPUT_EXT = '.json'
    INFO_TEXT = 'info.txt'
    ENCODING = 'utf-8'

    def __init__(self, base_path=''):
        # パスとか設定
        self.base_path = base_path
        self.data_path = os.path.join(self.base_path, LahmanCsv2Json.FILENAME)
        self.data_files = os.listdir(self.data_path)
        self.output_path = os.path.join(self.base_path, LahmanCsv2Json.OUTPUT_DIR)

    def run(self):
        """
        実行
        """

        # 出力先を削除&生成
        if os.path.exists(self.output_path):
            shutil.rmtree(self.output_path)
        os.mkdir(self.output_path)

        for data_file in self.data_files:
            # JSONにDump
            self._dump_json(data_file)

    def _dump_json(self, data_file):
        """
        ファイルを読み込んでJSONにダンプ
        """
        root, ext = os.path.splitext(data_file)
        # 指定拡張子以外は読まない
        if not ext == self.FILE_EXT:
            return
        # ファイルを開く&dump
        objects = []
        with open(os.path.join(self.data_path, data_file)) as fin:
            reader = csv.reader(fin)
            header = None
            for i, row in enumerate(reader):
                # 先頭行はヘッダーとして扱う
                if i == 0:
                    header = row
                    continue
                objects.append(self._get_obj(header, row))
        fp = open(self._get_output_filename(root), mode='w')
        json.dump(objects, fp, indent=2)

    def _get_obj(self, header, row):
        """
        Headerと本文をchunk
        """
        return dict(
            zip(
                header,
                row
            )
        )

    def _get_output_filename(self, root):
        """
        Output File
        """
        # root名+拡張子
        return os.path.join(self.output_path, "".join([root, self.OUTPUT_EXT]))



def main(path):
    lh = LahmanCsv2Json(base_path=path)
    lh.run()


if __name__ == '__main__':
    base_path = os.path.dirname(__file__).replace('script', LahmanCsv2Json.BASE_DIR)
    main(base_path)
