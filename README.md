# テーブル設定 

## users テーブル 
| Column     | Type   | Options          |
| --------   | ------ | ---------------  |
| nickname   | string | null: false      |
| email      | string | null: false      |
| password   | string | null: false      |
| first_name | string | null: false      |
| last_name  | string | null: false      |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false  |
| birthday     | integer | null: false   |

## Association
- has_many : items 
- has_many : purchases

## items テーブル
| Column     | Type   | Options        |
| --------   | ------ | -------------- |
| image      | ActiveStorageで実装     | 
| name       | string | null: false    |
| description | text  | null: false    |
| status     | text   | null: false    |
| category   | string | null: false    |
| delivery fee | integer | null: false |
| area       | string | null: false    |
| days       | date   | null: false    |
| price      | integer | null: false   |
| seller     | string | null: false    |

## Association
- has_one : purchases 
- belongs_to : user

## purchases テーブル
| Column     | Type   | Options                             |
| --------   | ------ | ----------------------------------  |
| item       | references | null: false, foreign_key: true  |
| buyer      | references | null: false, foreign_key:true   |

## Association
- belong_to : user
- has_one : place

## places テーブル
| Column        | Type   | Options                               |
| ------------- | ------ | ------------------------------------  |
|street address | references | null: false, foreign_key: true    |

## Association
- belongs_to : purchase