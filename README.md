# Portfolio name : COFFEE PASSPORT

![PASSPORT](PASSPORT.png)

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

![6a285a718e3e30844da0ff87aed9d351](https://user-images.githubusercontent.com/73051044/108161607-b7bd4180-712e-11eb-8372-6f40c5aab30a.gif)


# Demo

* ユーザー管理機能：アカウント情報を管理する。
![7a8d7a9db7ff42c461fb3150cd57c689](https://user-images.githubusercontent.com/73051044/108166631-ccea9e00-7137-11eb-8844-1e6647c9051b.gif)
* いいね！機能：ログインユーザーが、投稿にいいね！できる。
![0b927e233c245be0ed4c7faad9e1d1e7](https://user-images.githubusercontent.com/73051044/108167450-0a9bf680-7139-11eb-8df6-e1c28f7cbabd.gif)
* コメント機能：ログインユーザーが、投稿にコメントできる
![ab39f7c3d94c46c1c275dacea38a8ebf](https://user-images.githubusercontent.com/73051044/108168545-d590a380-713a-11eb-843d-479e94c4b79e.gif)
* bootstrap,active_hash,kaminari,のGemでアプリに動きをつけました。
![5434e06e6c32ab9c8cfba1eac547802e](https://user-images.githubusercontent.com/73051044/108169273-d70e9b80-713b-11eb-8fe3-cfa1f988ee70.gif)
* AWSのS3,EC2を使い、写真の管理、自動デプロイができる。

# 制作背景(意図)

プログラミングの勉強で普段使っているカフェの店員さんが個々で今回の
内容をメモしてました。
そこでお店ごとに共有する事で新たなオリジナルコーヒー
やサービスが生まれるツールとしてしました。


# DB設計

## users table

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

## posts table

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


## likes table

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
