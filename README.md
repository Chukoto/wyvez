# アプリ名
"Wyvez" です。
<br>読み方はワイブズです。

# アプリ概要
このアプリでできることは

- ゲストログイン機能
- 質問投稿機能
- 質問お気に入り機能
- (質問に対する)コメント投稿機能
- 美容スケジュール管理機能
- パパ管理機能
- パパ活スケジュール管理機能
- GoogleMapAPIを用いた、美容・パパ活住所検索機能

# URL
https://wyvez.herokuapp.com/

# Basic認証
ユーザー名： admin
<br>パスワード： 1234

# テスト用アカウント
ヘッダーの「ゲストログイン」からログインできます。


# アプリ開発背景
LGBTというワードが世界中に知れ渡り、日本でも声を挙げるようになった人たちが増えています。中でも、レズビアン、ゲイ、バイセクシュアルに焦点を当てられることはよくあり、LGBの方達向けの商品やコンテンツはよく目にするようになりました。しかし、トランスジェンダー向けのコンテンツというのはまだまだ世の中に少ないと感じ、特に注目されにくいトランス女性（元男性）向けのコンテンツを増やしていく必要があると予想しました。

# 設定した問題定義
上記背景から、トランス女性が問題を抱えているであろう、そして有益になり得るであろう2つの事柄を予想しました。

1. 性転換をする方達の多くは、手術や美容メンテナンスを行う必要がある。
2. また、コロナウイルスによる影響で生活が苦しくなり、パパ活をする女性が増えてきています。トランス女性も例外ではない。

周りの人に理解してもらえない悩みを細分化すると、以下の通りです。
- 女性らしさ
- 男性遊び
- お金稼ぎ
- 恋愛
- 人間関係（家族、友人、異性）
- 手術や美容メンテナンス
など

# 目指した課題解決
上記問題を解決するため、それぞれ下記3つの課題を抽出しました。

1. トランス女性同士の繋がりを作ることができる（質問とそれに対するコメントでトークができる）
2. 美容スケジュールを管理できる
3. パパ活スケジュール（パパ）を管理できる

# 洗い出した要件（課題解決手段）
抽出した上記3つの課題を解決すべく、7つの機能を抽出しました。


| 課題 | 課題解決手段 | 具体的機能 |
| --- | ---------- | -------- |
| 悩みをシェアする仕組みを確立<br>⇨悩みを投稿し、他者からの<br>リアクションがある | 個人で抱えている悩みや相談事を一つの質問<br>として投稿でき、必要であれば画像を添付できる | ① 質問投稿機能<br>② 投稿された質問一覧表示機能  |
| ↑ | 投稿された悩み（質問）にコメントを投稿できる | ③ コメント投稿機能 |
| 女性である為のメンテナンス管理 | 行うべき施術予定別に管理できる | ④ 美容スケジュール管理機能<br>② 美容スケジュール一覧表示機能|
| ↑ | パパ活において、パパ別にパパ活予定を管理できる | ⑤ パパ管理機能<br>⑥ パパ一覧表示機能<br>⑦ パパ活スケジュール管理<br>⑧ パパ活スケジュール一覧表示機能 |


# 今後追加したい機能

1. 言語切り替え機能（日本以外のニーズにも焦点を当て、アプリを作ってみたいため）
2. 非同期通信機能（ユーザーが直感的に操作できるようにするため）


# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

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
