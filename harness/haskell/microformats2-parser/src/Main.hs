{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}

module Main where

import Control.Monad
import Text.Printf
import qualified Data.ByteString.Lazy.Char8 as C
import Data.Microformats2.Parser
import Data.Default
import Network.URI
import System.IO
import System.Environment
import System.CPUTime

main = do
  args <- getArgs
  let filename = args !! 0
  let base_url = args !! 1
  let iterations = read (args !! 2)
  
  html <- readFile filename
  let packed_html = C.pack html

  replicateM_ iterations $ parse packed_html base_url

parse packed_html base_url = do
  start <- getCPUTime
  let !result = parseMf2 (def { baseUri = parseURI base_url }) $ documentRoot $ parseLBS packed_html
  end <- getCPUTime
  printf "%d\n" (round (fromIntegral (end - start) / 10^6 ) :: Integer)
