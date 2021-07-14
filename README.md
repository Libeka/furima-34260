# DB 設計

## users table (出品者)

| Column             | Type                |Options                    |
|--------------------|---------------------|---------------------------|
| email              | string              | unique: true  null:false  |
| encrypted_password | string              | null: false               |
| nikname            | string              | null: false               |
| last_name        | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date         | date                | null: false               |

### Association

- has_many :purchase_records
- has_many :products

## products table (商品)

| Column                 | Type       | Options                         |
|------------------------|------------|---------------------------------|
| item_name              | string     | null: false                     |
| item_info              | text       | null: false                     |
| category_id            | integer    | null: false                     |
| status_id              | integer    | null: false                     |
| shipping_fee_status_id | integer    | null: false                     |
| prefecture_id          | integer    | null: false                     |
| scheduled_delivery_id  | integer    | null: false                     |
| price                  | integer    | null: false                     |
| user                   | references | null: false,  foreign_key: true |

### Association

- belongs_to :user 
- has_one :purchase_record



 ##  purchase_records table (購入記録) 

| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| user        | references | null: false,foreign_key: true |
| product     | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :destination
- belongs_to :product



## destinations table (発送先情報テーブル) 

|Column                       |Type         |Options                          |
|---------------------------- |-------------|---------------------------------|
| prefecture_id               | integer     | null: false                     |
| city                        | string      | null: false                     |
| address                     | string      | null: false                     |
| building_name               | string      |                                 |
| phone_number                | string      | null: false                     |
| purchase_record             | references  | null: false, foreign_key: true  |
| zip_code                    | string      | null :false                     |

### Association
- belongs_to :purchase_record