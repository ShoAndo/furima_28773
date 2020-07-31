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
| birth_date      | date   | null: false |

###Association

- has_many :items
- has_many :purchases

##purchasesテーブル(購入情報)

| Column      | Type    | Options    |
| ----------- | ------- | ---------- |
| user_id     | integer | null: true |
| item_id     | integer | null: true |

###Association

- belongs_to :user
- belongs_to :item

##addressesテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_number_id   | integer  | null: false |
| prefecture_id    | integer  | null: false |
| city_id          | integer  | null: false |
| address_id       | integer  | null: false |
| building_id      | integer  |             |
| phone_number_id  | integer  | null: false |
| item_id       | integer | null: false, foreign_key: true |

###Association

- belongs_to :item
- belongs_to_active_hash : post_number
- belongs_to_active_hash : prefecture
- belongs_to_active_hash : city
- belongs_to_active_hash : address
- belongs_to_active_hash : building
- belongs_to_active_hash : phone_number



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
- has_one :address
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status (商品の状態)
- belongs_to_active_hash :delivery_burden (配送料の負担)
- belongs_to_active_hash :sent_area (配送元の地域)
- belongs_to_active_hash :send_date (配送までの日数)













