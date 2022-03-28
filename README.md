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
- メールアドレス：kkk@kkk
- パスワード：111kkk

#### アカウント2
- メールアドレス：mmm@mmm
- パスワード：111mmm

# 利用方法

## ブッキング投稿

1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う。  
2. ヘッダー内のプルダウンから「新規投稿」を選択する。  
3. 内容(地域、ジャンル、開催期間（開始）、開催期間（終了）、会場、詳細)を入力し投稿する。  
※地域の選択はクリッカブルマップ（日本地図）をクリックすることでも選択可能。  
4. トップページのブッキング一覧の最上部に投稿した内容が表示される。  

## チャット機能
  
他のユーザーが投稿したブッキングの場合  
1. トップページのブッキング一覧から、他のユーザーが投稿したブッキング情報を選択し、詳細ページへ遷移する。  
2. ブッキング詳細ページの「チャットルーム」を選択する。  
3. フォームを入力して「送信」を選択する。  
  
自身が投稿したブッキングの場合  
1. トップページのブッキング一覧から、自身が投稿したブッキング情報を選択し、詳細ページへ遷移する。  
2. ブッキング詳細ページの「チャットルーム一覧」を選択する。  
※投稿されたチャットが無い場合、チャットルームへの遷移はできません。  
3. フォームを入力して「送信」を選択する。  

※削除機能は実装していない為、送信内容には気を付けて下さい。
※ブッキング投稿を削除すればチャットルームも削除されます。テストの際は自身で投稿したブッキングに対して、チャットテストして頂くことを推奨します。
  
# アプリケーションを作成した背景

コロナ禍の影響で多くのバンドが解散し、現在も活動中のバンドにとって、ブッキングライブを企画しようにも出演者を集められないということがネックとなってしまいました。同様の問題を抱えているバンドも多いと考え、今まで接点のなかったバンド同士を繋げることで問題を解決するべく、このアプリケーションを開発しました。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1UvpAAm9lse1szAQjfoI_QkNHvq10JVxRGXBoaQLbLgQ/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明

- ブッキング投稿
[![Image from Gyazo](https://i.gyazo.com/2111cc3f1ff3860ffc26dc0ebbe3384f.gif)](https://gyazo.com/2111cc3f1ff3860ffc26dc0ebbe3384f)

- チャット投稿
[![Image from Gyazo](https://i.gyazo.com/b46c3d4e4cd581b14cb8331ce14c2010.gif)](https://gyazo.com/b46c3d4e4cd581b14cb8331ce14c2010)

- チャット投稿（返信）
[![Image from Gyazo](https://i.gyazo.com/113f6061932c38634248783c37141fe0.gif)](https://gyazo.com/113f6061932c38634248783c37141fe0)
# 実装予定の機能

現在、結合テストコードを実装中。  
今後はチャットの非同期通信を実装予定。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/5662de7a9d5ea124b087a48386346553.png)](https://gyazo.com/5662de7a9d5ea124b087a48386346553)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/a6180a3b48fdbd04468bc879ea5f6370.png)](https://gyazo.com/a6180a3b48fdbd04468bc879ea5f6370)

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
| area_id            | integer |                           |
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
| user_id        | integer    | null: false                    | 

### Association
- belongs to :booking
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

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
Heroku / MySQL / AWS S3
- テスト  
RSpec
- テキストエディタ  
Visual Studio Code
- タスク管理  
Github

# 工夫したポイント

- 地域を選択する際、クリッカブルマップで簡単に地域を選択できるようにしました。
- スクロール不要（PCの場合）のフロントデザインにすることで、使い易くしました。
- チャットルームをクリックすると自動でルーム作成が行われるようにしました。
- チャットルーム内でチャットが１件も無い場合、「もどる」を選択すると自動でルーム削除が行われるようにしました。
