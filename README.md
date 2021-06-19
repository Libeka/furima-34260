# DB 設計

## users table (出品者)

| Column             | Type                |Options                  |
|--------------------|---------------------|-------------------------|
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| nikname            | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

* belongs_to :destination dependent
* belongs_to :card dependent
* has_many :purchase record

## products table (商品)

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| item_name              | string     | null: false                    |
| item_info              | text       | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false_id                 |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price_id               | integer    | null: false                    |
| user_id                | integer    | null: false   foreign_key: true|

### Association

- belongs_to :user dependent
- has_many :image dependent
- belongs_to :destination


 ##  purchase record table (購入記録) 

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| prototype   | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user
- belongs_to :destination



## destination table (購入者情報) 

|Column                       |Type      |Options                          |
|---------------------------- |----------|---------------------------------|
| destinations_prefecture     | string   | null false                      |
| city                        | string   | null false                      |
| address                     | string   | null false                      |
| building_name               | string   |                                 |
| phone_number                | string   | null false                      |
| user_id                     | integer  | null false  foreign_key:true    |


### Association
- has_one :product
- has_many :purchase record