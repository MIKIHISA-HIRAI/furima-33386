# テーブル設計

## users テーブル

|         Colum       |  Type   |   Options    |
| ------------------- | ------- | ------------ |
|  email              | string  | unique: true |
|  encrypted_password | string  | null: false  |
|  nickname           | string  | null: false  |
|  first_name         | string  | null: false  |
|  family_name        | string  | null: false  |
|  kana_first_name    | string  | null: false  |
|  kana_family_name   | string  | null: false  |
|  birthday           | date    | null: false  |

### Association
- has_many : items
- has_many : purchase_records


## items テーブル 

|  Colum           |  Type      |  Options    |
| ---------------- | ---------- | ----------- |
|  image           | string     | null: false |
|  product_name    | string     | null: false |
|  introduction    | text       | null: false |
|  condition       | string     | null: false |
|  category        | string     | null: false |
|  price           | string     | null: false |
|  user            | references |             |
|  delivery_charge | string     | null: false |
|  area            | string     | null: false |
|  days            | string     | null: false |


### Association
- belongs to : user
- has_many   : purchase_records


## purchase_record テーブル　
|  Colum   |  Type      |  Options   |
| -------- | ---------- | ---------- |
|  user    | reference  |            |
|  item    | reference  |            |
|  address | reference  |            |

### Association
- belong_to : user
- belong_to : item
- has_one   : address


## address テーブル　
|  Colum           |  Type     |  Options                    |
| ---------------- | --------- | --------------------------- |
|  postal_code     | string    | null: false                 |
|  address         | string    | null: false                 |
|  purchase_record | reference | foreign_key: true           |

### Association 
- belongs to :purchase_record