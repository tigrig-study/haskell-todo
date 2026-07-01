module Main where

import System.Environment (getArgs)
import System.IO (IOMode (AppendMode, ReadMode), hGetContents, hPutStrLn, hSetEncoding, utf8, withFile)

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["add", task] -> do
      withFile "todo.txt" AppendMode $ \handle -> do
        hSetEncoding handle utf8
        hPutStrLn handle task
      putStrLn $ "タスクが追加されました: " ++ task
    ["list"] -> do
      withFile "todo.txt" ReadMode $ \handle -> do
        hSetEncoding handle utf8
        contents <- hGetContents handle
        let tasks = formatTasks $ lines contents
        mapM_ putStrLn tasks
    _ -> putStrLn "不正な引数です。'list' を指定してください。"

formatTasks :: [String] -> [String]
formatTasks = zipWith (\i task -> show i ++ ". " ++ task) [1 :: Integer ..]
