# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :item
- has_many :buyer

## itemes テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| category             | string     | null: false                    |
| status               | string     | null: false                    |
| delivery_fee         | string     | null: false                    |
| shipping_origin      | string     | null: false                    |
| days_untill_shipping | string     | null: false                    |
| price                | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |
| buyer                | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| credit_num    | integer    | null: false                    |
| expdate_month | integer    | null: false                    |
| expdate_year  | integer    | null: false                    |
| cvv           | integer    | null: false                    |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_num     | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user