BlockInput(1)
Global $main = WinGetHandle("网上股票交易系统5.0")
WinSetState($main, "", @SW_SHOW)
buy($CmdLine[1], $CmdLine[2], $CmdLine[3])
WinSetState($main, "", @SW_HIDE)
BlockInput(0)

Func buy($code, $price, $num)
   ControlClick($main, "", "[CLASS:SysTreeView32; INSTANCE:1]", "left", 1, 57, 90)
   ;Send("{F6}")
   Sleep(100)
   ControlSetText($main, "", "[CLASS:Edit;INSTANCE:1]", $code)
   Sleep(1000)
   ControlSetText($main, "", "[CLASS:Edit;INSTANCE:2]", $price)
   ControlSetText($main, "", "[CLASS:Edit;INSTANCE:3]", $num)
   Sleep(1000)
   ControlClick($main, "", "买入[B]")

   Dim $confirm = WinWait("[CLASS:#32770]", "委托确认");
   Sleep(100)
   ControlClick($confirm, "", "是(&Y)")

   Dim $tip = WinWait("[CLASS:#32770]", "提示");
   Sleep(100)
   Dim $text = WinGetText($tip)
   ControlClick($tip, "", "确定")
   ConsoleWrite($text)
EndFunc
