# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false, unique: true      |
| email           | string     | null: false, unique: true      |
| password        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_date      | string     | null: false                    |

### Association
- has_many   :items
- has_many   :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references |                                |
| image           |            | ActiveStorage                  |
| title           | text       | null: false                    |
| item_description| text       | null: false                    |
| category        | string     | null: false                    |
| item_state      | string     | null: false                    |
| shipping_cost   | string     | null: false                    |
| shipping_Area   | string     | null: false                    |
| shipping_time   | string     | null: false                    |
| cost            | integer    | null: false                    |
| checked         | boolean    | null: false                    |

### Association
- has_one    :order
- belongs_to :user
- has_on_attached :image

## ordersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references |                                |
| item_id         | references |                                |
| address_id      | references |                                |

### Association
- has_one    :item
- has_one    :address
- belongs_to :user

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| order_id        | references |                                |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| banchi          | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |

### Association
- has_one    :address


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
