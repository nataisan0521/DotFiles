import System.IO  
import Control.Monad (liftM2)          -- myManageHookShift
import XMonad
import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import XMonad.Actions.FloatKeys
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WindowGo
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout
import XMonad.Layout.DragPane          
import XMonad.Layout.ResizableTile
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.TwoPane
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.PerWorkspace
import XMonad.Layout.LayoutModifier
import XMonad.Layout.WindowArranger
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Util.SpawnOnce
-- gapwidth
gapwidth  = 8
gapwidthU = 2
gapwidthD = 1
gapwidthL = 38
gapwidthR = 39


main :: IO ()

main = do        
    barproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
		{ modMask = mod4Mask
    	, terminal = "urxvt"
        , layoutHook = toggleLayouts (avoidStruts $ noBorders Full) $
                       onWorkspace "3" (avoidStruts $ simplestFloat) $
                       avoidStruts $ myLayout
        , startupHook = myStartupHook
        , manageHook  = myManageHook
        , logHook       = myLogHook barproc
        }


myLayout = spacing gapwidth $
           gaps [(U, gapwidthU),(D, gapwidthD),(L, gapwidthL),(R, gapwidthR)] $
                 (ResizableTall 1 (1/55) (1/2) [])
             ||| (TwoPane (1/55) (1/2))
             ||| Simplest

myStartupHook = do
    spawnOnce "nm-applet"
    spawnOnce "bash $HOME/.fehbg"
    spawnOnce "compton -b"

--------------------------------------------------------------------------- }}}
-- myLogHook:         loghock settings                                      {{{
-------------------------------------------------------------------------------
myLogHook h    = dynamicLogWithPP xmobarPP {                   -- 現在のステータスをフォーマット文字列にして出力する（barへ
                         ppOutput        = hPutStrLn h
                         ,ppCurrent      = xmobarColor "#ffc123" "" . wrap "[" "]"
                         ,ppTitle        = xmobarColor "#c8e7a8" "" . shorten 80
                }

myManageHook   = manageDocks <+> manageHook defaultConfig


