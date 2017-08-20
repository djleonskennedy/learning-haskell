import Control.Monad
import Data.Char

--
--main = do
--    putStrLn "aaaa"
--    line <- getLine
--    if null line
--        then return ()
--        else do
--            putStrLn $ reverseWords line
--            main
--
--reverseWords :: String -> String
--reverseWords = unwords . map reverse . words



main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main