# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| kana_first_name | string | null: false |
| kana_last_name  | string | null: false |
| birth_date      | string | null: false |

###Association

- has_many :items
- has_many :purchases

##purchasesテーブル(購入情報)

| Column      | Type    | Options    |
| ----------- | ------- | ---------- |
| sold_or_not | boolean | null: true |

###Association

- belongs_to :users
- belongs_to :items
- has_one    :addresses

##addressesテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_number   | string  | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building      | string  | null: true  |
| phone_number  | integer | null: false |

###Association

- belongs_to :purchases

##itemsテーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              | string     | null: false |
| name               | string     | null: false |
| text               | test       | null: false |
| price              | integer    | null: false |
| user_id            | integer    | null:false, foreign_key: true |
| category_id        | integer    | null: false |
| item_status_id     | integer    | null: false |
| delivery_burden_id | integer    | null: false |
| sent_area_id       | integer    | null: false |
| send_date_id       | integer    | null: false |

###Association

- belongs_to :users
- has_one :purchases
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status (商品の状態)
- belongs_to_active_hash :delivery_burden (配送料の負担)
- belongs_to_active_hash :sent_area (配送元の地域)
- belongs_to_active_hash :send_date (配送までの日数)













