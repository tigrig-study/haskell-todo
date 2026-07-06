{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import System.Environment (getArgs)
import System.IO (IOMode (AppendMode, ReadMode, WriteMode), hGetContents, hPutStrLn, hSetEncoding, utf8, withFile)

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
    ["done"] -> do
      text <- TIO.readFile "todo.txt"
      let newText = case T.lines text of
            [] -> ""
            (firstLine : restLines) ->
              let newFirstLine = "x|" <> firstLine
               in T.unlines (newFirstLine : restLines)
      withFile "todo.txt" WriteMode $ \handle -> do
        hSetEncoding handle utf8
        TIO.hPutStr handle newText
    _ -> putStrLn "不正な引数です。'list' を指定してください。"

formatTasks :: [String] -> [String]
formatTasks = zipWith (\i task -> show i ++ ". " ++ task) [1 :: Integer ..]
