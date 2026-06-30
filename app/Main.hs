module Main where

import System.Environment (getArgs)
import System.IO (hSetEncoding, stdout, stderr, utf8)

main :: IO ()
main = do
  hSetEncoding stdout utf8
  hSetEncoding stderr utf8

  args <- getArgs
  case args of
    ["list"] -> putStrLn "list が実行されました"
    _ -> putStrLn "不正な引数です。'list' を指定してください。"
