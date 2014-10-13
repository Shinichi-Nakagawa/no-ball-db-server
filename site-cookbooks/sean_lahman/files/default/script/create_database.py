#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'Shinichi Nakagawa'


import os
from sqlalchemy import *
from sqlalchemy.orm import *

from script.lahman_csv2json import LahmanCsv2Json
from script.json2mysql import JsonToMySQL
from script.generate_stats_data import GenerateStatsData
from script.database_config import CONNECTION_TEXT, ENCODING


def main(path):

    # CSV -> JSON
    lh = LahmanCsv2Json(base_path=path)
    lh.run()

    # SQLAlchemy session
    engine = create_engine(CONNECTION_TEXT, encoding=ENCODING)
    Session = sessionmaker(bind=engine, autoflush=True)
    Session.configure(bind=engine)
    session = Session()

    # JSON -> MySQL
    lh = JsonToMySQL(base_path=path, session=session)
    lh.run()

    # Generate Player's Stats
    ge = GenerateStatsData(session=session)
    ge.run()


if __name__ == '__main__':
    base_path = os.path.dirname(__file__).replace('script', LahmanCsv2Json.BASE_DIR)
    main(base_path)
