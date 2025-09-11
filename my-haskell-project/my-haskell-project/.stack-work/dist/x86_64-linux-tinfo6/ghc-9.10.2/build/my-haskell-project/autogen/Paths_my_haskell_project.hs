{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_my_haskell_project (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/mnt/c/Users/Colile/Documents/School/Haskell/my-haskell-project/my-haskell-project/.stack-work/install/x86_64-linux-tinfo6/e96ad861780a1328b236437c1c56ac35360c5057ab4adabe947dd0531a3311de/9.10.2/bin"
libdir     = "/mnt/c/Users/Colile/Documents/School/Haskell/my-haskell-project/my-haskell-project/.stack-work/install/x86_64-linux-tinfo6/e96ad861780a1328b236437c1c56ac35360c5057ab4adabe947dd0531a3311de/9.10.2/lib/x86_64-linux-ghc-9.10.2-2f07/my-haskell-project-0.1.0.0-3hCDTIyqhlk1hNTkJpL5MZ-my-haskell-project"
dynlibdir  = "/mnt/c/Users/Colile/Documents/School/Haskell/my-haskell-project/my-haskell-project/.stack-work/install/x86_64-linux-tinfo6/e96ad861780a1328b236437c1c56ac35360c5057ab4adabe947dd0531a3311de/9.10.2/lib/x86_64-linux-ghc-9.10.2-2f07"
datadir    = "/mnt/c/Users/Colile/Documents/School/Haskell/my-haskell-project/my-haskell-project/.stack-work/install/x86_64-linux-tinfo6/e96ad861780a1328b236437c1c56ac35360c5057ab4adabe947dd0531a3311de/9.10.2/share/x86_64-linux-ghc-9.10.2-2f07/my-haskell-project-0.1.0.0"
libexecdir = "/mnt/c/Users/Colile/Documents/School/Haskell/my-haskell-project/my-haskell-project/.stack-work/install/x86_64-linux-tinfo6/e96ad861780a1328b236437c1c56ac35360c5057ab4adabe947dd0531a3311de/9.10.2/libexec/x86_64-linux-ghc-9.10.2-2f07/my-haskell-project-0.1.0.0"
sysconfdir = "/mnt/c/Users/Colile/Documents/School/Haskell/my-haskell-project/my-haskell-project/.stack-work/install/x86_64-linux-tinfo6/e96ad861780a1328b236437c1c56ac35360c5057ab4adabe947dd0531a3311de/9.10.2/etc"

getBinDir     = catchIO (getEnv "my_haskell_project_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "my_haskell_project_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "my_haskell_project_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "my_haskell_project_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_haskell_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_haskell_project_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
