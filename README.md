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
| first_name      | string | null: false |
| last_name       | string | null: false |
| kana_first_name | string | null: false |
| kana_last_name  | string | null: false |
| birth_date      | date   | null: false |

###Association

- has_many :items
- has_many :purchases
- has_one :card, dependent: :destroy
- has_many :sns_credentials
- has_many :user_rooms
- has_many :rooms, through: :user_rooms



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
| post_number   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building      | string  |             |
| phone_number  | string  | null: false |
| item_id       | integer | null: false, foreign_key: true |

###Association

- belongs_to :item
- belongs_to_active_hash : prefecture


##itemsテーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              | string     | null: false |
| name               | string     | null: false |
| text               | text       | null: false |
| price              | integer    | null: false |
| user_id            | integer    | null:false, foreign_key: true |
| category_id        | integer    | null: false |
| item_status_id     | integer    | null: false |
| delivery_burden_id | integer    | null: false |
| prefecture_id       | integer    | null: false |
| send_date_id       | integer    | null: false |

###Association

- belongs_to :users
- has_one :address
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status (商品の状態)
- belongs_to_active_hash :delivery_burden (配送料の負担)
- belongs_to_active_hash :prefecture (配送元の地域)
- belongs_to_active_hash :send_date (配送までの日数)
- has_many_attached :images
- belongs_to :user
- has_one :address
- has_one :purchase
- has_many :items_tags
- has_many :tags, through: :items_tags
- has_one :room
- has_many :messages

##Roomsテーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| name   | string     | null: false       |
| item   | references | foreign_key: true |

###Association
- has_many :user_rooms
- has_many :users, through: :user_rooms, dependent: :destroy
- belongs_to :item
- has_many :messages, dependent: :destroy

##UserRoomsテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| room   | references | foreign_key: true |

###Association
- belongs_to :user
- belongs_to :room

##SnsCredentialテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| provider | string     |                   |
| uid      | string     |                   |
| user     | references | foreign_key: true |

###Association
- belongs_to :user
- belongs_to :room

##Tagsテーブル

| Column     | Type   | Options                       |
| ---------- | ----   | ----------------------------- |
| tag_name   | string | null: false, uniqueness: true |

###Association
- has_many :items_tags
- has_many :items, through: :items_tags

##ItemTagsテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

###Association
- belongs_to :tag
- belongs_to :item

##Messagesテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| content | string     |                   |
| room    | references | foreign_key: true |
| user    | references | foreign_key: true |

###Association
- belongs_to :room
- belongs_to :user
- has_one_attached :image


##Ordersテーブル

| Column | Type    | Options |
| ------ | ------- | ------- |
| price  | integer |         |

###Association

- belongs_to :item

















