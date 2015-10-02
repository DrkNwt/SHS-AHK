LOOPDIR = ew
BcX = 0
BcY = 0
EcX = 0
EcY = 0

Esc::ExitApp

#F8::
Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, The script could not be reloaded.
return

#F2::
CheckAutoSlash()
return

#F3::
XPLoot(0)
;simpXPLoot()
;FindClickJunk()
return

#F4::
Gosub SetScanCoords
AutoMover()
return

#F5::
SetTitleMatchMode, RegEx
IfWinExist, .*Kongregate.*
{
  WinActivate ; use the window found above
  XPLoot(0)
  RSleep(4000,6000)
  AutoMover()
}
else
    MsgBox, AutoHotKey: Unable to find Straw Hat Samurai
return

#F6::
ClickWRAttack()
return

#F7::
;  WaitDis(11)
  RSleep(10000,25000)
return

; END OF F7TEST

#F1::
MouseGetPos, mPosX, mPosY
ENDposX = %mPosX% + 600
MouseClickDrag, left, %mPosX%, %mPosY% , %ENDposX% , %mPosY%
RSleep(100,500)
MouseGetPos, mPosX, mPosY
ENDposX = %mPosY% - 600 
MouseClickDrag, left, %mPosX%, %mPosY% , %ENDposX% , %mPosY%
return

;Alt & Right::
; TravelEastEdge()
;LOOPDIR = ew
;MsgBox, LOOPDIR set to "%LOOPDIR%"
;return

;Alt & Left::
; TravelWestEdge()
;LOOPDIR = we
;MsgBox, LOOPDIR set to "%LOOPDIR%"
;return

;Alt & Up::
;TravelNorth()
;return

;Alt & Down::
;TravelSouth()
;return

; SetTitleMatchMode, RegEx
; #IfWinActive, .*Straw Hat Samurai: Duels - Google Chrome.*
; WheelRight::2
; WheelLeft::3
; MButton::5
; RButton::6
; XButton1::7
; XButton2::8


$space::

   if ( GetKeyState("ScrollLock", "T") ) ; this will be 'true' if ScrollLock is toggled 'on'

      send _

   Else

      send {space}

return

$NumPad8::
  if ( GetKeyState("ScrollLock", "T") ) ; this will be 'true' if ScrollLock is toggled 'on'
    PopLaunch()
  else
    send {NumPad8}
return

$NumPad9::
  if ( GetKeyState("ScrollLock", "T") ) ;
    LReflectSlash()
  else
    send {NumPad9}
return

$NumPad7::
  if ( GetKeyState("ScrollLock", "T") ) ;
    RReflectSlash()
  else
    send {NumPad7}
return

$NumPad2::
  if ( GetKeyState("ScrollLock", "T") ) ;
    LXSlash()
  else
    send {NumPad2}
return

$NumPad3::
  if ( GetKeyState("ScrollLock", "T") ) ;
    LXLSlash()
  else
    send {NumPad3}
return

$NumPad6::
  if ( GetKeyState("ScrollLock", "T") ) ;
    RDSlash()
  else
    send {NumPad6}
return

$NumPad4::
  if ( GetKeyState("ScrollLock", "T") ) ;
    LDSlash()
  else
    send {NumPad4}
return

$NumPad5::
  if ( GetKeyState("ScrollLock", "T") ) ;
    TriangleFlight()
  else
    send {NumPad5}
return

#F10::
Loop {
  WinGetActiveTitle, Title
  if ((Title = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
   || (Title = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
   || (Title = "Straw Hat Samurai: Duels - Google Chrome") )
  {
  
    BattleCnt := 1
    ; Wait for battle to finish
    Loop {
    WinGetActiveTitle, Title
    if ((Title = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
     || (Title = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
     || (Title = "Straw Hat Samurai: Duels - Google Chrome") )
    {

      Sleep, 5000

      XPRes := XPLoot(1)
    
      if XPRes = 1
      {
;        if BattleCnt = 1
;          BattleCnt := 2
;        else
        break
      }
  ;    SwapFocus()
    }
    }
    
    RSleep(3000,5000)
;    RSleep(10000,25000)
    
    AutoMover()
    
  }
}


#F11::
Loop {
  WinGetActiveTitle, Title
  if ((Title = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
   || (Title = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
   || (Title = "Straw Hat Samurai: Duels - Google Chrome") )
  {
    RSleep(5000,7000)
    WRLoop := AutoWarroom(1)
    
    if (WRLoop = 1)
    {
      RSleep(1000,2000)
      XPLoot(0)
      RSleep(2000,3000)
      ClickWRAttack()
;      ClickWRDefend()
    }
   
    OoMchk :=  FindOutofMoves()
    if (OoMchk = 1) {
      Click 525,525
      RSleep(900000,1200000)
      ClickWRAttack()
;      ClickWRDefend()
    }
  }
}

FindDefeated() { 
  Gosub SetScanCoords
  ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHS-DefeatedBnr.png
  if ErrorLevel = 2
    MsgBox FindDefeated:Could not conduct the search.
  else
  {
    Click %fjX%,%fjY%
  }  
}

FindOutofMoves() { 
  Gosub SetScanCoords
  ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\OutofMoves.png
  if ErrorLevel = 2
    MsgBox FindDefeated:Could not conduct the search.
  else if ErrorLevel = 1
    return 0
  else
  {
    MouseMove,%fjX%,%fjY%
;    FindClickOK()
    return 1
  }  
}

SwapFocus() {
; swap between chrome and firefox

  WinGetActiveTitle, SSTitle
  if (SSTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
  {
    WinActivate Straw Hat Samurai: Duels - Google Chrome
  }
  else if (SSTitle = "Straw Hat Samurai: Duels - Google Chrome")
  {
    WinActivate Play Straw Hat Samurai.*Kongregate - Mozilla Firefox
  }

}

AutoMover() {
;  MsgBox AutoMover: Automoving in %LOOPDIR%
  LOOPDIR = OVERRIDE
  DirA = 1
  DirB = 6

  ; 1 standard left side exit
  ; 2 left side bend exit
  ; 3 upper standing exit
  ; 4 lower standing exit
  ; 5 right bend exit
  ; 6 right standard exit
  
  WinGetActiveTitle, SSTitle
  if (SSTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
  {
    DirA = 6
    DirB = 3
  }
  else if (SSTitle = "Straw Hat Samurai: Duels - Google Chrome")
  {
    DirA = 3
    DirB = 1
  }

  if (DirA = 1 )
    MoveWestEdge()
  else if (DirA = 2)
    LeftEdgeBend()
  else if (DirA = 3)
    StandingExit()
  else if (DirA = 4)
    StandingSecondExit()
  else if (DirA  = 6 )
    MoveEastEdge()
  else
  {
  ;  MoveWestEdge()
  ;  MoveEastEdge()
  ;  LeftEdgeBend()
    StandingExit()
  ;  StandingSecondExit()
  ;  EnterTown()
  }
  
  RSleep(4000,5000)
;  RSleep(40000,60000)
  
  if (DirB = 6)
    MoveEastEdge()
  else if (DirB = 1)
    MoveWestEdge()
  else if (DirB = 2)
    LeftEdgeBend()
  else if (DirB = 3)
    StandingExit()
  else if (DirB = 4)
    StandingSecondExit()
  else
  {
    MoveWestEdge()
  ;  MoveEastEdge()
  ;  LeftEdgeBend()
  ;  StandingExit()
  ;  StandingSecondExit()
  ;  LeaveTown()
  }
}

AutoWarroom(inLoop) {
;  MsgBox AutoWarroom: AutoBattling in %LOOPDIR%
  LOOPDIR = OVERRIDE
  

  SetTitleMatchMode, RegEx
  IfWinExist, .*Kongregate.*Firefox
  {
    Gosub SetScanCoords
    ; Hit Ok on Global Effect Banner 
    ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\GlobalEffectBnr.png
    if ErrorLevel = 2
      MsgBox AutoWarroom: Could not conduct the search.
    else if ErrorLevel = 1
    {
      if inLoop = 0
        MsgBox AutoWarroom: Could Not find Global Effect Banner
    }
    else {
      WinActivate ; use the window found above
      MouseMove,%fjX%,%fjY%
      FindClickOK()
      if inLoop = 1
        return 1
    }
  }
  else
    MsgBox, AutoHotKey: Unable to find Straw Hat Samurai
  
}

FindClickJunk() {
  Gosub SetScanCoords
  ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSSellJunk.png
  if ErrorLevel = 2
    MsgBox SellJk:Could not conduct the search.
  else if ErrorLevel =1
  {
    ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSSellJunk-High.png
    if ErrorLevel = 2
      MsgBox SellJkHigh:Could not conduct the search.
    else if ErrorLevel =1
    {
      ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSSellJunk-Best.png
      if ErrorLevel = 2
        MsgBox SellJkBest:Could not conduct the search.
      else if ErrorLevel =1
      {
        ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSSellJunk-chm.png
        if ErrorLevel = 2
          MsgBox SellJkBest:Could not conduct the search.
        else if ErrorLevel =1
        {
           ; No Junk Found
        }
        else
        {
          Click %fjX%,%fjY%
        }
      }
      else
      {
        Click %fjX%,%fjY%
      }
    }
    else
    {
      Click %fjX%,%fjY%
    }
  }
  else
  {
    Click %fjX%,%fjY%
  }  
}

FindClickOK() {
  Gosub SetScanCoords

  MouseMove,524,647
  MouseMove,900,200
  ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton2.png
  if ErrorLevel = 2
  {
    MsgBox OKBtn2: Could not conduct the search.
  }
  else if ErrorLevel = 1
  {
    ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton3.png
    if ErrorLevel = 2
      MsgBox OKBtn3: Could not conduct the search.
    else if ErrorLevel = 1
    {
      ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton4.png
      if ErrorLevel = 2
        MsgBox OKBtn4: Could not conduct the search.
      else if ErrorLevel = 1
      {
        ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton5.png
        if ErrorLevel = 2
          MsgBox OKBtn5: Could not conduct the search.
        else if ErrorLevel = 1
        {
          ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton6.png
          if ErrorLevel = 2
            MsgBox OKBtn6: Could not conduct the search.
          else if ErrorLevel = 1
          {
            ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton7.png
            if ErrorLevel = 2
              MsgBox OKBtn7: Could not conduct the search.
            else if ErrorLevel = 1
            {
              ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton-Best.png
              if ErrorLevel = 2
                MsgBox OKBtnBest: Could not conduct the search.
              else if ErrorLevel = 1
              {
                ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton-High.png
                if ErrorLevel = 2
                  MsgBox OKBtnHigh: Could not conduct the search.
                else if ErrorLevel = 1
                {
                
                  ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton-gcn.png
                  if ErrorLevel = 2
                    MsgBox OKBtnHigh: Could not conduct the search.
                  else if ErrorLevel = 1
                  {
                    ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton-gbchshs1.png
                    if ErrorLevel = 2
                      MsgBox OKBtngbchshs1: Could not conduct the search.
                    else if ErrorLevel = 1
                    {
                      ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton-gbchshs2.png
                      if ErrorLevel = 2
                        MsgBox OKBtngbchshs2: Could not conduct the search.
                      else if ErrorLevel = 1
                      {
                        ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton-ffkoshs.png
                        if ErrorLevel = 2
                          MsgBox OKBtnffkoshs: Could not conduct the search.
                        else if ErrorLevel = 1
                        {
                          ImageSearch, OKX,OKY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSOKButton-ffkoshs2.png
                          if ErrorLevel = 2
                            MsgBox OKBtnffkoshs2: Could not conduct the search.
                          else if ErrorLevel = 1
                          {
                            ; MsgBox No OK button found.
                            Click 608, 583
                          }
                          else 
                            Click %OKX%,%OKY%
                        }
                        else 
                          Click %OKX%,%OKY%
                      }
                      else 
                        Click %OKX%,%OKY%
                    }
                    else 
                      Click %OKX%,%OKY%
                  }
                  else 
                    Click %OKX%,%OKY%
                    
                    
                }
                else 
                  Click %OKX%,%OKY%
              }
              else 
                Click %OKX%,%OKY%
            }
            else 
              Click %OKX%,%OKY%
          }
          else 
            Click %OKX%,%OKY%
        }
        else 
          Click %OKX%,%OKY%
      }
      else 
        Click %OKX%,%OKY%
    }
    else 
      Click %OKX%,%OKY%
  }
  else
    Click %OKX%,%OKY%
  
}

XPLoot(inLoop) {

  Gosub SetScanCoords
    lBnrMsg := ""
    eBnrMsg := ""
    ; Hit Ok on Gain level Banner 
    ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 J:\Games\SHS\SHS-LevelAchievedBnr.png
    if ErrorLevel = 2
      MsgBox LvlAch: Could not conduct the search.
    else if ErrorLevel = 1
    {
          lBnrMsg := ",Lvl Gain" 
    }
    else {
      MouseMove,%fjX%,%fjY%
      FindClickOK()
    }

    ; Hit Ok on EQ Gain level Banner 
    ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHS-EQLevelGainBnr.png
    if ErrorLevel = 2
      MsgBox EQLvlGain: Could not conduct the search.
    else if ErrorLevel = 1
    {
      eBnrMsg := ", EQLvl" 
    }
    else {
      MouseMove,%fjX%,%fjY%
      FindClickOK()
    }
    
    ; Search for Loot Message and Sell of junk, then hit OK
    ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSXPLootBnr.png
    if ErrorLevel = 2
      MsgBox XPLootBnr: Could not conduct the search.
    else if ErrorLevel = 1
    {
      ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 J:\Games\SHS\SHSXPLootBnrSng.png
      if ErrorLevel = 2
        MsgBox XPLootBnrSng: Could not conduct the search.
      else if ErrorLevel = 1
      {
        ImageSearch, fjX,fjY, %BcX%,%BcY%, %EcX%,%EcY%, *40 *TransBlack J:\Games\SHS\SHSXPLootBnr-trans.png
        if ErrorLevel = 2
          MsgBox XPLootBnrtran: Could not conduct the search.
        else if ErrorLevel = 1
        {
          if inLoop = 0
            MsgBox XPLootBnrtran Could Not  %BcX%,%BcY%, %EcX%,%EcY%, Find XP Bnr %lBnrMsg% %eBnrMsg%
        }
        else
        {
        MouseMove,%fjX%,%fjY%
        FindClickJunk()
        FindClickOK()
        if inLoop = 1
          return 1
        }
      }
      else
      {
        MouseMove,%fjX%,%fjY%
        FindClickJunk()
        FindClickOK()
        if inLoop = 1
          return 1
      }
    }
    else
    {
      MouseMove,%fjX%,%fjY%
      FindClickJunk()
      FindClickOK()
      if inLoop = 1
        return 1
    }

}

simpXPLoot() {

  ImageSearch, fjX,fjY, 30,190, 900,500, *40 *TransBlack J:\Games\SHS\SHSXPLootBnr.png
  if ErrorLevel = 2
    MsgBox SimLoot: Could not conduct the search.
  else if ErrorLevel = 1
  {
          MsgBox SimpleLoot Could Not Find XP Bnr:  %BcX%,%BcY%, %EcX%,%EcY%,
  }
  else
  {
    Click 621,629
    Click 621,629
  }

}


MoveWestEdge() {
;  Click 202,602
;  Click 138,511
  WinGetActiveTitle, WTitle
  if (WTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
  {
    Click 111, 593
  }
  else if (WTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
  {
;    Click 60, 622
    Mousemove 60, 622
    gosub clicken
  }
  else if (WTitle = "Straw Hat Samurai: Duels - Google Chrome")
  {
    Click 72, 556
  }
  else {
    MsgBox MoveWestEdge:  Unmatched window: %WTitle%
  }
}

MoveEastEdge() {
;  Click 945,600
  WinGetActiveTitle, ETitle
  if (ETitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
  {
    Click 990, 598
  }
  else if (ETitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
  {
    Click 780, 625
  }
  else if (ETitle = "Straw Hat Samurai: Duels - Google Chrome")
  {
    Click 771, 556
  }

}

WalkWest() {
  Click 418,475
}

WalkEast() {
  Click 669,475
}

LeftEdgeBend() {
  Click 357,587
}

XSlash() {
  MouseClickDrag, Left, 0, 0, 50, 50, , R
  MouseClickDrag, Left, 0, -50, -50, 50, , R
  Mousemove 0, -50, 0, R
}

LXSlash() {
  MouseClickDrag, Left, 0, 0, 100, 50, , R
  MouseClickDrag, Left, 0, -50, -100, 50, , R
  Mousemove 0, -50, 0, R
}

RDSlash() {
  MouseClickDrag, Left, 0, 0, 5, 80, 2, R
  Mousemove -5, -80, 0, R
}

LDSlash() {
  MouseClickDrag, Left, 0, 0, -5, 80, 2, R
  Mousemove 5, -80, 0, R
}

PopLaunch() {
  MouseClickDrag, Left, 0, 120, 0, -120, 2, R
}

TriangleFlight() {
  MouseClickDrag, Left, 0, 0, 220, -180, 2, R
  MouseClickDrag, Left, 0, 0, -220, 0, 2, R
  MouseClickDrag, Left, 0, 0, 0, 180, 2, R
}

LXLSlash() {
  MouseClickDrag, Left, 0, 0, 50, 25, , R
  MouseClickDrag, Left, 0, -25, -50, 25, , R
  Mousemove 0, -25, 0, R
}

LReflectSlash() {
  Random, rVar, 180, 220
  MouseClickDrag, Left, 0, 0, 100, -%rVar%, , R
  MouseClickDrag, Left, 0, 0, -100, %rVar%, , R
}

RReflectSlash() {
  Random, rVar, 180, 220
  MouseClickDrag, Left, 0, 0, -100, -%rVar%, , R
  MouseClickDrag, Left, 0, 0, 100, %rVar%, , R
}

StandingExit() {
  WinGetActiveTitle, STitle
  if (STitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
  {
    Click 80,340
  }
  else if (STitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
  {
    Click 46, 425
  }
  else if (STitle = "Straw Hat Samurai: Duels - Google Chrome")
  {
    Click 52, 367
  }
}

StandingSecondExit() {
  WinGetActiveTitle, SSTitle
  if (SSTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
  {
    Click 80,400
  }
  else if (SSTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
  {
    Click 46, 465
  }
  else if (SSCTitle = "Straw Hat Samurai: Duels - Google Chrome")
  {
    Click 52, 397
  }
}

SetScanCoords:
; Mozilla Defeated Banner: 150,400, 940,840
; Mozilla Out of Moves 150,400, 940,840,
; Mozilla Global Effect Banner: 45,200, 1040,640,
; Mozilla Junk Scan: 150,400, 940,840,
; Mozilla OK Button Scan: 150,400, 940,840,
; Mozilla EQ/Level/Received Scan: 45,200, 1040,640,
; Mozilla Loot Banner: 30,190, 900,500,
; Chrome Full Playarea: 15,290, 820,775,
; %BcX%,%BcY%, %EcX%,%EcY%,

  WinGetActiveTitle, SSCTitle
  if (SSCTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Mozilla Firefox")
  {
    global BcX = 30
    global BcY = 190
    global EcX = 1020
    global EcY = 700
  }
  else if (SSCTitle = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
  {
    global BcX := 15
    global BcY := 290
    global EcX := 820
    global EcY := 775       
  }
  else if (SSCTitle = "Straw Hat Samurai: Duels - Google Chrome")
  {
    global BcX := 12
    global BcY := 231
    global EcX := 813
    global EcY := 710       
  }
Return

Frmt(secs) {
	time = 20000101
	time += %secs%, seconds
	FormatTime, mmss, %time%, HH:mm:ss
	return mmss
}

WaitDis(secs) {
  global cntsecs = %secs%
  Gosub RunDisplay
}

RunDisplay:
 
 height := A_ScreenHeight-385
 Gui, CountDown: +LastFound +AlwaysOnTop -Caption +ToolWindow
 Gui, CountDown:Color, EEAA99
 Gui, CountDown:Font, s20
 Gui, CountDown:Add, Text, X100 Y40 W200 Vdisp Cred
 WinSet TransColor, EEAA99
 Gui, CountDown:Show, x2000 y%height%, NoActivate, Display
  
; secsLeft = %cntsecs%
 SetTimer, ShowTimer, -850
 Gosub ShowTimer
Return

ShowTimer:
  secsLeft := cntSecs/1000
  loop % secsLeft-1 {		
        GuiControl, CountDown:Text, disp,% Frmt(--secsLeft)
	sleep, 1000
  }
  
  SetTimer ShowTimer, Off
  Gui, CountDown:Destroy
Return

RSleep(Smin, Smax) {
  Random, SlTm, Smin, Smax
  if (SlTm > 10000) {
    Global cntSecs := SlTm
    Gosub RunDisplay
  }
  else
    Sleep, SlTm
}

EnterTown() {
 
  ImageSearch, METX,METY,  44,350, 340,446, J:\Games\SHS\SHS-CastleTownEntButton.png
  if ErrorLevel = 2
    MsgBox CastTownEntButton: Could not conduct the search.
  else if ErrorLevel = 1
  {
    ; MsgBox Could not Find Castle Town Entrance Button
  }
  else
  {
    Click %METX%,%METY%
    MouseMove,900,200
    Sleep, 2000
    
    ImageSearch, MECX,MECY,  44,350, 340,446, J:\Games\SHS\SHS-EnterTownButton.png
    if ErrorLevel = 2
      MsgBox EnterTwnBtn: Could not conduct the search.
    else if ErrorLevel = 1
    {
      ; It's not here.. do nothing
    }
    else
    {
      Click %MECX%,%MECY%
    }
  }
}

LeaveTown() {
  Click 101,548
  
  Sleep, 1000
  ImageSearch, MLTX,MLTY,  44,350, 340,446, J:\Games\SHS\SHS-LeaveTownButton.png
  if ErrorLevel = 2
    MsgBox LevTwnBtn: Could not conduct the search.
  else if ErrorLevel = 1
  {
    ; It's not here.. do nothing
  }
  else
  {
    Click %MLTX%,%MLTY%
  }
}

TravelNorth() {
    ImageSearch, MNX,MNY, 50,600, 1035,718, J:\Games\SHS\SHS-NorthExitSign.png
    if ErrorLevel = 2
      MsgBox NorthExitSgn: Could not conduct the search.
    else if ErrorLevel = 1
    {
      ImageSearch, MNX,MNY, 50,600, 1035,718, J:\Games\SHS\SHS-NorthExitSign2.png
      if ErrorLevel = 2
        MsgBox Could not conduct the search.
      else if ErrorLevel = 1
      {
       ; Placeholder
      }
      else
      {
        Click %MNX%,%MNY%
      }
    }
    else
    {
      Click %MNX%,%MNY%
    }
}

TravelSouth() {
  ImageSearch, MSX,MSY, 50,600, 1035,718, J:\Games\SHS\SHS-SouthExitSign.png
  if ErrorLevel = 2
    MsgBox Could not conduct the search.
  else if ErrorLevel = 1
  {
    ImageSearch, MSX,MSY, 50,600, 1035,718, J:\Games\SHS\SHS-SouthExitSign2.png
    if ErrorLevel = 2
      MsgBox Could not conduct the search.
    else if ErrorLevel = 1
    {
     ; Placeholder
    }
    else
    {
      Click %MSX%,%MSY%
    }
  }
  else
  {
    Click %MSX%,%MSY%
  }
}

TravelEastEdge() {
  FoundExt := false
  while not FoundExt
  {
    if (BreakLoop = 1)
      FoundExt := true

    MoveEastEdge()
    Sleep, 1000

    ImageSearch, MEX,MEY,  40,200, 1040,640, J:\Games\SHS\SHS-FeetButton3.png
    if ErrorLevel = 2
      MsgBox Could not conduct the search.
    else if ErrorLevel = 1
    {
      ImageSearch, MEX,MEY,  40,200, 1040,640, J:\Games\SHS\SHS-FeetButton2.png
      if ErrorLevel = 2
        MsgBox Could not conduct the search.
      else if ErrorLevel = 1
      {
        ImageSearch, MEX,MEY, 40,200, 1040,640, J:\Games\SHS\SHS-EastSideExitSign.png
        if ErrorLevel = 2
          MsgBox Could not conduct the search.
        else if ErrorLevel = 1
        {
          ImageSearch, MEX,MEY, 40,200, 1040,640,J:\Games\SHS\SHS-EastSideExitSign2.png
          if ErrorLevel = 2
            MsgBox Could not conduct the search.
          else if ErrorLevel = 1
          {
            ImageSearch, MEX,MEY, 40,200, 1040,640, J:\Games\SHS\SHS-EastSideExitSign3.png
            if ErrorLevel = 2
              MsgBox Could not conduct the search.
            else if ErrorLevel = 1
            {
             ; whompwhomp
            }
            else
            {
              Click %MEX%,%MEY%
              FoundExt := true
            }

          }
          else
          {
            Click %MEX%,%MEY%
            FoundExt := true
          }
        
        }
        else
        {
          Click %MEX%,%MEY%
          FoundExt := true
        }
      
      }
      else
      {
        Click %MEX%,%MEY%
        FoundExt := true
      }
    }
    else
    {
      Click %MEX%,%MEY%
      FoundExt := true
    }
  }  
}

TravelWestEdge() {
  FoundExt := false
  while not FoundExt
  {
    if (BreakLoop = 1)
      FoundExt := true
    
    MoveWestEdge()
    Sleep, 1000

    ImageSearch, MWX,MWY, 50,600, 1035,718, J:\Games\SHS\SHS-WestSideExitSign.png
    if ErrorLevel = 2
      MsgBox Could not conduct the search.
    else if ErrorLevel = 1
    {
      ImageSearch, MEX,MEY, 45,200, 1040,640, J:\Games\SHS\SHS-FeetButton.png
      if ErrorLevel = 2
        MsgBox Could not conduct the search.
      else if ErrorLevel = 1
      {
        ImageSearch, MEX,MEY, 45,200, 1040,640, J:\Games\SHS\SHS-FeetButton2.png
        if ErrorLevel = 2
          MsgBox Could not conduct the search.
        else if ErrorLevel = 1
        {
          ; whompwhomp
        }
        else
        {
          Click %MEX%,%MEY%
          FoundExt := true
        }
      }
      else
      {
        Click %MEX%,%MEY%
        FoundExt := true
      }
    }
    else
    {
      Click %MWX%,%MWY%
      FoundExt := true
    }
  }  
}

ClickDefeated() {

  ImageSearch, DfX,DfY, 45,320, 1000,700, J:\Games\SHS\SHS-DefeatedBnr.png
  if ErrorLevel = 2
    MsgBox Could not conduct the search.
  else if ErrorLevel = 1
    MsgBox No Defeated banner found.
  else
  {
    ClickLeaveArea()
  }
}

ClickLeaveArea() {
  ImageSearch, DflX,DflY, 45,320, 1000,700, J:\Games\SHS\SHS-LeaveAreaBtn.png
  if ErrorLevel = 2
    MsgBox Could not conduct the search.
  else if ErrorLevel = 1
    MsgBox No Leave Area found.
  else
  {
      Click %DflX%,%DflY%
  }

}

ClickWRAttack() {
  ImageSearch, WRAX, WRAY, 22,196, 1040,1050, *40 *TransWhite J:\Games\SHS\WarroomAttackBtn.png
  if ErrorLevel = 2
    MsgBox ClickWRAttack: Could not conduct the search.
  else if ErrorLevel = 1
;    MsgBox ClickWRAttack: No Attack button found.
     ClickWRDefend()
  else
  {
    Click %WRAX%, %WRAY%
  }
}


ClickWRDefend() {
  ImageSearch, WRAX, WRAY, 22,196, 1040,1050, *40 *TransWhite J:\Games\SHS\WarroomDefendBtn.png
  if ErrorLevel = 2
    MsgBox ClickWRDefend: Could not conduct the search.
  else if ErrorLevel = 1
;    MsgBox ClickWRDefend: No Defend button found.
    ClickWRDeploy()
  else
  {
    Click %WRAX%, %WRAY%
  }
}

ClickWRDeploy() {
  ImageSearch, WRAX, WRAY, 22,196, 1040,1050, *40 *TransWhite J:\Games\SHS\WarroomDeployBtn.png
  if ErrorLevel = 2
    MsgBox ClickWRDeploy: Could not conduct the search.
  else if ErrorLevel = 1
    MsgBox ClickWRDeploy: No Deploy button found.
  else
  {
    Click %WRAX%, %WRAY%
  }
}

CheckAutoSlash() {
  ImageSearch, ASFX,ASFY, 42,270, 1000,700, J:\Games\SHS\SHS-AutoSlashOff.png
  if ErrorLevel = 2
    MsgBox Could not conduct the search.
  else if ErrorLevel = 1
    MsgBox No AutoSlash Off button found.
  else
  {
      Click %ASFX%,%ASFY%
  }

}

;MouseWrapper() {
;
 ; WinGetActiveTitle, Title
 ; if (Title = "Play Straw Hat Samurai: Duels, a free online game on Kongregate - Google Chrome")
 ; {
 ; }
;}


SKasuKuchiField() {
  ; ---------- South Kasukuchi Field
  ImageSearch, OKX,OKY, 41,314 , 319,358, J:\Games\SHS\SHS-SKasukuchiF-LocBanner.png
  if ErrorLevel = 2
    MsgBox Could not conduct the search.
  else
  { ; Found to be in S Kasukuchi Field, attempt to go East then Back
    FoundExt := false
    while not FoundExt
    {
      if (BreakLoop = 1)
        break
       
      MoveEastEdge()
      RSleep(2000,3000)
      ImageSearch, OXX,OXY, 47,378 , 315,416, J:\Games\SHS\SHS-SEKasukuchiFE-ExtBtn.png  
      if ErrorLevel = 2
        MsgBox Could not conduct the search.
      else
      {
        Click %OXX%,%OXY%
        FoundExt := true
        RSleep(4000,6000)
        MoveWestEdge()
        RSleep(2000,4000)
        ImageSearch, OXX,OXY, 47,378 , 315,416, J:\Games\SHS\SHS-SKasukuchiF-ExtBtn.png  
        if ErrorLevel = 2
          MsgBox Could not conduct the search.
        else
        {
          Click %OXX%,%OXY%
        }
      }
    }
  }
  ; ----------END South Kasukuchi Field
}



clicken:

  click down
  sleep 50
  click up
return
