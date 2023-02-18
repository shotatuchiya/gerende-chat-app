
# snow chat

 今回作成したアプリケーション名になります。

 
# アプリケーション概要

## 説明
　
 スキー場ごとにチャット機能を用いた掲示板の制作をしました。
 
## 目的

　その日に行くスキー場を選ぶ際の参考にしてもらい、ユーザー同士の情報交換を目的にしています。

## 使い方

１、新規登録よりアカウントの制作を行って下さい。

２、サイドバーの中からスキー場を選択して下さい。

３、ページ下部の投稿フォームに内容を記述してもらい、右の送信を押してもらうと投稿されます。

  ※画像を選択してもらえれば画像だけでも投稿できます。
  
  ※間違えて投稿した場合に投稿内容の下に削除があるのでそこから投稿を削除して下さい。

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
