import System.IO
import Data.Char

main = do
    putStrLn "Type File Name"
    fileName <- getLine
    withFile fileName ReadMode (\handle -> do
        hSetBuffering handle $ BlockBuffering (Just 2048)
        contents <- hGetContents handle
        putStr contents)
