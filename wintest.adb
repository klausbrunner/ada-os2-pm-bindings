-- A small test program for the OS/2 bindings package R 0.4
-- 
-- build (GNAT 3.05)
--	gnatmake wintest.adb
--      emxbind -ep wintest

with OS2; use OS2;
with Interfaces.C.Strings; use Interfaces.C.Strings;

procedure WinTest is 
   Anchor_Block:	HAB;
   Message_Q:		HMQ;
   Frame_Window:	HWND;
   Q_Message:		PQMSG := new QMSG;
   Window_Style:	PULONG;   
   BOOL_Result:		BOOL; 
   Window_Class:	PCSZ := New_String("MyWindow_Class");
   Window_Title:	PCSZ := New_String("A Window of MyWindow_Class");
   ULONG_Result:	ULONG;
   PS:			HPS;


   -- the Message Handler
   function Window_Procedure(Handle : HWND; 
                             Message: ULONG; 
                             Param_1: MPARAM; 
                             Param_2: MPARAM) return MRESULT is
      Coords:		PPOINTL := new POINTL;
      LONG_Result:	LONG;
      Help_Text:	PCSZ := New_String("Click-move-release mouse " &
                                           "button 1 or 2 to draw lines " &
                                           "or boxes.");   
   begin
      case Message is

         when WM_PAINT =>
             PS := WinBeginPaint(Handle, NULLHANDLE, NULL);
             BOOL_Result :=  GpiSetBackMix(PS, BM_OVERPAINT);

             Coords.x := 10;
             Coords.y := 10;
             BOOL_Result   := GpiSetColor(PS, CLR_BLACK);
             LONG_Result   := GpiCharStringAt(PS,
                                              Coords,
                                              LONG(Strlen(Help_Text)),
                                              Help_Text);
                                    
             return OS2.FALSE;

         when WM_BUTTON1DOWN | WM_BUTTON2DOWN =>
             Coords.x := LONG(SHORT1FROMMP(Param_1));
             Coords.y := LONG(SHORT2FROMMP(Param_1));
             BOOL_Result := GpiSetCurrentPosition(PS, Coords);
             return OS2.FALSE;

         when WM_BUTTON1UP =>
             Coords.x := LONG(SHORT1FROMMP(Param_1));
             Coords.y := LONG(SHORT2FROMMP(Param_1));
             BOOL_Result   := GpiSetColor(PS, CLR_BLUE);
             LONG_Result   := GpiLine(PS, Coords);
             return OS2.FALSE;

         when WM_BUTTON2UP =>
             Coords.x := LONG(SHORT1FROMMP(Param_1));
             Coords.y := LONG(SHORT2FROMMP(Param_1));
             BOOL_Result   := GpiSetColor(PS, CLR_RED);
             LONG_Result   := GpiBox(PS, DRO_FILL, Coords, 0, 0);
             return OS2.FALSE;             

         when WM_ERASEBACKGROUND =>
             return OS2.TRUE;

         when WM_CLOSE =>
             BOOL_Result := WinEndPaint(PS);

             ULONG_Result := WinMessageBox(HWND_DESKTOP, 
                                      Handle,
                                      New_String("Thanks for making a " &
                                                 "simple program very happy."),
                                      New_String("Goodbye"),
                                      0,
                                      MB_OK+MB_MOVEABLE+MB_ICONEXCLAMATION);

             return WinDefWindowProc(Handle, Message, Param_1, Param_2);
         when others =>
             return WinDefWindowProc(Handle, Message, Param_1, Param_2);
      end case;
   end Window_Procedure;



begin
 
   Window_Style := new ULONG'(FCF_TITLEBAR+
                              FCF_SIZEBORDER+
                              FCF_MINMAX+
                              FCF_SYSMENU+
                              FCF_VERTSCROLL+
                              FCF_HORZSCROLL+
                              FCF_TASKLIST+
                              FCF_SHELLPOSITION);
   
   Anchor_Block := WinInitialize(0);
   Message_Q := WinCreateMsgQueue(Anchor_Block, 0);

   
   BOOL_Result := WinRegisterClass(Anchor_Block, 
                                   Window_Class, 		
	                         
                                   Window_Procedure'Unrestricted_Access,
                                   -- quick'n dirty ^^^^^^^^^^^^^^^^^^^

                                   CS_SIZEREDRAW,
                                   0);

   Frame_Window := WinCreateStdWindow(HWND_DESKTOP,
                                    WS_VISIBLE,
                                    Window_Style, 	
                                    Window_Class,	
 				    Window_Title, 	
				    WS_VISIBLE,
				    0,
				    0,
				    NULL);


   BOOL_Result := BOOL(WinSendMsg(Frame_Window, 
                             WM_SETICON, 
                             MPARAM(WinQuerySysPointer(HWND_DESKTOP, 
                                                       SPTR_ICONINFORMATION, 
                                                       0)),
                             0));

   while WinGetMsg(Anchor_Block, Q_Message, NULLHANDLE, 0, 0) = OS2.TRUE
      loop
         BOOL_Result:= BOOL(WinDispatchMsg(Anchor_Block, Q_Message));
      end loop;

   BOOL_Result := WinDestroyWindow(Frame_Window);
   BOOL_Result := WinDestroyMsgQueue(Message_Q);
   BOOL_Result := WinTerminate(Anchor_Block);

end WinTest;

-- eof
