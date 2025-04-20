# アプリケーション名
Books Intro

# アプリケーション概要
面白かった本を紹介し、その本を読んでくれた人と感想を共有できる読書交流アプリケーション。

# URL
https://booksintro.onrender.com

# テスト用アカウント
ID：admin  
PASS：2222  
メールアドレス：test@test.test  
パスワード：111111s  

# 利用方法

## 本の紹介
1,トップページからユーザー新規登録を行うorログインボタンからログインをする  
2,紹介するボタンから、本の情報（画像、タイトル、出版社、ジャンル、詳細、おすすめポイント、参考）を入力し投稿する  

## 紹介された本へコメントをする
1,一覧から投稿された本紹介をクリックして、詳細を確認する  
2,本を読んだ後、「読んだ？」ボタンをクリックする  
3,表示されたフォームからメッセージを送る  

# アプリケーションを作成した背景
本を読んだ人が、信頼できる知人に作品を勧めたり、感想を共有する中で、一般的なSNSではネタバレを懸念して自由なやり取りが難しいという課題があります。  
そこで、安心して本を勧め合い、読後の感想も共有できるクローズドなSNSを構築することで、本好き同士の交流を促進し、読書体験の広がりをサポートしたいと考えました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1LuB_ueot99yVKH31uuSW1r510FMCxQjWMF0-Ds1uUTg/edit?gid=982722306#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
### トップページ 
[![Image from Gyazo](https://i.gyazo.com/0e8c41648ebf04bee29e51de18007cbb.png)](https://gyazo.com/0e8c41648ebf04bee29e51de18007cbb)
新規登録orログインが可能

### 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/787aaedb5fb87cd61c37851ad68ad6b9.gif)](https://gyazo.com/787aaedb5fb87cd61c37851ad68ad6b9)
ニックネーム、メールアドレス、パスワードを入力でアカウント作成

### ログイン画面
[![Image from Gyazo](https://i.gyazo.com/b799fa128696d3f459bec7fa59880eb4.png)](https://gyazo.com/b799fa128696d3f459bec7fa59880eb4)
メールアドレスとパスワードでログイン可能

### ログイン後
[![Image from Gyazo](https://i.gyazo.com/4529c673fe1124775992cb7dc017d418.png)](https://gyazo.com/4529c673fe1124775992cb7dc017d418)
中央の紹介するボタンを押すことで本の紹介が可能

左上のログアウトボタンからログアウト可能

### 投稿ページ
[![Image from Gyazo](https://i.gyazo.com/6dd5a41692fc123dbccc7121091f27fc.gif)](https://gyazo.com/6dd5a41692fc123dbccc7121091f27fc)
画像、タイトル、出版社、ジャンル、詳細、おすすめポイント、参考の本の情報を入力可能
（画像のみ任意投稿、投稿しない場合はデフォルト画像が表示される）

### 投稿後トップページ
[![Image from Gyazo](https://i.gyazo.com/54edabd2662573fa4270b2fc492ce154.png)](https://gyazo.com/54edabd2662573fa4270b2fc492ce154)
投稿後、トップページへ戻る。ページ下部に紹介図書一覧

### 自分の投稿した詳細ページ
[![Image from Gyazo](https://i.gyazo.com/8ab072df9bc0097c7c889764ff463734.gif)](https://gyazo.com/8ab072df9bc0097c7c889764ff463734)
一覧の一つをクリックで図書紹介の詳細ページへ遷移

自身の紹介であれば、ページ下部にある投稿者名の横の▼から記事の削除、編集が可能

### 詳細ページ（感想コメントフォーム）
[![Image from Gyazo](https://i.gyazo.com/33347a8f832c5e1e158993f411560f35.gif)](https://gyazo.com/33347a8f832c5e1e158993f411560f35)
紹介のさらに下に感想コメントフォームがあり、コメントを投稿できる

現在、投稿時の改行が非同期表示ではされず、ページリロードで改行が適用される不具合がある。

### 他者の投稿した詳細ページ（感想コメントフォーム）
[![Image from Gyazo](https://i.gyazo.com/d3cb68a443a592d4dbc3ce57c3bc4f4e.gif)](https://gyazo.com/d3cb68a443a592d4dbc3ce57c3bc4f4e)
他人の投稿した紹介ページでは、初期状態ではコメント欄が表示されない。  
「読んだ？」のボタンを押す事で非同期更新によりフォームが表示され、読んだ人数カウントが進む。

現在、非同期更新でフォーム表示をした状態ではフォーム投稿ができない不具合がある。ページリロードで投稿可能。

# データベース設計
（作成中）

# 画面遷移図
（作成中）

# 開発環境
（作成中）

# ローカルでの動作方法
（作成中）

# 工夫したポイント
（作成中）

# テーブル設計

## users テーブル     

| Column             | Type   | Options    |
| -------------------| ------ | -----------|
| nickname            | string | null:false |
| email              | string | null:false, unique: true|
| encrypted_password | string | null:false |

### Association
- has_many :books
- has_many :reads
- has_many :comments

## books テーブル

| Column             | Type   | Options    |
| ------------------ | ------ | ---------- |
| title              | string | null:false |
| publisher          | text | null:false |
| genre_id           | integer | null:false |
| detail             | text    | null:false |
| recommended        | text    | null:false |
| reference          | text    | null:false |
| user               | references | null:false, foreign_key: true |

### Association
- belongs_to  :user
- belongs_to :read
- has_many :comments

## reads テーブル

| Column          | Type       | Options    |
| --------------- | ---------- | ---------- |
| user            | references | null:false, foreign_key: true |
| book            | references | null:false, foreign_key: true |

### Association
- belongs_to :book
- belongs_to :user

## Comments テーブル

| Column          | Type       | Options    |
| --------------- | ---------- | ---------- |
| text            | references | null:false, foreign_key: true |
| book            | references | null:false, foreign_key: true |
| user            | references | null:false, foreign_key: true |

### Association
- belongs_to :book
- belongs_to :user