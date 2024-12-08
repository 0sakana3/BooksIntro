# テーブル設計

## users テーブル     

| Column             | Type   | Options    |
| -------------------| ------ | -----------|
| nickname            | string | null:false |
| email              | string | null:false, unique: true|
| encrypted_password | string | null:false |

### Association
- has_many :books
- has_many :read

## books テーブル

| Column             | Type   | Options    |
| ------------------ | ------ | ---------- |
| title              | string | null:false |
| explanation        | text   | null:false |
| publisher          | text | null:false |
| genre_id           | integer | null:false |
| shipping_fee_id    | integer | null:false |
| detail             | text    | null:false |
| Recommended        | text    | null:false |
| Category           | string  | null:false |
| url                | text    | null:false |
| user               | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_one :read

## reads テーブル

| Column          | Type       | Options    |
| --------------- | ---------- | ---------- |
| user            | references | null:false, foreign_key: true |
| book            | references | null:false, foreign_key: true |

### Association
- belongs_to :book
- belongs_to :user
