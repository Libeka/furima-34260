# DB 設計

## users table (出品者)

| Column             | Type                |Options                  |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nikname            | string              | null: false             |
| introduction       | text                |                         |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

* has_many :products dependent
* belongs_to :destination dependent
* belongs_to :card dependent


## products table (商品)

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| image                  | string     | null: false                    |
| item_name              | string     | null: false                    |
| item_info              | string     | null: false                    |
| categori_id            | integer    | null: false   foreign_key: true|
| status                 | integer    | null: false                    |
| shipping_fee_status    | integer    | null: false                    |
| prefecture             | integer    | null: false                    |
| scheduled_delivery     | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user_id                | integer    | null: false   foreign_key: true|

### Association

- belongs_to :user dependent
- belongs_to :category dependent
- has_many :image dependent
- belongs_to :destination


 ##  purchase record table (購入記録) !

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| prototype   | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user



## destination table (購入者情報) !

|Column          |Type      |Options                          |
|--------------- |----------|---------------------------------|
| prefecture     | string   | null false                      |
| city           | string   | null false                      |
| address        | string   | null false                      |
| building_name  | string   | null false                      |
| phone_number   | string   | null false                      |
| user_id        | integer  | null false  foreign_key:true    |


### Association
- has_one :product