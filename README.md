## users テーブル
| Column               | Type    | Options                   |
| ------------------   | ------  | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| sei_kana             | string  | null: false               |
| mei_kana             | string  | null: false               |
| birthday             | date    | null: false               |

##Association
- has_many :items
- has_many :purchase_histories

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

##Association
- belongs_to :user
- has_one :purchase_history

## purchase_histories テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

##Association
- belongs_to :item
- belongs_to :user
- has_one :order

## orders テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| tell             | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

##Association
- belongs_to :purchase_history