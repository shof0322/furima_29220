# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name_first            | string | null: false |
| name_last             | string | null: false |
| name_kana_first       | string | null: false |
| name_kana_last        | string | null: false |
| birthday              | date   | null: false |


### Association

- has_many :items
- has_many :buyers

## itemes テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| price                | string     | null: false                    |
| category             | integer    | null: false                    |
| status               | integer    | null: false                    |
| delivery_fee         | integer    | null: false                    |
| shipping_origin      | integer    | null: false                    |
| days_untill_shipping | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :buyer

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
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase