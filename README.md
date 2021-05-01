# テーブル設計

## users テーブル

|         Colum       |  Type   |          Options          |
| ------------------- | ------- | ------------------------- |
|  email              | string  | null: false, unique: true |
|  encrypted_password | string  | null: false               |
|  nickname           | string  | null: false               |
|  first_name         | string  | null: false               |
|  family_name        | string  | null: false               |
|  kana_first_name    | string  | null: false               |
|  kana_family_name   | string  | null: false               |
|  birthday           | date    | null: false               |

### Association
- has_many : items
- has_many : purchase_records


## items テーブル 

|        Colum        |  Type      |       Options     |
| ------------------- | ---------- | ----------------- |
|  product_name       | string     | null: false       |
|  introduction       | text       | null: false       |
|  price              | integer    | null: false       |
|  user               | references | foreign_key: true |
|  condition_id       | integer    | null: false       |
|  delivery_charge_id | integer    | null: false       |
|  prefecture_id      | integer    | null: false       |
|  delivery_day_id    | integer    | null: false       |
|  category_id        | integer    | null: false       |


### Association
- belongs_to : user
- has_one    : purchase_record


## purchase_records テーブル　
|  Colum  |  Type      |       Options      |
| ------- | ---------- | ------------------ |
|  user   | reference  |  foreign_key: true |
|  item   | reference  |  foreign_key: true |

### Association
- belong_to : user
- belong_to : item
- has_one   : address


## addresses テーブル　
|  Colum           |  Type     |  Options          |
| ---------------- | --------- | ----------------- |
|  postal_code     | string    | null: false       |
|  prefecture_id   | integer   | null: false       |
|  municipality    | string    | null: false       |
|  address         | string    | null: false       |
|  building_name   | string    |                   |
|  phone_number    | string    | null: false       |
|  purchase_record | reference | foreign_key: true |

### Association 
- belongs_to :purchase_record