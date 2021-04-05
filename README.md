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
- has_many : orders

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
- has_one : order
- belongs_to : user

## order テーブル
| Column     | Type   | Options                             |
| --------   | ------ | ----------------------------------  |
| item       | references | null: false, foreign_key: true  |
| user       | references | null: false, foreign_key: true  |

## Association
- belongs_to : user
- belongs_to  : item
- has_one : place

## places テーブル
| Column          | Type    | Options     |
| -------------   | ------  | ----------- |
| area_id         | integer | null: false |
| municipalities  | string  | null: false |
| address         | string  | null: false |
| building_number | string  |             |
| postal_code     | string  | null: false |
| phone_number    | string  | null: false |
| order        | references | null: false, foreign_key: true |

## Association
- belongs_to : order