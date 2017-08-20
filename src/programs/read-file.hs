import System.IO
import Data.Char
import Text.Read

main = do
    putStrLn "Type File Name"
    fileName <- getLine
    putStrLn "Enter Buffer Size"
    bufferSize <- getLine
    withFile fileName ReadMode (\handle -> do
        hSetBuffering handle $ BlockBuffering (getBufferInput bufferSize)
        contents <- hGetContents handle
        putStr contents)

getBufferInput :: String -> Maybe Int
getBufferInput = readMaybe
