# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |


### Association

- has_many :posts, dependent: :destroy
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :post

## posts テーブル

| Column                  | Type        | Options                        |
| ----------------------- | ---------   | ------------------------------ |
| name                    | string      | null: false                    |
| info                    | text        | null: false                    |
| flavor_id               | integer     | null: false                    |
| region_id               | integer     | null: false                    |
| body_id                 | integer     | null: false                    | 
| acidity_id              | integer     | null: false                    |
| processing_id           | integer     | null: false                    |
| text                    | string      | null: false                    |
| user                    | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :liked_users, through: :likes, source: :user


## likes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## comments table

| Column      | Type       | Options                        |
|-------------|------------|------------------------------- |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| post        | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user