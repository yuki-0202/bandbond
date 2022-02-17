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

# bookings テーブル

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

# rooms テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| booking        | references | null: false, foreign_key: true | 

### Association
- belongs to :booking

# room_users テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| room           | references | null: false, foreign_key: true | 
| user           | references | null: false, foreign_key: true |

### Association
- belongs to :room
- belongs to :user

# messages テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| content        | string     | null: false                    | 
| room           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association
- belongs to :room
- belongs to :user