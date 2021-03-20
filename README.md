# テーブル設定 

## users テーブル
| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | not null    |
| email      | string | not null    |
| password   | string | not null    |

## Association
- has_many : items 
- has_many : purchases


## items テーブル
| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| image      | ActiveStorageで実装  | 
| name       | string | not null    |
| description | text  | not null    |
| status     | string | not null    |
| category   | string | not null    |
| delivery fee | string | not null  |
| area       | string | not null    |
| days       | string | not null    |
| price      | string | not null    |
| seller     | string | not null    |

## Association
- has_one : purchases 
- belongs_to : user

## purchases テーブル
| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| item       | foreign_key: true    |
| buyer      | string | not null    |

## Association
- belong_to : user
- has_one : place

## places テーブル
| Column     | Type   | Options     |
| --------   | ------ | ----------- |
|street address | string | not null |

## Association
- belongs_to : purchase