-- THIN ADA 95 BINDINGS TO THE OS/2 API, R 0.4
-- 
-- File:   OS2.ADB (body)
--
-- Editor: Klaus A. Brunner, <kbrun@ibm.net>
-- Build:  gcc -c os2.adb (GNAT 3.01)
-- Note:   See the README.TXT file for additional information
--


with Unchecked_Conversion;

package body OS2 is

   --------------------- type conversion ---------------------------

   type Four_Chars is
      record
         char1: CHAR;
         char2: CHAR;
         char3: CHAR;
         char4: CHAR;
      end record;

    function CHARSFROMMP is
       new Unchecked_Conversion(Source => MPARAM, Target => Four_Chars);

    function CHAR1FROMMP(mp: MPARAM) return CHAR is
    begin
       return CHARSFROMMP(mp).char1;
    end CHAR1FROMMP;

    function CHAR2FROMMP(mp: MPARAM) return CHAR is
    begin
       return CHARSFROMMP(mp).char2;
    end CHAR2FROMMP;

    function CHAR3FROMMP(mp: MPARAM) return CHAR is
    begin
       return CHARSFROMMP(mp).char3;
    end CHAR3FROMMP;

    function CHAR4FROMMP(mp: MPARAM) return CHAR is
    begin
       return CHARSFROMMP(mp).char4;
    end CHAR4FROMMP;

   --

   type Two_Shorts is
      record
         short1: SHORT;
         short2: SHORT;
      end record;

    function SHORTSFROMMP is new
       Unchecked_Conversion(Source => MPARAM, Target => Two_Shorts);

    function SHORT1FROMMP(mp: MPARAM) return SHORT is
    begin
       return SHORTSFROMMP(mp).short1;       
    end SHORT1FROMMP;

    function SHORT2FROMMP(mp: MPARAM) return SHORT is
    begin
       return SHORTSFROMMP(mp).short2;       
    end SHORT2FROMMP;

   --

    function MPFROMSHORTS is new
       Unchecked_Conversion(Source => Two_Shorts, Target => MPARAM);

    function MPFROMSHORT(s: SHORT) return MPARAM is       
    begin
       return MPFROMLONG(LONG(s));
    end;

    function MPFROMCHAR(c: CHAR) return MPARAM is
    begin
       return MPFROMLONG(LONG(c));
    end;

    function MPFROM2SHORT(s1: SHORT; s2: SHORT) return MPARAM is
    begin
       return MPFROMSHORTS(Two_Shorts'(s1, s2));
    end;

    function MRFROMSHORT(s: SHORT) return MRESULT is
    begin
       return MRESULT(MPFROMSHORT(s));
    end;       

    function MRFROM2SHORT(s1: SHORT; s2: SHORT) return MRESULT is
    begin
       return MRESULT(MPFROM2SHORT(s1, s2));
    end;
  

    function SHORTSFROMMR is
       new Unchecked_Conversion(Source => MRESULT, Target => Two_Shorts);

    function SHORT1FROMMR(mr: MRESULT) return SHORT is
    begin
       return SHORTSFROMMR(mr).Short1;
    end;

    function SHORT2FROMMR(mr: MRESULT) return SHORT is
    begin
       return SHORTSFROMMR(mr).Short2;
    end;


    -- controls (general)
    
    function WinEnableControl(hwndDlg: HWND;
                              id:      ULONG;
                              fEnable: BOOL) return BOOL is
    begin
       return WinEnableWindow(WinWindowFromID(hwndDlg, id), fEnable);
    end WinEnableControl;

    function WinIsControlEnabled(hwndDlg: HWND;
                                 id:      ULONG) return BOOL is
    begin
       return BOOL(WinIsWindowEnabled(WinWindowFromID(hwndDlg, id)));
    end WinIsControlEnabled;

    -- buttons/checkboxes

    function WinCheckButton(hwndDlg:      HWND;
                            id:           ULONG;
                            usCheckState: USHORT) return USHORT is
    begin
       return USHORT(WinSendDlgItemMsg(hwndDlg, id, BM_SETCHECK,
                                      MPFROMSHORT(SHORT(usCheckState)), 
                                      MPARAM(0)));
    end WinCheckButton;

    function WinQueryButtonCheckstate(hwndDlg: HWND;
                                      id:      ULONG) return USHORT is
    begin
       return USHORT(WinSendDlgItemMsg(hwndDlg, id, BM_QUERYCHECK,
                                      MPARAM(0), MPARAM(0)));
    end WinQueryButtonCheckstate;

    -- listbox controls

    function WinDeleteLboxItem(hwndLbox: HWND;
                               index:    LONG) return LONG is
    begin
       return LONG(WinSendMsg(hwndLbox, LM_DELETEITEM, MPFROMLONG(index),
                   MPARAM(0)));
    end WinDeleteLboxItem;

    function WinInsertLboxItem(hwndLbox: HWND;
                               index:    LONG;
                               psz_psz:  PSZ) return LONG is
    begin
       return LONG(WinSendMsg(hwndLbox, LM_INSERTITEM, MPFROMLONG(index),
                   MPFROMP(psz_psz)));
    end WinInsertLboxItem;

    function WinQueryLboxCount(hwndLbox: HWND) return LONG is
    begin
       return LONG(WinSendMsg(hwndLbox, LM_QUERYITEMCOUNT, MPARAM(0),
                   MPARAM(0)));
    end WinQueryLboxCount;

    function WinQueryLboxItemText(hwndLbox: HWND;
                                  index:    LONG;
                                  psz_psz:  PSZ;
                                  cchMax:   SHORT) return LONG is
    begin
       return LONG(WinSendMsg(hwndLbox, LM_QUERYITEMTEXT, 
                              MPFROM2SHORT(SHORT(index), cchMax),
                              MPFROMP(psz_psz)));
    end WinQueryLboxItemText;

    function WinQueryLboxItemTextLength(hwndLbox: HWND;
                                        index:    LONG) return LONG is
    begin
       return LONG(WinSendMsg(hwndLbox, LM_QUERYSELECTION, 
                              MPFROMLONG(LIT_FIRST), MPARAM(0)));
    end WinQueryLboxItemTextLength;
 
    function WinQueryLboxSelectedItem(hwndLbox: HWND) return LONG is
    begin
       return LONG(WinSendMsg(hwndLbox, LM_QUERYSELECTION, 
                   MPFROMLONG(LIT_FIRST), MPARAM(0)));
    end WinQueryLboxSelectedItem;

    function WinSetLboxItemText(hwndLbox: HWND;
                                index:    LONG;
                                psz_psz:  PSZ) return BOOL is 
    begin
       return BOOL(WinSendMsg(hwndLbox, LM_SETITEMTEXT, MPFROMLONG(index),
                              MPFROMP(psz_psz)));
    end WinSetLboxItemText;


    -- menu windows


    function WinCheckMenuItem(hwndMenu: HWND;
                              id:       ULONG;
                              fcheck:   BOOL) return BOOL is 
       checkval: SHORT;
    begin
       if fcheck = OS2.TRUE then
          checkval := MIA_CHECKED;
       else
          checkval := 0;
       end if;
       return BOOL(WinSendMsg(hwndMenu, MM_SETITEMATTR,
                              MPFROM2SHORT(SHORT(id), OS2.TRUE),
                              MPFROM2SHORT(SHORT(MIA_CHECKED), checkval)));
    end WinCheckMenuItem;

    function WinEnableMenuItem(hwndMenu: HWND;
                               id:       ULONG;
                               fEnable:  BOOL) return BOOL is
      enable_val: SHORT;
    begin
       if fEnable = OS2.TRUE then
          enable_val := 0;
       else
          enable_val := MIA_DISABLED;
       end if;
       return BOOL(WinSendMsg(hwndMenu, MM_SETITEMATTR,
                   MPFROM2SHORT(SHORT(id), OS2.TRUE),
                   MPFROM2SHORT(SHORT(MIA_DISABLED), enable_val)));
                   
    end WinEnableMenuItem;

    function WinIsMenuItemChecked(hwndMenu: HWND;
                                  id:       ULONG) return BOOL is
    begin
       return BOOL(WinSendMsg(hwndMenu, MM_QUERYITEMATTR,
                             MPFROM2SHORT(SHORT(id), OS2.TRUE),
                             MPFROMLONG(MIA_CHECKED)));
    end WinIsMenuItemChecked;

    function WinIsMenuItemEnabled(hwndMenu: HWND;
                                  id:       ULONG) return BOOL is
    begin
       if BOOL(WinSendMsg(hwndMenu, MM_QUERYITEMATTR,
                             MPFROM2SHORT(SHORT(id), OS2.TRUE),
                             MPFROMLONG(MIA_DISABLED))) = OS2.TRUE then
          return OS2.FALSE;
       else
          return OS2.TRUE;
       end if;
       
    end WinIsMenuItemEnabled;
    
    function WinIsMenuItemValid(hwndMenu: HWND;
                                id:       ULONG) return BOOL is
    begin
       return BOOL(WinSendMsg(hwndMenu, MM_ISITEMVALID,
                              MPFROM2SHORT(SHORT(id), OS2.TRUE),
                              MPFROMLONG(OS2.FALSE)));
    end WinIsMenuItemValid;

    function WinSetMenuItemText(hwndMenu: HWND;
                                id:       ULONG;
                                psz_psz:  PSZ) return BOOL is
    begin
       return BOOL(WinSendMsg(hwndMenu, MM_SETITEMTEXT,
                              MPFROMLONG(LONG(id)), MPFROMP(psz_psz)));
    end WinSetMenuItemText;


end OS2;

-- eof
