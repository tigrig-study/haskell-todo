まず cabal init する。

※既に開発環境構築は以前済ませていたので割愛。

cabal が古いよっていう警告が出たので、 cabal update しておく。

cabal init すると選択肢が出た。

Library, Executable, Library and Executable, Test suite

今回は Executable を選択。一般的なベストプラクティスは Library and Executable だが、一番シンプルなものを選択。

後から .cabal を編集することで変更もできるみたいなのでこれでOK。

Please choose version of the Cabal specification to use:

1. 1.24
2. 2.0 (support for Backpack, internal sub-libs, '^>=' operator)
3. 2.2 (+ support for 'common', 'elif', redundant commas, SPDX)
4. 2.4 (+ support for '\*\*' globbing)
5. 3.0 (+ set notation for ==, common stanzas in ifs, more redundant commas, better pkgconfig-depends)
6. 3.4 (+ sublibraries in 'mixins', optional 'default-language')

上記が表示されるが、ここでは 5 （デフォルト）を選択。

一応 6 の 3.4 を選んでも良さそうだった。 `optional 'default-language'` が便利らしい（ 3.0 だと .cabal に default-language: Haskell2010 のようにデフォルト言語を指定しないといけないが、これを省略しても良くなる）。ただその不便さも一度体験してみたかったので、あえて 3.0 で。

エントリポイントは Main.hs。lhs は Literate Haskell で基本使わない。Other では Todo.hs みたいな別名を付けられるわけだが、別に Main で良い。

Application Directory もデフォルトの app で。 Haskell プロジェクトの慣習では、 app に実行ファイルのエントリポイントとなる Main.hs などを置く。
src/ には他プログラムからの使い回せるような純粋なロジック（ライブラリ）を置く。

Choose a language for your executable では、 3) GHC2021 を選択。
Haskell2010 のほうがシンプルな Haskell を体験できるが、アプリケーション開発を行うには不便な所も多いようなので、そのあたりをカバーした GHC2021 を選択。
GHC2024 でも良いといえばいいが、よりモダンな拡張セットということで、そこまでは必要ないかなと（情報が多くて頭に入らなさそう）。

Add informative comments to each field in the cabal file. では y 。 .cabal ファイルにはパッケージ依存関係、モジュール指定などの様々なフィールドがあって読みにくいので、コメントを付けてくれる。
