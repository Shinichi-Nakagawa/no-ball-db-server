no-ball-db-server ~ のぼーる（野球）データベース・サーバー
=================

Lahman’s Baseball Database(http://www.seanlahman.com/baseball-archive/statistics/)をMySQLで使うプロジェクトです。

## Description

Lahman’s Baseball DatabaseのCSVデータをMySQLから使えるようにしたプロジェクトです。

このプロジェクトには、

 * VagrantでUbuntu Server(Ubuntu 14.04 LTS 64bit)を起動
 * MySQL(5.5)のインストール
 * Databaseユーザーとスキーマを作成
 * Lahman's Baseball DatabaseのCSVデータをLoading

上記の役割を果たすコードが含まれています。

メジャーリーグの選手やチームを分析・可視化する際に活用してもらえると幸いです。

## Demo

このプロジェクトを用いてできる事は以下のスライドおよび動画を参照ください。

なお、スライド・動画にて紹介されているアプリケーション(Djangoアプリケーション)はこのプロジェクトには含まれておりません。

アプリケーションは別のプロジェクトとして公開する予定です、しばしお待ちください。

### スライド
<iframe src="//www.slideshare.net/slideshow/embed_code/39061157" width="425" height="355" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/shinyorke/python-39061157" title="Pythonではじめる野球プログラミング PyCon JP 2014 9/14 Talk Session" target="_blank">Pythonではじめる野球プログラミング PyCon JP 2014 9/14 Talk Session</a> </strong> from <strong><a href="//www.slideshare.net/shinyorke" target="_blank">Shinichi Nakagawa</a></strong> </div>

### 動画
http://youtu.be/7NS1CwzlFS8?list=UUxNoKygeZIE1AwZ_NdUCkhQ

## Requirement

このプロジェクトを適用する際は以下のアプリケーション・ライブラリが必要となります。

プロジェクトをCloneする前にご準備願います。

 * VirtualBox https://www.virtualbox.org/ 
 * Vagrant https://www.vagrantup.com/
 * Chef https://www.getchef.com/chef/
 * knife-solo http://matschaffer.github.io/knife-solo/
 * Berkshelf https://github.com/berkshelf/berkshelf

### (参考)Mac OS Xでの導入手順

#### VirtualBoxのインストール

公式サイト(https://www.virtualbox.org/)よりインストーラをダウンロードし、実行してください。

#### Vagrantのインストール

公式サイト(https://www.vagrantup.com/)よりインストーラをダウンロードし、実行してください。
#### Chef/knife-solo/Berkshelfのインストール

いずれもruby gemsを用いてインストールしてください。詳細は以下のサイトが詳しいです。

http://qiita.com/ikuwow/items/c604f4bff87275f89543
