import System.IO
import XMonad
import XMonad.Actions.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run (spawnPipe)

------------------------------------------------------------------------
-- Status bar (Pretty Printing)
-- https://github.com/dmxt/Solarized-xmonad-xmobar
--
myBar = "xmobar"
myPP = xmobarPP

    { ppTitle = xmobarColor "#657b83" "" . shorten 100
    , ppCurrent = xmobarColor "#93a1a1" "" . wrap "" ""
    , ppSep = xmobarColor "#657b83" "" " | "
    , ppUrgent = xmobarColor "#ff69b4" ""
    , ppLayout = const "" -- Disables layout info
    }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

------------------------------------------------------------------------
-- Colors and borders
--
myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#93a1a1"
myBorderWidth = 1

------------------------------------------------------------------------
-- Keybindings
--
myKeys =

    [ (( mod1Mask, xK_p ), spawn "dmenu_run \
    \ -fn 'Liberation Mono-12' \
    \ -nb '#002b36' \
    \ -nf '#586e75' \
    \ -sb '#073642' \
    \ -sf '#93a1a1'" )
    , (( mod1Mask, xK_e ), spawn "nautilus --no-desktop" ) -- Explorer
    , (( mod1Mask, 0x2d ), spawn "amixer -q set Master 5%-" ) -- Lower volume
    , (( mod1Mask, 0x3d ), spawn "amixer -q set Master 5%+" ) -- Raise volume
    , (( mod1Mask, xK_Print ), spawn "gm import -window root screenshot.jpg" ) -- Print
    --, (( mod1Mask, xK_BackSpace ), spawn "amixer -qD pulse set Master toggle" ) -- Mute
    , (( mod1Mask, xK_BackSpace ), spawn "amixer -q set Master toggle" ) -- Mute
    , (( mod1Mask .|. controlMask, xK_l ), spawn "slock xset dpms force suspend" ) -- Lock screen
    ]

------------------------------------------------------------------------
-- Main function
-- https://beginners-guide-to-xmonad.readthedocs.io/configure_xmonadhs.html
-- https://unix.stackexchange.com/questions/336701/xmonad-defaults-depreciation-what-is-the-future-proof-configuration
-- https://wiki.haskell.org/Xmonad/Config_archive/John_Goerzen's_Configuration
--
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

------------------------------------------------------------------------
-- Main configuration
--
myConfig = def

    { manageHook = manageDocks <+> manageHook def
    , layoutHook = smartBorders $ avoidStruts $ layoutHook def
    , terminal = "xterm"
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    } `additionalKeys` myKeys
