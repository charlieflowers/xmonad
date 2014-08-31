import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.UrgencyHook
import qualified Data.Map        as M
import qualified XMonad.StackSet as W

myWorkspaces = [ "1:main","2:emacs", "3:webserver", "4:specs", "5:Guard", "6:Open", "7:Open 2", "8:Open 3", "9:Web", "10:Rust terminal", "11:Rust emacs", "12: Open 4", "13: Open 5", "14:Open 6", "15", "16", "17", "18", "19", "20", "21", "22"]

newKeys x = M.union (M.fromList (myKeys x)) (keys defaultConfig x)

myKeys conf@(XConfig {XMonad.modMask = modMask}) =
    [ ((modMask, xK_Home),           focusUrgent) ]
    ++
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9, xK_0, xK_F1, xK_F2, xK_F3, xK_F4, xK_F5, xK_F6, xK_F7, xK_F8, xK_F9, xK_F10, xK_F11, xK_F12])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ] 

main = do
    xmonad $ defaultConfig
        { 
          workspaces = myWorkspaces,
          keys = newKeys
}
