## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| fullname           | string  | null: false               |
| kana               | string  | null: false               |
| birthday           | integer | null: false               |

##Association
- has_many :item
- has_many :purchase_histry

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| prefecture    | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

##Association
- belongs_to :user
- has_one :purchase_histry

## purchase_histriyies テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| items      | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

##Association
- belongs_to :item
- belongs_to :user
- has_many :orders

## orders テーブル
| Column    | Type    | Options         |
| ----------| ------- | --------------- |
| post_code | integer | null: false     |
| region    | string  | null: false     |
| city      | string  | null: false     |
| address   | string  | null: false     |
| building  | string  |                 |
| tell      | integer | null: false     |

##Association
- has_many :purchase_histry

