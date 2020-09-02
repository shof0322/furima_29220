# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| name_first            | string | null: false |
| name_last             | string | null: false |
| name_kana_first       | string | null: false |
| name_kana_last        | string | null: false |
| birthday              | date   | null: false |


### Association

- has_many :items
- has_many :buyers

## itemes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| price                  | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| delivery_fee_id        | integer    | null: false                    |
| shipping_origin_id     | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :buyer
- has_one :purchase

## Purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase