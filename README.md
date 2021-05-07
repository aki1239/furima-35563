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

  
#  テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
|family_name     | string | null: false |
|first_name      | string | null: false |
|family_name_kana| string |null: false  |
|first_name_kana | string | null: false |
| birth_date     | date   | null: false |
| city           | string | null: false |
| house_number   | string | null: false |
| building_name  | string |             |
|phone_number    | string | null: false |
|prefecture_code | integer| null: false |




### Association
　has_many :items
  has_one :credit_card, dependent: :destroy

##  items テーブル


| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
|price      | integer| null: false |
|days       |  date  | null: false |
|description|text    | null: false |
|category   | integer| null: false |
|status     | integer| null: false |
|cost       |integer | null: false |
|seller     |reference| null: false |
|buyer      |reference|             |


### Association
belongs_to :user





## credit_cards テーブル

| Column    | Type     | Options     |
| --------  | -------- | ----------- |
|user_id    | integer  | null: false |
|customer_id| string   | null: false |
|card_id    | string   | null: false |

### Association

- belongs_to :user