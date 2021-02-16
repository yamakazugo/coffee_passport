# Portfolio name : COFFEE PASSPORT

好きなコーヒについての情報交換ができる事を想定して
作った投稿サイトです。

# Url: http://52.192.43.78/

# ID/Pass

* ID: kazugo
* Pass: 0634
* テスト用アカウント
  メールアドレス: sutaba@gmail.com
  パスワード: sutaba3150
* Githubリポジトリ: https://github.com/yamakazugo/coffee_passport


# Description

新規アカウントを作ってご自身の好きなコーヒーの情報を投稿する。
マイページで投稿の管理もでき、いいね！機能やコメント機能もつけて
SNS的なアプリケーションです。

*動画：https://gyazo.com/2d6c996da083da8fc788b99c4440f5ce

# Demo

*ユーザー管理機能：アカウント情報を管理する。
*いいね！機能：ログインユーザーが、投稿にいいね！できる。
*コメント機能：ログインユーザーが、投稿にコメントできる
*bootstrap,active_hash,kaminari,のGemでアプリに動きをつけました。
*AWSのS3,EC2を使い、写真の管理、自動デプロイができる。



# DB設計

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
- has_many :likes, dependent: :destroy
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