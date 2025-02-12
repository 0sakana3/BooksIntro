# テーブル設計

## users テーブル     

| Column             | Type   | Options    |
| -------------------| ------ | -----------|
| nickname            | string | null:false |
| email              | string | null:false, unique: true|
| encrypted_password | string | null:false |

### Association
- has_many :books
- has_many :reads
- has_many :comments

## books テーブル

| Column             | Type   | Options    |
| ------------------ | ------ | ---------- |
| title              | string | null:false |
| publisher          | text | null:false |
| genre_id           | integer | null:false |
| detail             | text    | null:false |
| recommended        | text    | null:false |
| reference          | text    | null:false |
| user               | references | null:false, foreign_key: true |

### Association
- belongs_to  :user
- belongs_to :read
- has_many :comments

## reads テーブル

| Column          | Type       | Options    |
| --------------- | ---------- | ---------- |
| user            | references | null:false, foreign_key: true |
| book            | references | null:false, foreign_key: true |

### Association
- has_one :book
- has_one :user

## Comments テーブル

| Column          | Type       | Options    |
| --------------- | ---------- | ---------- |
| text            | references | null:false, foreign_key: true |
| book            | references | null:false, foreign_key: true |
| user            | references | null:false, foreign_key: true |

### Association
- belongs_to :book
- belongs_to :user