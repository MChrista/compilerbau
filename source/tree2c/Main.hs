module Main where

import System.Environment
import System.Console.GetOpt
import Text.PrettyPrint

import Lex
import Parse
-- import Names
-- import Tree
import Cmm

usage :: [String] -> IO a
usage _ = ioError (userError header)
  where header = "Usage: tree2c <file>"

parseCmdLine :: [String] -> IO String
parseCmdLine argv = do
  let (_, ns, _) = getOpt Permute [] argv
  case ns of
    [prgFile] -> return prgFile
    _ -> usage [""]

main :: IO ()
main = do
  cmdLine  <- getArgs
  prgFile <- parseCmdLine cmdLine
  input <- readFile prgFile
  let defs = parse (alexScanTokens input)
  let cmm = cmmDoc defs
  putStrLn $ render cmm
