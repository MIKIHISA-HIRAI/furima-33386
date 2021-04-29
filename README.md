# テーブル設計

## users テーブル

|  Colum     |  Type   | Options     |
| ---------- | ------- | ----------- |
|  email     | string  | null: false |
|  password  | string  | null: false |
|  nickname  | string  | null: false |
|  name      | string  | null: false |
|  kana_name | string  | null: false |
|  birthday  | string  | null: false |

### Association
- has_many : items
- has_many : purchase_record


## items テーブル 

|  Colum        |  Type      |  Options    |
| ------------- | ---------- | ----------- 
|  product_name | string     | null: false |
|  category     | string     | null: false |
|  price        | string     | null: false |
|  user         | references |             |

### Association
- belongs to : users
- has_many   : purchase_record


## purchase_record テーブル　
|  Colum           |  Type    |  Options    |
| ---------------  | -------- | ----------- |
|  card_number     | string   | null: false |
|  expiration_date | string   | null: false |
|  cord_number     | string   | null: false |

### Association
- belong to : users
- belong to : items
- has-one   : address


## address テーブル　
|  Colum           |  Type     |  Options    |
| ---------------- | --------- | ----------- |
|  postal_code     | string    | null: false |
|  address         | string    | null: false |
|  purchase_record | reference |             |

### Association 
- belongs to :purchase_record