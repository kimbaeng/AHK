#SingleInstance Force
gui, color, FFFFFF 
Gui, Add, CheckBox, x12 y9 w90 h20 v수큐,    수상한 큐브
Gui, Add, CheckBox, x12 y29 w90 h20 v순백,   순백줌 10`%
Gui, Add, Edit, x102 y9 w100 h20 v수큐가격,  360000
Gui, Add, Edit, x102 y29 w100 h20 v순백가격, 5555555
Gui, Add, Text, x26 y75 w200 h20 , 시작:F1    일시정지/재시작:F2
Gui, Show,h90 w221,                          경매장
Return
GuiClose:
ExitApp

F1::

gui,submit,nohide
goto, 수큐체크

수큐체크:
sleep, 100
if (수큐=1)
{

    ;//아이템이름칸 공백 시작
    click, 216, 417
    send, {shift down}
    send, {home}
    sleep,20
    send, {shift up}
    send, {backspace}
    
    ;//아이템이름 입력 시작
    clipboard=수상한큐브
    click, 216, 417
    send, {shift down}
    send, {insert}
    sleep,20
    send, {shift up}
    ;//아이템이름 입력 끝

    ;//가격칸 공백 시작
    click, 245, 445
    send, {shift down}
    send, {home}
    sleep,20
    send, {shift up}
    send, {backspace}
    ;//가격칸 공백 끝

    ;//가격칸 입력 시작
    click, 245, 445
    clipboard=%수큐가격%
    send, {shift down}
    send, {insert}
    sleep,20
    send, {shift up}
    ;//가격칸 입력 끝
    goto, 수상한큐브
}

순백체크:
sleep, 100
if (순백=1)
{
    click, 216, 417
    send, {shift down}
    send, {home}
    sleep,20
    send, {shift up}
    send, {backspace}
    

    clipboard=순백의주문서10
    click, 216, 417
    send, {shift down}
    send, {insert}
    sleep,20
    send, {shift up}



    click, 245, 445
    send, {shift down}
    send, {home}
    sleep,20
    send, {shift up}
    send, {backspace}
    click, 245, 445
    clipboard=%순백가격%
    send, {shift down}
    send, {insert}
    sleep,20
    send, {shift up}

    goto, 순백의주문서
}

수상한큐브:
sleep, 100
loop, 5
{
    click, 134, 513
    send, {enter down}
    sleep, 100
    send, {enter up}

    ImageSearch, vx, vy , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 수상한큐브.png
    sleep, 100
    if ErrorLevel=0
    {
        click, 535,236
        sleep, 100
        click, 937, 716
        sleep, 100
        click, 470,422
        send,{backspace}
        clipboard=100
        send, {shift down}
        send, {insert}
        sleep, 20
        send, {shift up}
        send, {enter}
        send, {enter down}
        sleep, 100
        send, {enter up}
    }
}
send, {enter}
goto, 순백체크

순백의주문서:
sleep, 100
loop, 5
{
    click, 134, 513
    send, {enter down}
    sleep, 100
    send, {enter up}

    ImageSearch, vx, vy , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 순백.png
    sleep, 100
    if ErrorLevel=0
    {
        click, 535,236
        sleep, 100
        click, 937, 716
        sleep, 100
        click, 470,422
        send,{backspace}
        clipboard=100
        send, {shift down}
        send, {insert}
        sleep, 20
        send, {shift up}
        send, {enter}
        send, {enter down}
        sleep, 100
        send, {enter up}
    }
}
send, {enter}
goto, 수큐체크

F2::
Pause
gui, Submit, NoHide
return

F3::
Reload
