# テーブル設定 

## users テーブル 
| Column     | Type   | Options                   |
| --------   | ------ | ------------------------- |
| nickname   | string | null: false               | 
| email      | string | unique: true, null: false |
| encrypted_password  | string | null: false      |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| first_name_kana | string | null: false          |
| last_name_kana | string | null: false           |
| birthday     | date | null: false               |           


## Association
- has_many : items 
- has_many : purchases

## items テーブル
| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| name            | string  | null: false |
| description     | text    | null: false |
| status_id       | integer | null: false |
| category_id     | integer | null: false |
| delivery_fee_id | integer | null: false |
| area_id         | integer | null: false |
| day_id          | integer | null: false |
| price           | integer | null: false |
| user            | references | null: false, foreign_key: true  |

## Association
- has_one : purchase
- belongs_to : user

## purchases テーブル
| Column     | Type   | Options                             |
| --------   | ------ | ----------------------------------  |
| item       | references | null: false, foreign_key: true  |
| user       | references | null: false, foreign_key: true  |

## Association
- belong_to : user
- has_one : place

## places テーブル
| Column          | Type    | Options                           |
| -------------   | ------  | --------------------------------- |
| municipalities  | string  | null: false, foreign_key: true    |
| address         | string  | null: false, foreign_key: true    |
| building number | string  | null: false, foreign_key: true    |
| postal code     | string  | null: false, foreign_key: true    |
| phone number    | string  | null: false, foreign_key: true    |
| purchase        | references | null: false, foreign_key: true |

## Association
- belongs_to : purchase