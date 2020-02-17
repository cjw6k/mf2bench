{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}

module Main where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as C
import Data.Microformats2.Parser
import Data.Default
import Network.URI
import System.Environment

main = do
  args <- getArgs
  let filename = args !! 0
  let base_url = args !! 1
  
  html <- readFile filename
  let packed_html = C.pack html

  let result = parseMf2 (def { baseUri = parseURI base_url }) $ documentRoot $ parseLBS packed_html
  putStrLn $ C.unpack $ encode result
