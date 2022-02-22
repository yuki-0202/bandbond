# アプリケーション名

BandBond

# アプリケーション概要

ブッキングライブを企画する際の、出演者集めを手助けします。

# URL
https://bandbond.herokuapp.com/

# テスト用アカウント

- Basic認証パスワード：7777
- Basic認証ID：admin

#### アカウント1
- メールアドレス：bbb@bbb
- パスワード：111bbb

#### アカウント2
- メールアドレス：ccc@ccc
- パスワード：111ccc

# 利用方法

## ブッキング投稿

1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う  
2.ヘッダー内のプルダウンから「投稿」を選択する  
3.内容(地域、ジャンル、開催期間（開始）、開催期間（終了）、会場、詳細)を入力し投稿する  
※地域の選択はクリッカブルマップをクリックすることでも選択可能  

## チャット機能

※未実装

# アプリケーションを作成した背景

コロナ禍の影響で多くのバンドが解散し、現在も活動中のバンドにとって、ブッキングライブを企画しようにも出演者を集められないということがネックとなってしまいました。同様の問題を抱えているバンドも多いと考え、今まで接点のなかったバンド同士を繋げることで問題を解決するべく、このアプリケーションを開発しました。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1UvpAAm9lse1szAQjfoI_QkNHvq10JVxRGXBoaQLbLgQ/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明

ー

# 実装予定の機能

現在、チャット機能を実装中。  
今後はブッキング検索機能やプロフィール編集機能を実装予定。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/db7e10aafeecf5157b70407376365809.png)](https://gyazo.com/db7e10aafeecf5157b70407376365809)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/aa6ba799fc2e7c8f228ea1402b06a52e.png)](https://gyazo.com/aa6ba799fc2e7c8f228ea1402b06a52e)

# テーブル設計

## users テーブル

| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               | 
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| birthday           | date    |                           |
| sex_id             | integer |                           |
| genre_id           | integer |                           |
| part_id            | integer |                           |
| introduction       | text    |                           |

### Association

- has_many :bookings
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## bookings テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| area_id        | string     | null: false                    |
| genre_id       | string     | null: false                    |
| date_start     | date       | null: false                    |
| date_end       | date       | null: false                    |
| venue          | string     | null: false                    |
| detail         | text       | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- has_many :rooms
- belongs to :user

## rooms テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| booking        | references | null: false, foreign_key: true | 

### Association
- belongs to :booking

## room_users テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| room           | references | null: false, foreign_key: true | 
| user           | references | null: false, foreign_key: true |

### Association
- belongs to :room
- belongs to :user

## messages テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| content        | string     | null: false                    | 
| room           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association
- belongs to :room
- belongs to :user

# 開発環境

- フロントエンド  
HTML / CSS / JavaScript
- バックエンド  
Ruby / Ruby on Rails
- インフラ  
Heroku
- テスト  
ー
- テキストエディタ  
Visual Studio Code
- タスク管理  
Github

# 工夫したポイント

- 地域を選択する際、クリッカブルマップで簡単に地域を選択できるようにしました。
- スクロール不要（PCの場合）のフロントデザインにすることで、使い易くしました。
- 英語表記エリアと日本語表記エリアを分けることで、見た目と使い易さを両立しました。
- アプリ名。Band(バンド)Bond(つなぐ)。語呂良し！意味良し！響き良し！
