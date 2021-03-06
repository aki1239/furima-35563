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
| email          | string | null: false,unique: true, index:true |
| encrypted_password       | string | null: false |
|family_name     | string | null: false |
|first_name      | string | null: false |
|family_name_kana| string |null: false  |
|first_name_kana | string | null: false |
| birth_date     | date   | null: false |





### Association
has_many :items
has_many :histories

 

##  items テーブル


| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
|price      | integer| null: false |
|description|text    | null: false |
|category_id| integer| null: false |
|status_id  | integer| null: false |
|cost_id    |integer | null: false |
|prefecture_id    |integer | null: false |
|days_id    |integer | null: false |
|user_id    |integer | null: false, foreign_key: true |



### Association
belongs_to :user
has_one :history







## histories テーブル

| Column    | Type     | Options     |
| --------  | -------- | ----------- |
|user_id    | integer  | null: false, foreign_key: true |
|item_id    | integer  | null: false, foreign_key: true |


### Association

belongs_to :user
belongs_to :item
has_one :deliver_address

## deliver_addresses テーブル

| Column                 | Type       | Options     |
| --------               | --------   | ----------- |
|post_code               | string     | null: false |
|prefecture_id           | integer    | null: false |
|city                    | string     | null: false |
|home_number             | string     | null: false |
|building_name           | string     |             |
|phone_number            | string     | null: false |
|history_id              | references | null: false,foreign_key:true |


### Association

belongs_to :history
