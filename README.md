# テーブル設定 

## users テーブル 
| Column     | Type   | Options                   |
| --------   | ------ | ------------------------- |
| nickname   | string | null: false               | 
| email      | string | unique: true              |
| password   | string | null: false               |
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
| category _id    | integer | null: false |
| delivery fee_id | integer | null: false |
| area_id         | integer | null: false |
| day_id          | integer | null: false |
| price           | integer | null: false |

## Association
- has_one : purchase
- belongs_to : user

## purchases テーブル
| Column     | Type   | Options                             |
| --------   | ------ | ----------------------------------  |
| item       | references | null: false, foreign_key: true  |

## Association
- belong_to : user
- has_one : place

## places テーブル
| Column          | Type    | Options                        |
| -------------   | ------  | -------------------------------|
| municipalities  | integer | null: false, foreign_key: true |
| address         | integer | null: false, foreign_key: true |
| building number | integer | null: false, foreign_key: true |
| postal code     | integer | null: false, foreign_key: true |
| phone number    | integer | null: false, foreign_key: true |

## Association
- belongs_to : purchase