# ポケモンを作りながら学ぶオブジェクト指向（Ruby）
### 目的
- 「プログラミング楽しい」を実感する
- フレームワークを使った学習では疎かになりがちな「基礎文法やロジック力」を鍛える
- コードを「読む」訓練をする
- 「妄想」をプログラムに落とし込む設計力を身につける
- 「プログラミング楽しい」を実感する（大事なことなのでもう一度）

### 動作確認済み環境（これ以外の環境はエラー出るかも）
- MacOS Catalina 10.15.17　※MacOS以外は不可
- Ruby 2.4.1
 
## 実行方法
１，Macでターミナルを開く ※わからなければ「Mac ターミナル 開き方」とかでググる

（以下の指示は全てターミナル操作）

２，ソースコードをダウンロードする任意のディレクトリまで移動

例、/Users/MyName/workspaceというフォルダに移動
```
$ cd ~/workspace
```

３，ソースコードをダウンロード
```
$ git clone https://github.com/hash52/ruby_practice_pokemon.git
```

４，実行
```
$ ruby ruby_practice_pokemon/main.rb
```

音楽が再生され、ターミナルでポケモンバトルが始まればOK

### 処理の停止
- バトルが終わればプログラムは自動停止する
- プログラムの強制終了は、プログラムを実行しているターミナルで `[ctrl + c]`
- プログラム終了後に音楽が止まらない場合、音楽の強制終了は、ターミナルで`$ pkill afplay`

## 開発に参加したくなったら・・
これが、[今後実装したい機能リスト](https://github.com/hash52/ruby_practice_pokemon/issues)です。

ダウンロードしたコードを編集して、実装しましょう！

とはいえ、いきなりコードを書き始めるのは難しいと思いますので、まずは、今あるコードを読むところから始めましょう

### テキスト外の内容で、最低限このコードを読むために必要そうな知識
コードを読む前に、以下のキーワードについて学習しておくとスムーズです

（一応、簡単にポイントを書いておきますが、知らなければ横着せずに、それぞれのキーワードについてきちんとググって調べましょうね）

- module　・・　インスタンス化できないクラスのようなもの。クラスでは実現不可である多重継承できる点がポイント
- require　・・　外部プログラムを読み込む
- 相対パス　・・　コンピュータで特定の場所を指定する方法

※ テキストにある内容については、ある程度理解できていること前提です。怪しいようであれば、以下のキーワードについても復習しましょう

- データ型、変数のスコープ、true/false判定
- 制御構文（条件分岐、ループ）
- オブジェクト指向（クラス、インスタンス、プロパティ、メソッド、コンストラクタ）

### 処理の起点(ここから読み始める)
- main.rb

### ある程度コードを理解した OR コードを読むのに飽きたら
[先ほどの機能リスト](https://github.com/hash52/ruby_practice_pokemon/issues)から、自分がチャレンジする機能を選んで、設計を考え、コードを書きましょう

### 完成したら
おめでとうございます！

issueにプルリクを出す形で、書いたコードを提出してください

レビューし、okであればマージします

プルリクについて、「GitHub プルリク」「issue コミットメッセージ」で方法を調べてみましょう

もしわからなければ、メンタリングかオンラインサポートでレクチャーします


### おまけ
見つけた一番すげえやつ
https://github.com/smogon/pokemon-showdown
