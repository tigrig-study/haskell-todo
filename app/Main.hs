module Main where

import System.Environment (getArgs)
import System.IO (withFile, IOMode(AppendMode), hSetEncoding, utf8, hPutStrLn)

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["add", task] -> do
      withFile "todo.txt" AppendMode $ \handle -> do
        hSetEncoding handle utf8
        hPutStrLn handle task
      putStrLn $ "タスクが追加されました: " ++ task
    ["list"] -> putStrLn "list が実行されました"
    _ -> putStrLn "不正な引数です。'list' を指定してください。"
