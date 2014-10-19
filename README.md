no-ball-db-server ~ のぼーる（野球）データベース・サーバー
=================

Lahman’s Baseball Database( http://www.seanlahman.com/baseball-archive/statistics/ )をMySQLで使うプロジェクトです。

## Description

Lahman’s Baseball DatabaseのCSVデータをMySQLから使えるようにしたプロジェクトです。

プロジェクト自体はVagrantとChef solo(knife solo含む)で構成されています。

このプロジェクトには、

 * VagrantでUbuntu Server(Ubuntu 14.04 LTS 64bit)を起動
 * MySQL(5.5)のインストール
 * Databaseユーザーとスキーマを作成
 * Lahman's Baseball DatabaseのCSVデータをLoading

上記の役割を果たすコードが含まれています。

メジャーリーグの選手やチームを分析・可視化する際に活用してもらえると幸いです。

なお、当プロジェクトには__Lahman’s Baseball Databaseのデータ(CSV)は当プロジェクトに含まれていません。__

データは以下のサイトより事前に取得してください。

Lahman’s Baseball Database 2013 CSV Version　http://seanlahman.com/files/database/lahman-csv_2014-02-14.zip

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

#### knife-solo_data_bagのインストール

> gem install knife-solo_data_bag

## Usage

サーバーを構築(後述のinstallを参照)後、MySQLにログインして使用します。

### ホストへの接続

Project rootにいる場合(=Vagrantfile)がある場所であれば、

> vagrant ssh

普通にsshで繋ぐ際は、

> ssh vagrant@192.168.33.10

または、

> ssh db

でログイン出来ます。

ちなみに、ユーザー/パスワード共にvagrantです。

### 接続文字列

外部からの接続はappユーザーのみ許可しています。

> mysql -h 192.168.33.10 -P 3306 -u app -D sean_lahman -p {appユーザーのPassword}

## install

インストール手順です。利用環境(OS)は以下の要件を想定しています。

 * Mac OS X 10.9(Mavericks)
 * メモリ4GB以上を推奨 ※Serverイメージで2GB食います

初回のServer立ち上げには時間を要します（おおよそ2時間程度）。

覚悟してください。

ここから先の説明は仮置きで、Project Root(=クローンする先)を以下のディレクトリとします。

 * /Users/Billy_Beane/Documents/no-ball-db-server

__"Billy_Beane"の部分をご自身の環境と置き換えて読んでください。__

#### クローンする先のディレクトリに移動

> cd /Users/Billy_Beane/Documents

#### プロジェクトをcloneする

> git clone git@github.com:Shinichi-Nakagawa/no-ball-db-server.git

#### Lahman’s Baseball Databaseを取得&格納

Lahman’s Baseball DatabaseのCSVデータ( http://seanlahman.com/files/database/lahman-csv_2014-02-14.zip )を以下のディレクトリに格納してください。

> /Users/Billy_Beane/Documents/no-ball-db-server/site-cookbooks/sean_lahman/files/default/data

#### クローンしたプロジェクトに移動

> cd no-ball-db-server

#### Data Bagsの準備

参考： http://nmbr8.com/blog/2014/06/24/chef-solo-encrypted-data-bags/

サーバーを構築する前に、Data Bagsの準備を行います。

まず、opensslコマンドでData Bagsの鍵を作ります

> openssl rand -base64 512 > ./.chef/data_bag_key

次に、以下のコマンドでData Bagを作成してください。

※エディターが立ち上がります、必要に応じてEDITOR環境変数を変更してください！

> knife solo data bag edit database_config dafault --secret-file .chef/data_bag_key

default.jsonの中身は以下の内容を記述してください。

注意事項としては、

* idは変更しちゃダメ
* 項目の削除もダメ
* usersは必ずroot,admin,appの3つにしてください。変更・削除はダメ	※パスワードは変更OK

``` javascript
{
  "id": "default",
  "host": "localhost",
  "port": "3306",
  "name": "sean_lahman",
  "users": {
    "root": {
      "name": "root",
      "password": "ichiro_suzuki"
    },
    "admin": {
      "name": "admin",
      "password": "billy_beane"
    },
    "app": {
      "name": "app",
      "password": "adam_dunn"
    }
  }
}
```

#### Ubuntu Serverを立ち上げる

> vagrant up

初回はServer Imageのダウンロードがあるため、結構時間が掛かります。

#### ssh-configを出力

"db"という名前で仮想イメージにsshログイン出来るよう、設定します

> vagrant ssh-config --host db >> ~/.ssh/config

#### recipeを適用

knifeコマンドでrecipeを実行、野球データベースの作成を実施します

> knife solo cook db

以上で、メジャーリーグのDBが利用可能になります。

## License

MIT License http://opensource.org/licenses/MIT
