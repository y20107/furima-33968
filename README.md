# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false, unique: true      |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_date         | date       | null: false                    |

### Association
- has_many   :items
- has_many   :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | foreign_key: true              |
| title           | string     | null: false                    |
| item_description| text       | null: false                    |
| category_id     | integer    | null: false                    |
| item_state_id   | integer    | null: false                    |
| shipping_cost_id| integer    | null: false                    |
| shipping_area_id| integer    | null: false                    |
| shipping_time_id| integer    | null: false                    |
| cost            | integer    | null: false                    |

### Association
- has_one    :order
- belongs_to :user
- has_on_attached :image
- belongs_to :category
- belongs_to :item_state
- belongs_to :shipping_cost
- belongs_to :shipping_area
- belongs_to :shipping_time

## ordersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | foreign_key: true              |
| item            | references | foreign_key: true              |

### Association
- belongs_to :item
- has_one    :address
- belongs_to :user

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| order           | references | foreign_key: true              |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| banchi          | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association
- belongs_to    :order
- belongs_to    :prefecture


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
