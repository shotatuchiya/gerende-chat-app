# snow chat

 今回作成したアプリケーション名になります。

 
# アプリケーション概要

## 説明
　
 スキー場ごとにチャット機能を用いた掲示板の制作をしました。
 
## 目的

　その日に行くスキー場を選ぶ際の参考にしてもらい、ユーザー同士の情報交換を目的にしています。


# テーブル設計


## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :rooms
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- belongs_to :user
- has_many :messages

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
