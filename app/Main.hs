module Main where

import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["list"] -> putStrLn "list が実行されました"
    _ -> putStrLn "不正な引数です。'list' を指定してください。"
