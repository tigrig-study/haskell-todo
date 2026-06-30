module Main where

import System.Environment (getArgs)

-- 1.  ["add", task]  のようなパターンマッチを追加し、一時的に  putStrLn で「追加しようとしているタスクの内容」をターミナルに表示できるか確認する。
-- 2. 上手く受け取れたら、それを  System.IO  の関数を使ってファイル（ todo.txt など）へ追記する処理に置き換える。
-- 3. 追加が成功した旨のメッセージをターミナルに表示する。

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["add", task] -> putStrLn task
    ["list"] -> putStrLn "list が実行されました"
    _ -> putStrLn "不正な引数です。'list' を指定してください。"
