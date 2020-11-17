# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| birthday           | date    | null: false |
| gender             | integer | null: false |

### Association

- has_many :questions
- has_many :comments
- has_many :bookmarks
- has_many :papas
- has_many :papa_events
- has_many :beauty_events
- has_one  :profile

## questions テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| category_id | integer    | null: false                    |
| title       | string     | null: false                    |
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :bookmarks

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| question     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :question

## bookmarks テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      | integer | null: false |
| question_id  | integer | null: false |

### Association

- belongs_to :user
- belongs_to :question

## profiles テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| trans_exp _id         | integer    | null: false                    |
| papa_exp_id           | integer    | null: false                    |
| text                  | text       | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## papas テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| age_id                | integer    | null: false                    |
| marriage_id           | integer    | null: false                    |
| child_id              | integer    | null: false                    |
| app_name              | string     | null: false                    |
| memo                  | text       | null: true                     |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :papa_events

## papa_events テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| started_at            | datetime   | null: false                    |
| finished_at           | datetime   | null: true                     |
| do_what_id            | integer    | null: false                    |
| todo                  | text       | null: true                     |
| place                 | text       | null: true                     |
| expected_reward       | integer    | null: false                    |
| reward                | integer    | null: true                     |
| status_id             | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| papa                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :papa

## beauty_events テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| beauty_cate_id        | integer    | null: false                    |
| started_at            | datetime   | null: false                    |
| place                 | text       | null: true                     |
| memo                  | text       | null: true                     |
| cost                  | integer    | null: true                     |
| status_id             | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user