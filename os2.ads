-- THIN ADA 95 BINDINGS TO THE OS/2 API, R 0.4
-- 
-- File:   OS2.ADS (spec)
--
-- Editor: Klaus A. Brunner, <kbrun@ibm.net>
-- Build:  gcc -c os2.adb (GNAT 3.01)
-- Note:   See the README.TXT file for additional information
--


with Interfaces.C.Strings;
with System;
with Unchecked_Conversion;


package OS2 is

   Pragma Preelaborate(OS2);

   package C renames Interfaces.C;


   type OS2_unsigned_int	is new Interfaces.Unsigned_32;
   type OS2_signed_int		is new Interfaces.Integer_32;
   type OS2_unsigned_short	is new Interfaces.Unsigned_16;
   type OS2_signed_short	is new Interfaces.Integer_16;
 
   type OS2_signed_char		is new Interfaces.C.signed_char; 
   type OS2_unsigned_char	is new Interfaces.C.unsigned_char; 


   -- typedefs

   subtype INT is OS2_signed_int;
   subtype UINT is OS2_unsigned_int;
   type APIRET is new OS2_unsigned_int;
   type BOOL is new OS2_unsigned_int;
   type BOOL32 is new OS2_unsigned_int;
   subtype CHAR is OS2_signed_char;
   subtype BYTE is OS2_unsigned_char;
   subtype UCHAR is OS2_unsigned_char;
   subtype SHORT is OS2_signed_short;
   subtype USHORT is OS2_unsigned_short;
   subtype LONG is OS2_signed_int;
   subtype ULONG is OS2_unsigned_int;
   type SHANDLE is new OS2_unsigned_short;
   type LHANDLE is new OS2_unsigned_int;
   type HPIPE is new OS2_unsigned_int;
   type HQUEUE is new OS2_unsigned_int;
   type HMODULE is new OS2_unsigned_int;
   type HOBJECT is new OS2_unsigned_int;
   type PID is new OS2_unsigned_int;
   type TID is new OS2_unsigned_int;
   type SEL is new OS2_unsigned_short;
   type HMTX is new OS2_unsigned_int;
   type HMUX is new OS2_unsigned_int;
   type HEV is new OS2_unsigned_int;
   type HACCEL is new OS2_unsigned_int;
   type HRGN is new OS2_unsigned_int;
   type HPOINTER is new OS2_unsigned_int;
   type HLIB is new OS2_unsigned_int;
   type COLOR is new OS2_signed_int;
   type HAB is new OS2_unsigned_int;
   type HPS is new OS2_unsigned_int;
   type HDC is new OS2_unsigned_int;
   type HWND is new OS2_unsigned_int;
   type HMQ is new OS2_unsigned_int;
   type HPAL is new OS2_unsigned_int;
   type HBITMAP is new OS2_unsigned_int;
   type ERRORID is new OS2_unsigned_int;
   type HSAVEWP is new OS2_unsigned_int;
   type HENUM is new OS2_unsigned_int;
   type HATOMTBL is new OS2_unsigned_int;
   type ATOM is new OS2_unsigned_int;
   type IPT is new OS2_signed_int;
   type PIX is new OS2_signed_int;
   type LINE is new OS2_unsigned_int;
   type FIXED is new OS2_signed_int;
   type HMF is new OS2_unsigned_int;
   type HSWITCH is new OS2_unsigned_int;
   type HPROGRAM is new OS2_unsigned_int;
   type HINI is new OS2_unsigned_int;
   type HAPP is new OS2_unsigned_int;
   type PROGCATEGORY is new OS2_unsigned_int;
   type HSTR is new OS2_unsigned_int;
   type HSPL is new OS2_unsigned_int;
   type HSTD is new OS2_unsigned_int;
   type SPLERR is new OS2_unsigned_int;
   type HELPSUBTABLE is new OS2_unsigned_short;
   type HVPS is new OS2_unsigned_short;

   type PBOOL is access all BOOL;
   type PBOOL32 is access all BOOL;

   subtype PCHAR is C.Strings.chars_ptr;	-- some of these might be
   subtype PCH is C.Strings.chars_ptr;		--   better replaced by 
   subtype PSZ is C.Strings.chars_ptr;		--   "access all CHAR/BYTE..."
   subtype PCCH is C.Strings.chars_ptr;
   subtype PCSZ is C.Strings.chars_ptr;
   subtype PBYTE is C.Strings.chars_ptr;
   subtype PUCHAR is C.Strings.chars_ptr;

   type PSHORT is access all SHORT;
   type PUSHORT is access all USHORT;
   type PLONG is access all LONG;
   type PULONG is access all ULONG;
   subtype PVOID is System.Address;
   type PPVOID is access all PVOID;
   subtype CPVOID is PVOID;
   type PHPIPE is access all HPIPE;
   type PHQUEUE is access all HQUEUE;
   type PHMODULE is access all HMODULE;
   type HSEM is new ULONG;
   type PHSEM is access all HSEM;
   type PPID is access all PID;
   type PTID is access all TID;
   type PSEL is access all SEL;
   type PHMTX is access all HMTX;
   type PHMUX is access all HMUX;
   type PHEV is access all HEV;
   type PHRGN is access all HRGN;
   type MRESULT is new ULONG;
   type MPARAM is new ULONG;
   type PHLIB is access all HLIB;
   type PCOLOR is access all COLOR;
   type PHAB is access all HAB;
   type PHPS is access all HPS;
   type PHDC is access all HDC;
   type PHWND is access all HWND;
   type PHPAL is access all HPAL;
   type PHBITMAP is access all HBITMAP;
   type PERRORID is access all ERRORID;
   type FNWP is access all MRESULT;
   type PIPT is access all IPT;
   subtype PBUNDLE is System.Address;
   type PFIXED is access all FIXED;
   type PHMF is access all HMF;
   type PDEVOPENDATA is access all PSZ;
   type PHSWITCH is access all HSWITCH;
   type PHPROGRAM is access all HPROGRAM;
   type PHINI is access all HINI;
   type PPROGCATEGORY is access all PROGCATEGORY;
   type PPSZ is access all PSZ;
   type PHSTD is access all HSTD;
   type PQMOPENDATA is access all PSZ;
   type PHELPSUBTABLE is access all HELPSUBTABLE;
   type HDDF is new ULONG;
   type PHVPS is access all HVPS;


   FALSE                : constant := 8#0000#;
   TRUE                 : constant := 1;
   NULLHANDLE           : constant := 0;
   NULLSHANDLE          : constant := 0;
   WINERR_BASE          : constant := 16#1000#;
   GPIERR_BASE          : constant := 16#2000#;
   DEVERR_BASE          : constant := 16#3000#;
   SPLERR_BASE          : constant := 16#4000#;
   SEVERITY_NOERROR     : constant := 16#0000#;
   SEVERITY_WARNING     : constant := 16#0004#;
   SEVERITY_ERROR       : constant := 16#0008#;
   SEVERITY_SEVERE      : constant := 16#000C#;
   SEVERITY_UNRECOVERABLE: constant := 16#0010#;
   NO_ERROR              : constant := 8#0000#;
   ERRLOC_MEM                           : constant := 5;
   FERR_DISABLEHARDERR                  : constant := 16#0000#;
   FERR_ENABLEHARDERR                   : constant := 16#0001#;
   FERR_ENABLEEXCEPTION                 : constant := 16#0000#;
   FERR_DISABLEEXCEPTION                : constant := 16#0002#;
   FACESIZE                             : constant := 16#0020#;
   FATTR_SEL_ITALIC                     : constant := 16#0001#;
   FATTR_SEL_UNDERSCORE                 : constant := 16#0002#;
   FATTR_SEL_OUTLINE                    : constant := 16#0008#;
   FATTR_SEL_STRIKEOUT                  : constant := 16#0010#;
   FATTR_SEL_BOLD                       : constant := 16#0020#;
   FATTR_TYPE_KERNING                   : constant := 16#0004#;
   FATTR_TYPE_MBCS                      : constant := 16#0008#;
   FATTR_TYPE_DBCS                      : constant := 16#0010#;
   FATTR_TYPE_ANTIALIASED               : constant := 16#0020#;
   FATTR_FONTUSE_NOMIX                  : constant := 16#0002#;
   FATTR_FONTUSE_OUTLINE                : constant := 16#0004#;
   FATTR_FONTUSE_TRANSFORMABLE          : constant := 16#0008#;
   FM_TYPE_FIXED                        : constant := 16#0001#;
   FM_TYPE_LICENSED                     : constant := 16#0002#;
   FM_TYPE_KERNING                      : constant := 16#0004#;
   FM_TYPE_DBCS                         : constant := 16#0010#;
   FM_TYPE_MBCS                         : constant := 16#0018#;
   FM_TYPE_64K                          : constant := 16#8000#;
   FM_TYPE_ATOMS                        : constant := 16#4000#;
   FM_TYPE_FAMTRUNC                     : constant := 16#2000#;
   FM_TYPE_FACETRUNC                    : constant := 16#1000#;
   FM_DEFN_OUTLINE                      : constant := 16#0001#;
   FM_DEFN_IFI                          : constant := 16#0002#;
   FM_DEFN_WIN                          : constant := 16#0004#;
   FM_DEFN_GENERIC                      : constant := 16#8000#;
   FM_SEL_ITALIC                        : constant := 16#0001#;
   FM_SEL_UNDERSCORE                    : constant := 16#0002#;
   FM_SEL_NEGATIVE                      : constant := 16#0004#;
   FM_SEL_OUTLINE                       : constant := 16#0008#;
   FM_SEL_STRIKEOUT                     : constant := 16#0010#;
   FM_SEL_BOLD                          : constant := 16#0020#;
   FM_SEL_ISO9241_TESTED                : constant := 16#0040#;
   FM_CAP_NOMIX                         : constant := 16#0001#;
   FM_ISO_9518_640                      : constant := 16#0001#;
   FM_ISO_9515_640                      : constant := 16#0002#;
   FM_ISO_9515_1024                     : constant := 16#0004#;
   FM_ISO_9517_640                      : constant := 16#0008#;
   FM_ISO_9517_1024                     : constant := 16#0010#;
   PT_16BIT                             : constant := 8#0000#;
   PT_32BIT                             : constant := 1;
   RT_POINTER                           : constant := 1;
   RT_BITMAP                            : constant := 2;
   RT_MENU                              : constant := 3;
   RT_DIALOG                            : constant := 4;
   RT_STRING                            : constant := 5;
   RT_FONTDIR                           : constant := 6;
   RT_FONT                              : constant := 7;
   RT_ACCELTABLE                        : constant := 8;
   RT_RCDATA                            : constant := 9;
   RT_MESSAGE                           : constant := 10;
   RT_DLGINCLUDE                        : constant := 11;
   RT_VKEYTBL                           : constant := 12;
   RT_KEYTBL                            : constant := 13;
   RT_CHARTBL                           : constant := 14;
   RT_DISPLAYINFO                       : constant := 15;
   RT_FKASHORT                          : constant := 16#0010#;
   RT_FKALONG                           : constant := 17;
   RT_HELPTABLE                         : constant := 18;
   RT_HELPSUBTABLE                      : constant := 19;
   RT_FDDIR                             : constant := 20;
   RT_FD                                : constant := 21;
   RT_MAX                               : constant := 22;
   RF_ORDINALID                         : constant := 16#8000_0000#;
   EXIT_THREAD                          : constant := 8#0000#;
   EXIT_PROCESS                         : constant := 1;
   WM_DBCSFIRST                         : constant := 16#00B0#;
   WM_DBCSLAST                          : constant := 16#00CF#;
    WC_FRAME                            : constant := -65535;
    WC_COMBOBOX                         : constant  := -65534;
    WC_BUTTON                           : constant  := -65533;
    WC_MENU                             : constant  := -65532;
    WC_STATIC                           : constant  := -65531;
    WC_ENTRYFIELD                       : constant  := -65530;
    WC_LISTBOX                          : constant  := -65529;
    WC_SCROLLBAR                        : constant  := -65528;
    WC_TITLEBAR                         : constant  := -65527;
    WC_MLE                              : constant  := -65526;
    WC_APPSTAT                          : constant  := -65520;
    WC_KBDSTAT                          : constant  := -65519;
    WC_PECIC                            : constant  := -65518;
    WC_DBE_KKPOPUP                      : constant  := -65517;
    WC_SPINBUTTON                       : constant  := -65504;
    WC_CONTAINER                        : constant  := -65499;
    WC_SLIDER                           : constant  := -65498;
    WC_VALUESET                         : constant  := -65497;
    WC_NOTEBOOK                         : constant  := -65496;
    WC_PENFIRST                         : constant  := -65495;
    WC_PENLAST                          : constant  := -65492;
    WC_MMPMFIRST                        : constant  := -65472;
    WC_MMPMLAST                         : constant  := -65457;
   WS_VISIBLE                           : constant := 16#8000_0000#;
   WS_DISABLED                          : constant := 16#4000_0000#;
   WS_CLIPCHILDREN                      : constant := 16#2000_0000#;
   WS_CLIPSIBLINGS                      : constant := 16#1000_0000#;
   WS_PARENTCLIP                        : constant := 16#0800_0000#;
   WS_SAVEBITS                          : constant := 16#0400_0000#;
   WS_SYNCPAINT                         : constant := 16#0200_0000#;
   WS_MINIMIZED                         : constant := 16#0100_0000#;
   WS_MAXIMIZED                         : constant := 16#0080_0000#;
   WS_ANIMATE                           : constant := 16#0040_0000#;
   WS_GROUP                             : constant := 16#0001_0000#;
   WS_TABSTOP                           : constant := 16#0002_0000#;
   WS_MULTISELECT                       : constant := 16#0004_0000#;
   CS_MOVENOTIFY                        : constant := 16#0001#;
   CS_SIZEREDRAW                        : constant := 16#0004#;
   CS_HITTEST                           : constant := 16#0008#;
   CS_PUBLIC                            : constant := 16#0010#;
   CS_FRAME                             : constant := 16#0020#;
   CS_CLIPCHILDREN                      : constant := 16#2000_0000#;
   CS_CLIPSIBLINGS                      : constant := 16#1000_0000#;
   CS_PARENTCLIP                        : constant := 16#0800_0000#;
   CS_SAVEBITS                          : constant := 16#0400_0000#;
   CS_SYNCPAINT                         : constant := 16#0200_0000#;
   MID_NONE                             : constant := -1;
   MID_ERROR                            : constant := -1;
   DB_PATCOPY                           : constant := 16#0000#;
   DB_PATINVERT                         : constant := 16#0001#;
   DB_DESTINVERT                        : constant := 16#0002#;
   DB_AREAMIXMODE                       : constant := 16#0003#;
   DB_ROP                               : constant := 16#0007#;
   DB_INTERIOR                          : constant := 16#0008#;
   DB_AREAATTRS                         : constant := 16#0010#;
   DB_STANDARD                          : constant := 16#0100#;
   DB_DLGBORDER                         : constant := 16#0200#;
   DBM_NORMAL                           : constant := 16#0000#;
   DBM_INVERT                           : constant := 16#0001#;
   DBM_HALFTONE                         : constant := 16#0002#;
   DBM_STRETCH                          : constant := 16#0004#;
   DBM_IMAGEATTRS                       : constant := 16#0008#;
   CBD_BITS                             : constant := 8#0000#;
   CBD_COMPRESSION                      : constant := 1;
   CBD_DECOMPRESSION                    : constant := 2;
   CBD_COLOR_CONVERSION                 : constant := 16#0001#;
   BCA_UNCOMP                           : constant := 8#0000#;
   BCA_RLE8                             : constant := 1;
   BCA_RLE4                             : constant := 2;
   BCA_HUFFMAN1D                        : constant := 3;
   BCA_RLE24                            : constant := 4;
   BRU_METRIC                           : constant := 8#0000#;
   BRA_BOTTOMUP                         : constant := 8#0000#;
   BRH_NOTHALFTONED                     : constant := 8#0000#;
   BRH_ERRORDIFFUSION                   : constant := 1;
   BRH_PANDA                            : constant := 2;
   BRH_SUPERCIRCLE                      : constant := 3;
   BCE_PALETTE                          : constant := -1;
   BCE_RGB                              : constant := 8#0000#;
   BFT_ICON                             : constant := 16#4349#;
   BFT_BMAP                             : constant := 16#4D42#;
   BFT_POINTER                          : constant := 16#5450#;
   BFT_COLORICON                        : constant := 16#4943#;
   BFT_COLORPOINTER                     : constant := 16#5043#;
   BFT_BITMAPARRAY                      : constant := 16#4142#;
   DT_LEFT                              : constant := 16#0000#;
   DT_QUERYEXTENT                       : constant := 16#0002#;
   DT_UNDERSCORE                        : constant := 16#0010#;
   DT_STRIKEOUT                         : constant := 16#0020#;
   DT_TEXTATTRS                         : constant := 16#0040#;
   DT_EXTERNALLEADING                   : constant := 16#0080#;
   DT_CENTER                            : constant := 16#0100#;
   DT_RIGHT                             : constant := 16#0200#;
   DT_TOP                               : constant := 16#0000#;
   DT_VCENTER                           : constant := 16#0400#;
   DT_BOTTOM                            : constant := 16#0800#;
   DT_HALFTONE                          : constant := 16#1000#;
   DT_MNEMONIC                          : constant := 16#2000#;
   DT_WORDBREAK                         : constant := 16#4000#;
   DT_ERASERECT                         : constant := 16#8000#;
   QW_NEXT                              : constant := 8#0000#;
   QW_PREV                              : constant := 1;
   QW_TOP                               : constant := 2;
   QW_BOTTOM                            : constant := 3;
   QW_OWNER                             : constant := 4;
   QW_PARENT                            : constant := 5;
   QW_NEXTTOP                           : constant := 6;
   QW_PREVTOP                           : constant := 7;
   QW_FRAMEOWNER                        : constant := 8;
   SWP_SIZE                             : constant := 16#0001#;
   SWP_MOVE                             : constant := 16#0002#;
   SWP_ZORDER                           : constant := 16#0004#;
   SWP_SHOW                             : constant := 16#0008#;
   SWP_HIDE                             : constant := 16#0010#;
   SWP_NOREDRAW                         : constant := 16#0020#;
   SWP_NOADJUST                         : constant := 16#0040#;
   SWP_ACTIVATE                         : constant := 16#0080#;
   SWP_DEACTIVATE                       : constant := 16#0100#;
   SWP_EXTSTATECHANGE                   : constant := 16#0200#;
   SWP_MINIMIZE                         : constant := 16#0400#;
   SWP_MAXIMIZE                         : constant := 16#0800#;
   SWP_RESTORE                          : constant := 16#1000#;
   SWP_FOCUSACTIVATE                    : constant := 16#2000#;
   SWP_FOCUSDEACTIVATE                  : constant := 16#4000#;
   SWP_NOAUTOCLOSE                      : constant := 16#8000#;
   AWP_MINIMIZED                        : constant := 16#0001_0000#;
   AWP_MAXIMIZED                        : constant := 16#0002_0000#;
   AWP_RESTORED                         : constant := 16#0004_0000#;
   AWP_ACTIVATE                         : constant := 16#0008_0000#;
   AWP_DEACTIVATE                       : constant := 16#0010_0000#;
    HWND_DESKTOP                        : constant HWND := 1;
    HWND_OBJECT                         : constant HWND := 2;
    HWND_TOP                            : constant HWND := 3;
    HWND_BOTTOM                         : constant HWND := 4;
    HWND_THREADCAPTURE                  : constant HWND := 5;
   EAF_DEFAULTOWNER                     : constant := 16#0001#;
   EAF_UNCHANGEABLE                     : constant := 16#0002#;
   EAF_REUSEICON                        : constant := 16#0004#;
   ICON_FILE                            : constant := 1;
   ICON_RESOURCE                        : constant := 2;
   ICON_DATA                            : constant := 3;
   ICON_CLEAR                           : constant := 4;
   SZDDEFMT_RTF                         : constant string := "Rich Text Format";
   SZDDEFMT_PTRPICT                     : constant string := "Printer_Picture";
   STR_DLLNAME                          : constant string := "keyremap";
   PMERR_INVALID_HWND                   : constant := 16#1001#;
   PMERR_INVALID_HMQ                    : constant := 16#1002#;
   PMERR_PARAMETER_OUT_OF_RANGE         : constant := 16#1003#;
   PMERR_WINDOW_LOCK_UNDERFLOW          : constant := 16#1004#;
   PMERR_WINDOW_LOCK_OVERFLOW           : constant := 16#1005#;
   PMERR_BAD_WINDOW_LOCK_COUNT          : constant := 16#1006#;
   PMERR_WINDOW_NOT_LOCKED              : constant := 16#1007#;
   PMERR_INVALID_SELECTOR               : constant := 16#1008#;
   PMERR_CALL_FROM_WRONG_THREAD         : constant := 16#1009#;
   PMERR_RESOURCE_NOT_FOUND             : constant := 16#100A#;
   PMERR_INVALID_STRING_PARM            : constant := 16#100B#;
   PMERR_INVALID_HHEAP                  : constant := 16#100C#;
   PMERR_INVALID_HEAP_POINTER           : constant := 16#100D#;
   PMERR_INVALID_HEAP_SIZE_PARM         : constant := 16#100E#;
   PMERR_INVALID_HEAP_SIZE              : constant := 16#100F#;
   PMERR_INVALID_HEAP_SIZE_WORD         : constant := 16#1010#;
   PMERR_HEAP_OUT_OF_MEMORY             : constant := 16#1011#;
   PMERR_HEAP_MAX_SIZE_REACHED          : constant := 16#1012#;
   PMERR_INVALID_HATOMTBL               : constant := 16#1013#;
   PMERR_INVALID_ATOM                   : constant := 16#1014#;
   PMERR_INVALID_ATOM_NAME              : constant := 16#1015#;
   PMERR_INVALID_INTEGER_ATOM           : constant := 16#1016#;
   PMERR_ATOM_NAME_NOT_FOUND            : constant := 16#1017#;
   PMERR_QUEUE_TOO_LARGE                : constant := 16#1018#;
   PMERR_INVALID_FLAG                   : constant := 16#1019#;
   PMERR_INVALID_HACCEL                 : constant := 16#101A#;
   PMERR_INVALID_HPTR                   : constant := 16#101B#;
   PMERR_INVALID_HENUM                  : constant := 16#101C#;
   PMERR_INVALID_SRC_CODEPAGE           : constant := 16#101D#;
   PMERR_INVALID_DST_CODEPAGE           : constant := 16#101E#;
   PMERR_UNKNOWN_COMPONENT_ID           : constant := 16#101F#;
   PMERR_UNKNOWN_ERROR_CODE             : constant := 16#1020#;
   PMERR_SEVERITY_LEVELS                : constant := 16#1021#;
   PMERR_INVALID_RESOURCE_FORMAT        : constant := 16#1034#;
   PMERR_NO_MSG_QUEUE                   : constant := 16#1036#;
   PMERR_WIN_DEBUGMSG                   : constant := 16#1037#;
   PMERR_QUEUE_FULL                     : constant := 16#1038#;
   PMERR_LIBRARY_LOAD_FAILED            : constant := 16#1039#;
   PMERR_PROCEDURE_LOAD_FAILED          : constant := 16#103A#;
   PMERR_LIBRARY_DELETE_FAILED          : constant := 16#103B#;
   PMERR_PROCEDURE_DELETE_FAILED        : constant := 16#103C#;
   PMERR_ARRAY_TOO_LARGE                : constant := 16#103D#;
   PMERR_ARRAY_TOO_SMALL                : constant := 16#103E#;
   PMERR_DATATYPE_ENTRY_BAD_INDEX       : constant := 16#103F#;
   PMERR_DATATYPE_ENTRY_CTL_BAD         : constant := 16#1040#;
   PMERR_DATATYPE_ENTRY_CTL_MISS        : constant := 16#1041#;
   PMERR_DATATYPE_ENTRY_INVALID         : constant := 16#1042#;
   PMERR_DATATYPE_ENTRY_NOT_NUM         : constant := 16#1043#;
   PMERR_DATATYPE_ENTRY_NOT_OFF         : constant := 16#1044#;
   PMERR_DATATYPE_INVALID               : constant := 16#1045#;
   PMERR_DATATYPE_NOT_UNIQUE            : constant := 16#1046#;
   PMERR_DATATYPE_TOO_LONG              : constant := 16#1047#;
   PMERR_DATATYPE_TOO_SMALL             : constant := 16#1048#;
   PMERR_DIRECTION_INVALID              : constant := 16#1049#;
   PMERR_INVALID_HAB                    : constant := 16#104A#;
   PMERR_INVALID_HSTRUCT                : constant := 16#104D#;
   PMERR_LENGTH_TOO_SMALL               : constant := 16#104E#;
   PMERR_MSGID_TOO_SMALL                : constant := 16#104F#;
   PMERR_NO_HANDLE_ALLOC                : constant := 16#1050#;
   PMERR_NOT_IN_A_PM_SESSION            : constant := 16#1051#;
   PMERR_MSG_QUEUE_ALREADY_EXISTS       : constant := 16#1052#;
   PMERR_OLD_RESOURCE                   : constant := 16#1055#;
   PMERR_INVALID_PIB                    : constant := 16#1101#;
   PMERR_INSUFF_SPACE_TO_ADD            : constant := 16#1102#;
   PMERR_INVALID_GROUP_HANDLE           : constant := 16#1103#;
   PMERR_DUPLICATE_TITLE                : constant := 16#1104#;
   PMERR_INVALID_TITLE                  : constant := 16#1105#;
   PMERR_HANDLE_NOT_IN_GROUP            : constant := 16#1107#;
   PMERR_INVALID_TARGET_HANDLE          : constant := 16#1106#;
   PMERR_INVALID_PATH_STATEMENT         : constant := 16#1108#;
   PMERR_NO_PROGRAM_FOUND               : constant := 16#1109#;
   PMERR_INVALID_BUFFER_SIZE            : constant := 16#110A#;
   PMERR_BUFFER_TOO_SMALL               : constant := 16#110B#;
   PMERR_PL_INITIALISATION_FAIL         : constant := 16#110C#;
   PMERR_CANT_DESTROY_SYS_GROUP         : constant := 16#110D#;
   PMERR_INVALID_TYPE_CHANGE            : constant := 16#110E#;
   PMERR_INVALID_PROGRAM_HANDLE         : constant := 16#110F#;
   PMERR_NOT_CURRENT_PL_VERSION         : constant := 16#1110#;
   PMERR_INVALID_CIRCULAR_REF           : constant := 16#1111#;
   PMERR_MEMORY_ALLOCATION_ERR          : constant := 16#1112#;
   PMERR_MEMORY_DEALLOCATION_ERR        : constant := 16#1113#;
   PMERR_TASK_HEADER_TOO_BIG            : constant := 16#1114#;
   PMERR_INVALID_INI_FILE_HANDLE        : constant := 16#1115#;
   PMERR_MEMORY_SHARE                   : constant := 16#1116#;
   PMERR_OPEN_QUEUE                     : constant := 16#1117#;
   PMERR_CREATE_QUEUE                   : constant := 16#1118#;
   PMERR_WRITE_QUEUE                    : constant := 16#1119#;
   PMERR_READ_QUEUE                     : constant := 16#111A#;
   PMERR_CALL_NOT_EXECUTED              : constant := 16#111B#;
   PMERR_UNKNOWN_APIPKT                 : constant := 16#111C#;
   PMERR_INITHREAD_EXISTS               : constant := 16#111D#;
   PMERR_CREATE_THREAD                  : constant := 16#111E#;
   PMERR_NO_HK_PROFILE_INSTALLED        : constant := 16#111F#;
   PMERR_INVALID_DIRECTORY              : constant := 16#1120#;
   PMERR_WILDCARD_IN_FILENAME           : constant := 16#1121#;
   PMERR_FILENAME_BUFFER_FULL           : constant := 16#1122#;
   PMERR_FILENAME_TOO_LONG              : constant := 16#1123#;
   PMERR_INI_FILE_IS_SYS_OR_USER        : constant := 16#1124#;
   PMERR_BROADCAST_PLMSG                : constant := 16#1125#;
   PMERR_190_INIT_DONE                  : constant := 16#1126#;
   PMERR_HMOD_FOR_PMSHAPI               : constant := 16#1127#;
   PMERR_SET_HK_PROFILE                 : constant := 16#1128#;
   PMERR_API_NOT_ALLOWED                : constant := 16#1129#;
   PMERR_INI_STILL_OPEN                 : constant := 16#112A#;
   PMERR_PROGDETAILS_NOT_IN_INI         : constant := 16#112B#;
   PMERR_PIBSTRUCT_NOT_IN_INI           : constant := 16#112C#;
   PMERR_INVALID_DISKPROGDETAILS        : constant := 16#112D#;
   PMERR_PROGDETAILS_READ_FAILURE       : constant := 16#112E#;
   PMERR_PROGDETAILS_WRITE_FAILURE      : constant := 16#112F#;
   PMERR_PROGDETAILS_QSIZE_FAILURE      : constant := 16#1130#;
   PMERR_INVALID_PROGDETAILS            : constant := 16#1131#;
   PMERR_SHEPROFILEHOOK_NOT_FOUND       : constant := 16#1132#;
   PMERR_190PLCONVERTED                 : constant := 16#1133#;
   PMERR_FAILED_TO_CONVERT_INI_PL       : constant := 16#1134#;
   PMERR_PMSHAPI_NOT_INITIALISED        : constant := 16#1135#;
   PMERR_INVALID_SHELL_API_HOOK_ID      : constant := 16#1136#;
   PMERR_DOS_ERROR                      : constant := 16#1200#;
   PMERR_NO_SPACE                       : constant := 16#1201#;
   PMERR_INVALID_SWITCH_HANDLE          : constant := 16#1202#;
   PMERR_NO_HANDLE                      : constant := 16#1203#;
   PMERR_INVALID_PROCESS_ID             : constant := 16#1204#;
   PMERR_NOT_SHELL                      : constant := 16#1205#;
   PMERR_INVALID_WINDOW                 : constant := 16#1206#;
   PMERR_INVALID_POST_MSG               : constant := 16#1207#;
   PMERR_INVALID_PARAMETERS             : constant := 16#1208#;
   PMERR_INVALID_PROGRAM_TYPE           : constant := 16#1209#;
   PMERR_NOT_EXTENDED_FOCUS             : constant := 16#120A#;
   PMERR_INVALID_SESSION_ID             : constant := 16#120B#;
   PMERR_SMG_INVALID_ICON_FILE          : constant := 16#120C#;
   PMERR_SMG_ICON_NOT_CREATED           : constant := 16#120D#;
   PMERR_SHL_DEBUG                      : constant := 16#120E#;
   PMERR_OPENING_INI_FILE               : constant := 16#1301#;
   PMERR_INI_FILE_CORRUPT               : constant := 16#1302#;
   PMERR_INVALID_PARM                   : constant := 16#1303#;
   PMERR_NOT_IN_IDX                     : constant := 16#1304#;
   PMERR_NO_ENTRIES_IN_GROUP            : constant := 16#1305#;
   PMERR_INI_WRITE_FAIL                 : constant := 16#1306#;
   PMERR_IDX_FULL                       : constant := 16#1307#;
   PMERR_INI_PROTECTED                  : constant := 16#1308#;
   PMERR_MEMORY_ALLOC                   : constant := 16#1309#;
   PMERR_INI_INIT_ALREADY_DONE          : constant := 16#130A#;
   PMERR_INVALID_INTEGER                : constant := 16#130B#;
   PMERR_INVALID_ASCIIZ                 : constant := 16#130C#;
   PMERR_CAN_NOT_CALL_SPOOLER           : constant := 16#130D#;
   PMERR_VALIDATION_REJECTED            : constant := 16#130D#;
   PMERR_WARNING_WINDOW_NOT_KILLED      : constant := 16#1401#;
   PMERR_ERROR_INVALID_WINDOW           : constant := 16#1402#;
   PMERR_ALREADY_INITIALIZED            : constant := 16#1403#;
   PMERR_MSG_PROG_NO_MOU                : constant := 16#1405#;
   PMERR_MSG_PROG_NON_RECOV             : constant := 16#1406#;
   PMERR_WINCONV_INVALID_PATH           : constant := 16#1407#;
   PMERR_PI_NOT_INITIALISED             : constant := 16#1408#;
   PMERR_PL_NOT_INITIALISED             : constant := 16#1409#;
   PMERR_NO_TASK_MANAGER                : constant := 16#140A#;
   PMERR_SAVE_NOT_IN_PROGRESS           : constant := 16#140B#;
   PMERR_NO_STACK_SPACE                 : constant := 16#140C#;
   PMERR_INVALID_COLR_FIELD             : constant := 16#140D#;
   PMERR_INVALID_COLR_VALUE             : constant := 16#140E#;
   PMERR_COLR_WRITE                     : constant := 16#140F#;
   PMERR_TARGET_FILE_EXISTS             : constant := 16#1501#;
   PMERR_SOURCE_SAME_AS_TARGET          : constant := 16#1502#;
   PMERR_SOURCE_FILE_NOT_FOUND          : constant := 16#1503#;
   PMERR_INVALID_NEW_PATH               : constant := 16#1504#;
   PMERR_TARGET_FILE_NOT_FOUND          : constant := 16#1505#;
   PMERR_INVALID_DRIVE_NUMBER           : constant := 16#1506#;
   PMERR_NAME_TOO_LONG                  : constant := 16#1507#;
   PMERR_NOT_ENOUGH_ROOM_ON_DISK        : constant := 16#1508#;
   PMERR_NOT_ENOUGH_MEM                 : constant := 16#1509#;
   PMERR_LOG_DRV_DOES_NOT_EXIST         : constant := 16#150B#;
   PMERR_INVALID_DRIVE                  : constant := 16#150C#;
   PMERR_ACCESS_DENIED                  : constant := 16#150D#;
   PMERR_NO_FIRST_SLASH                 : constant := 16#150E#;
   PMERR_READ_ONLY_FILE                 : constant := 16#150F#;
   PMERR_GROUP_PROTECTED                : constant := 16#151F#;
   PMERR_INVALID_PROGRAM_CATEGORY       : constant := 16#152F#;
   PMERR_INVALID_APPL                   : constant := 16#1530#;
   PMERR_CANNOT_START                   : constant := 16#1531#;
   PMERR_STARTED_IN_BACKGROUND          : constant := 16#1532#;
   PMERR_INVALID_HAPP                   : constant := 16#1533#;
   PMERR_CANNOT_STOP                    : constant := 16#1534#;
   PMERR_INVALID_FREE_MESSAGE_ID        : constant := 16#1630#;
   PMERR_FUNCTION_NOT_SUPPORTED         : constant := 16#1641#;
   PMERR_INVALID_ARRAY_COUNT            : constant := 16#1642#;
   PMERR_INVALID_LENGTH                 : constant := 16#1643#;
   PMERR_INVALID_BUNDLE_TYPE            : constant := 16#1644#;
   PMERR_INVALID_PARAMETER              : constant := 16#1645#;
   PMERR_INVALID_NUMBER_OF_PARMS        : constant := 16#1646#;
   PMERR_GREATER_THAN_64K               : constant := 16#1647#;
   PMERR_INVALID_PARAMETER_TYPE         : constant := 16#1648#;
   PMERR_NEGATIVE_STRCOND_DIM           : constant := 16#1649#;
   PMERR_INVALID_NUMBER_OF_TYPES        : constant := 16#164A#;
   PMERR_INCORRECT_HSTRUCT              : constant := 16#164B#;
   PMERR_INVALID_ARRAY_SIZE             : constant := 16#164C#;
   PMERR_INVALID_CONTROL_DATATYPE       : constant := 16#164D#;
   PMERR_INCOMPLETE_CONTROL_SEQU        : constant := 16#164E#;
   PMERR_INVALID_DATATYPE               : constant := 16#164F#;
   PMERR_INCORRECT_DATATYPE             : constant := 16#1650#;
   PMERR_NOT_SELF_DESCRIBING_DTYP       : constant := 16#1651#;
   PMERR_INVALID_CTRL_SEQ_INDEX         : constant := 16#1652#;
   PMERR_INVALID_TYPE_FOR_LENGTH        : constant := 16#1653#;
   PMERR_INVALID_TYPE_FOR_OFFSET        : constant := 16#1654#;
   PMERR_INVALID_TYPE_FOR_MPARAM        : constant := 16#1655#;
   PMERR_INVALID_MESSAGE_ID             : constant := 16#1656#;
   PMERR_C_LENGTH_TOO_SMALL             : constant := 16#1657#;
   PMERR_APPL_STRUCTURE_TOO_SMALL       : constant := 16#1658#;
   PMERR_INVALID_ERRORINFO_HANDLE       : constant := 16#1659#;
   PMERR_INVALID_CHARACTER_INDEX        : constant := 16#165A#;
   PMERR_OK                             : constant := 16#0000#;
   PMERR_ALREADY_IN_AREA                : constant := 16#2001#;
   PMERR_ALREADY_IN_ELEMENT             : constant := 16#2002#;
   PMERR_ALREADY_IN_PATH                : constant := 16#2003#;
   PMERR_ALREADY_IN_SEG                 : constant := 16#2004#;
   PMERR_AREA_INCOMPLETE                : constant := 16#2005#;
   PMERR_BASE_ERROR                     : constant := 16#2006#;
   PMERR_BITBLT_LENGTH_EXCEEDED         : constant := 16#2007#;
   PMERR_BITMAP_IN_USE                  : constant := 16#2008#;
   PMERR_BITMAP_IS_SELECTED             : constant := 16#2009#;
   PMERR_BITMAP_NOT_FOUND               : constant := 16#200A#;
   PMERR_BITMAP_NOT_SELECTED            : constant := 16#200B#;
   PMERR_BOUNDS_OVERFLOW                : constant := 16#200C#;
   PMERR_CALLED_SEG_IS_CHAINED          : constant := 16#200D#;
   PMERR_CALLED_SEG_IS_CURRENT          : constant := 16#200E#;
   PMERR_CALLED_SEG_NOT_FOUND           : constant := 16#200F#;
   PMERR_CANNOT_DELETE_ALL_DATA         : constant := 16#2010#;
   PMERR_CANNOT_REPLACE_ELEMENT_0       : constant := 16#2011#;
   PMERR_COL_TABLE_NOT_REALIZABLE       : constant := 16#2012#;
   PMERR_COL_TABLE_NOT_REALIZED         : constant := 16#2013#;
   PMERR_COORDINATE_OVERFLOW            : constant := 16#2014#;
   PMERR_CORR_FORMAT_MISMATCH           : constant := 16#2015#;
   PMERR_DATA_TOO_LONG                  : constant := 16#2016#;
   PMERR_DC_IS_ASSOCIATED               : constant := 16#2017#;
   PMERR_DESC_STRING_TRUNCATED          : constant := 16#2018#;
   PMERR_DEVICE_DRIVER_ERROR_1          : constant := 16#2019#;
   PMERR_DEVICE_DRIVER_ERROR_2          : constant := 16#201A#;
   PMERR_DEVICE_DRIVER_ERROR_3          : constant := 16#201B#;
   PMERR_DEVICE_DRIVER_ERROR_4          : constant := 16#201C#;
   PMERR_DEVICE_DRIVER_ERROR_5          : constant := 16#201D#;
   PMERR_DEVICE_DRIVER_ERROR_6          : constant := 16#201E#;
   PMERR_DEVICE_DRIVER_ERROR_7          : constant := 16#201F#;
   PMERR_DEVICE_DRIVER_ERROR_8          : constant := 16#2020#;
   PMERR_DEVICE_DRIVER_ERROR_9          : constant := 16#2021#;
   PMERR_DEVICE_DRIVER_ERROR_10         : constant := 16#2022#;
   PMERR_DEV_FUNC_NOT_INSTALLED         : constant := 16#2023#;
   PMERR_DOSOPEN_FAILURE                : constant := 16#2024#;
   PMERR_DOSREAD_FAILURE                : constant := 16#2025#;
   PMERR_DRIVER_NOT_FOUND               : constant := 16#2026#;
   PMERR_DUP_SEG                        : constant := 16#2027#;
   PMERR_DYNAMIC_SEG_SEQ_ERROR          : constant := 16#2028#;
   PMERR_DYNAMIC_SEG_ZERO_INV           : constant := 16#2029#;
   PMERR_ELEMENT_INCOMPLETE             : constant := 16#202A#;
   PMERR_ESC_CODE_NOT_SUPPORTED         : constant := 16#202B#;
   PMERR_EXCEEDS_MAX_SEG_LENGTH         : constant := 16#202C#;
   PMERR_FONT_AND_MODE_MISMATCH         : constant := 16#202D#;
   PMERR_FONT_FILE_NOT_LOADED           : constant := 16#202E#;
   PMERR_FONT_NOT_LOADED                : constant := 16#202F#;
   PMERR_FONT_TOO_BIG                   : constant := 16#2030#;
   PMERR_HARDWARE_INIT_FAILURE          : constant := 16#2031#;
   PMERR_HBITMAP_BUSY                   : constant := 16#2032#;
   PMERR_HDC_BUSY                       : constant := 16#2033#;
   PMERR_HRGN_BUSY                      : constant := 16#2034#;
   PMERR_HUGE_FONTS_NOT_SUPPORTED       : constant := 16#2035#;
   PMERR_ID_HAS_NO_BITMAP               : constant := 16#2036#;
   PMERR_IMAGE_INCOMPLETE               : constant := 16#2037#;
   PMERR_INCOMPAT_COLOR_FORMAT          : constant := 16#2038#;
   PMERR_INCOMPAT_COLOR_OPTIONS         : constant := 16#2039#;
   PMERR_INCOMPATIBLE_BITMAP            : constant := 16#203A#;
   PMERR_INCOMPATIBLE_METAFILE          : constant := 16#203B#;
   PMERR_INCORRECT_DC_TYPE              : constant := 16#203C#;
   PMERR_INSUFFICIENT_DISK_SPACE        : constant := 16#203D#;
   PMERR_INSUFFICIENT_MEMORY            : constant := 16#203E#;
   PMERR_INV_ANGLE_PARM                 : constant := 16#203F#;
   PMERR_INV_ARC_CONTROL                : constant := 16#2040#;
   PMERR_INV_AREA_CONTROL               : constant := 16#2041#;
   PMERR_INV_ARC_POINTS                 : constant := 16#2042#;
   PMERR_INV_ATTR_MODE                  : constant := 16#2043#;
   PMERR_INV_BACKGROUND_COL_ATTR        : constant := 16#2044#;
   PMERR_INV_BACKGROUND_MIX_ATTR        : constant := 16#2045#;
   PMERR_INV_BITBLT_MIX                 : constant := 16#2046#;
   PMERR_INV_BITBLT_STYLE               : constant := 16#2047#;
   PMERR_INV_BITMAP_DIMENSION           : constant := 16#2048#;
   PMERR_INV_BOX_CONTROL                : constant := 16#2049#;
   PMERR_INV_BOX_ROUNDING_PARM          : constant := 16#204A#;
   PMERR_INV_CHAR_ANGLE_ATTR            : constant := 16#204B#;
   PMERR_INV_CHAR_DIRECTION_ATTR        : constant := 16#204C#;
   PMERR_INV_CHAR_MODE_ATTR             : constant := 16#204D#;
   PMERR_INV_CHAR_POS_OPTIONS           : constant := 16#204E#;
   PMERR_INV_CHAR_SET_ATTR              : constant := 16#204F#;
   PMERR_INV_CHAR_SHEAR_ATTR            : constant := 16#2050#;
   PMERR_INV_CLIP_PATH_OPTIONS          : constant := 16#2051#;
   PMERR_INV_CODEPAGE                   : constant := 16#2052#;
   PMERR_INV_COLOR_ATTR                 : constant := 16#2053#;
   PMERR_INV_COLOR_DATA                 : constant := 16#2054#;
   PMERR_INV_COLOR_FORMAT               : constant := 16#2055#;
   PMERR_INV_COLOR_INDEX                : constant := 16#2056#;
   PMERR_INV_COLOR_OPTIONS              : constant := 16#2057#;
   PMERR_INV_COLOR_START_INDEX          : constant := 16#2058#;
   PMERR_INV_COORD_OFFSET               : constant := 16#2059#;
   PMERR_INV_COORD_SPACE                : constant := 16#205A#;
   PMERR_INV_COORDINATE                 : constant := 16#205B#;
   PMERR_INV_CORRELATE_DEPTH            : constant := 16#205C#;
   PMERR_INV_CORRELATE_TYPE             : constant := 16#205D#;
   PMERR_INV_CURSOR_BITMAP              : constant := 16#205E#;
   PMERR_INV_DC_DATA                    : constant := 16#205F#;
   PMERR_INV_DC_TYPE                    : constant := 16#2060#;
   PMERR_INV_DEVICE_NAME                : constant := 16#2061#;
   PMERR_INV_DEV_MODES_OPTIONS          : constant := 16#2062#;
   PMERR_INV_DRAW_CONTROL               : constant := 16#2063#;
   PMERR_INV_DRAW_VALUE                 : constant := 16#2064#;
   PMERR_INV_DRAWING_MODE               : constant := 16#2065#;
   PMERR_INV_DRIVER_DATA                : constant := 16#2066#;
   PMERR_INV_DRIVER_NAME                : constant := 16#2067#;
   PMERR_INV_DRAW_BORDER_OPTION         : constant := 16#2068#;
   PMERR_INV_EDIT_MODE                  : constant := 16#2069#;
   PMERR_INV_ELEMENT_OFFSET             : constant := 16#206A#;
   PMERR_INV_ELEMENT_POINTER            : constant := 16#206B#;
   PMERR_INV_END_PATH_OPTIONS           : constant := 16#206C#;
   PMERR_INV_ESC_CODE                   : constant := 16#206D#;
   PMERR_INV_ESCAPE_DATA                : constant := 16#206E#;
   PMERR_INV_EXTENDED_LCID              : constant := 16#206F#;
   PMERR_INV_FILL_PATH_OPTIONS          : constant := 16#2070#;
   PMERR_INV_FIRST_CHAR                 : constant := 16#2071#;
   PMERR_INV_FONT_ATTRS                 : constant := 16#2072#;
   PMERR_INV_FONT_FILE_DATA             : constant := 16#2073#;
   PMERR_INV_FOR_THIS_DC_TYPE           : constant := 16#2074#;
   PMERR_INV_FORMAT_CONTROL             : constant := 16#2075#;
   PMERR_INV_FORMS_CODE                 : constant := 16#2076#;
   PMERR_INV_FONTDEF                    : constant := 16#2077#;
   PMERR_INV_GEOM_LINE_WIDTH_ATTR       : constant := 16#2078#;
   PMERR_INV_GETDATA_CONTROL            : constant := 16#2079#;
   PMERR_INV_GRAPHICS_FIELD             : constant := 16#207A#;
   PMERR_INV_HBITMAP                    : constant := 16#207B#;
   PMERR_INV_HDC                        : constant := 16#207C#;
   PMERR_INV_HJOURNAL                   : constant := 16#207D#;
   PMERR_INV_HMF                        : constant := 16#207E#;
   PMERR_INV_HPS                        : constant := 16#207F#;
   PMERR_INV_HRGN                       : constant := 16#2080#;
   PMERR_INV_ID                         : constant := 16#2081#;
   PMERR_INV_IMAGE_DATA_LENGTH          : constant := 16#2082#;
   PMERR_INV_IMAGE_DIMENSION            : constant := 16#2083#;
   PMERR_INV_IMAGE_FORMAT               : constant := 16#2084#;
   PMERR_INV_IN_AREA                    : constant := 16#2085#;
   PMERR_INV_IN_CALLED_SEG              : constant := 16#2086#;
   PMERR_INV_IN_CURRENT_EDIT_MODE       : constant := 16#2087#;
   PMERR_INV_IN_DRAW_MODE               : constant := 16#2088#;
   PMERR_INV_IN_ELEMENT                 : constant := 16#2089#;
   PMERR_INV_IN_IMAGE                   : constant := 16#208A#;
   PMERR_INV_IN_PATH                    : constant := 16#208B#;
   PMERR_INV_IN_RETAIN_MODE             : constant := 16#208C#;
   PMERR_INV_IN_SEG                     : constant := 16#208D#;
   PMERR_INV_IN_VECTOR_SYMBOL           : constant := 16#208E#;
   PMERR_INV_INFO_TABLE                 : constant := 16#208F#;
   PMERR_INV_JOURNAL_OPTION             : constant := 16#2090#;
   PMERR_INV_KERNING_FLAGS              : constant := 16#2091#;
   PMERR_INV_LENGTH_OR_COUNT            : constant := 16#2092#;
   PMERR_INV_LINE_END_ATTR              : constant := 16#2093#;
   PMERR_INV_LINE_JOIN_ATTR             : constant := 16#2094#;
   PMERR_INV_LINE_TYPE_ATTR             : constant := 16#2095#;
   PMERR_INV_LINE_WIDTH_ATTR            : constant := 16#2096#;
   PMERR_INV_LOGICAL_ADDRESS            : constant := 16#2097#;
   PMERR_INV_MARKER_BOX_ATTR            : constant := 16#2098#;
   PMERR_INV_MARKER_SET_ATTR            : constant := 16#2099#;
   PMERR_INV_MARKER_SYMBOL_ATTR         : constant := 16#209A#;
   PMERR_INV_MATRIX_ELEMENT             : constant := 16#209B#;
   PMERR_INV_MAX_HITS                   : constant := 16#209C#;
   PMERR_INV_METAFILE                   : constant := 16#209D#;
   PMERR_INV_METAFILE_LENGTH            : constant := 16#209E#;
   PMERR_INV_METAFILE_OFFSET            : constant := 16#209F#;
   PMERR_INV_MICROPS_DRAW_CONTROL       : constant := 16#20A0#;
   PMERR_INV_MICROPS_FUNCTION           : constant := 16#20A1#;
   PMERR_INV_MICROPS_ORDER              : constant := 16#20A2#;
   PMERR_INV_MIX_ATTR                   : constant := 16#20A3#;
   PMERR_INV_MODE_FOR_OPEN_DYN          : constant := 16#20A4#;
   PMERR_INV_MODE_FOR_REOPEN_SEG        : constant := 16#20A5#;
   PMERR_INV_MODIFY_PATH_MODE           : constant := 16#20A6#;
   PMERR_INV_MULTIPLIER                 : constant := 16#20A7#;
   PMERR_INV_NESTED_FIGURES             : constant := 16#20A8#;
   PMERR_INV_OR_INCOMPAT_OPTIONS        : constant := 16#20A9#;
   PMERR_INV_ORDER_LENGTH               : constant := 16#20AA#;
   PMERR_INV_ORDERING_PARM              : constant := 16#20AB#;
   PMERR_INV_OUTSIDE_DRAW_MODE          : constant := 16#20AC#;
   PMERR_INV_PAGE_VIEWPORT              : constant := 16#20AD#;
   PMERR_INV_PATH_ID                    : constant := 16#20AE#;
   PMERR_INV_PATH_MODE                  : constant := 16#20AF#;
   PMERR_INV_PATTERN_ATTR               : constant := 16#20B0#;
   PMERR_INV_PATTERN_REF_PT_ATTR        : constant := 16#20B1#;
   PMERR_INV_PATTERN_SET_ATTR           : constant := 16#20B2#;
   PMERR_INV_PATTERN_SET_FONT           : constant := 16#20B3#;
   PMERR_INV_PICK_APERTURE_OPTION       : constant := 16#20B4#;
   PMERR_INV_PICK_APERTURE_POSN         : constant := 16#20B5#;
   PMERR_INV_PICK_APERTURE_SIZE         : constant := 16#20B6#;
   PMERR_INV_PICK_NUMBER                : constant := 16#20B7#;
   PMERR_INV_PLAY_METAFILE_OPTION       : constant := 16#20B8#;
   PMERR_INV_PRIMITIVE_TYPE             : constant := 16#20B9#;
   PMERR_INV_PS_SIZE                    : constant := 16#20BA#;
   PMERR_INV_PUTDATA_FORMAT             : constant := 16#20BB#;
   PMERR_INV_QUERY_ELEMENT_NO           : constant := 16#20BC#;
   PMERR_INV_RECT                       : constant := 16#20BD#;
   PMERR_INV_REGION_CONTROL             : constant := 16#20BE#;
   PMERR_INV_REGION_MIX_MODE            : constant := 16#20BF#;
   PMERR_INV_REPLACE_MODE_FUNC          : constant := 16#20C0#;
   PMERR_INV_RESERVED_FIELD             : constant := 16#20C1#;
   PMERR_INV_RESET_OPTIONS              : constant := 16#20C2#;
   PMERR_INV_RGBCOLOR                   : constant := 16#20C3#;
   PMERR_INV_SCAN_START                 : constant := 16#20C4#;
   PMERR_INV_SEG_ATTR                   : constant := 16#20C5#;
   PMERR_INV_SEG_ATTR_VALUE             : constant := 16#20C6#;
   PMERR_INV_SEG_CH_LENGTH              : constant := 16#20C7#;
   PMERR_INV_SEG_NAME                   : constant := 16#20C8#;
   PMERR_INV_SEG_OFFSET                 : constant := 16#20C9#;
   PMERR_INV_SETID                      : constant := 16#20CA#;
   PMERR_INV_SETID_TYPE                 : constant := 16#20CB#;
   PMERR_INV_SET_VIEWPORT_OPTION        : constant := 16#20CC#;
   PMERR_INV_SHARPNESS_PARM             : constant := 16#20CD#;
   PMERR_INV_SOURCE_OFFSET              : constant := 16#20CE#;
   PMERR_INV_STOP_DRAW_VALUE            : constant := 16#20CF#;
   PMERR_INV_TRANSFORM_TYPE             : constant := 16#20D0#;
   PMERR_INV_USAGE_PARM                 : constant := 16#20D1#;
   PMERR_INV_VIEWING_LIMITS             : constant := 16#20D2#;
   PMERR_JFILE_BUSY                     : constant := 16#20D3#;
   PMERR_JNL_FUNC_DATA_TOO_LONG         : constant := 16#20D4#;
   PMERR_KERNING_NOT_SUPPORTED          : constant := 16#20D5#;
   PMERR_LABEL_NOT_FOUND                : constant := 16#20D6#;
   PMERR_MATRIX_OVERFLOW                : constant := 16#20D7#;
   PMERR_METAFILE_INTERNAL_ERROR        : constant := 16#20D8#;
   PMERR_METAFILE_IN_USE                : constant := 16#20D9#;
   PMERR_METAFILE_LIMIT_EXCEEDED        : constant := 16#20DA#;
   PMERR_NAME_STACK_FULL                : constant := 16#20DB#;
   PMERR_NOT_CREATED_BY_DEVOPENDC       : constant := 16#20DC#;
   PMERR_NOT_IN_AREA                    : constant := 16#20DD#;
   PMERR_NOT_IN_DRAW_MODE               : constant := 16#20DE#;
   PMERR_NOT_IN_ELEMENT                 : constant := 16#20DF#;
   PMERR_NOT_IN_IMAGE                   : constant := 16#20E0#;
   PMERR_NOT_IN_PATH                    : constant := 16#20E1#;
   PMERR_NOT_IN_RETAIN_MODE             : constant := 16#20E2#;
   PMERR_NOT_IN_SEG                     : constant := 16#20E3#;
   PMERR_NO_BITMAP_SELECTED             : constant := 16#20E4#;
   PMERR_NO_CURRENT_ELEMENT             : constant := 16#20E5#;
   PMERR_NO_CURRENT_SEG                 : constant := 16#20E6#;
   PMERR_NO_METAFILE_RECORD_HANDLE      : constant := 16#20E7#;
   PMERR_ORDER_TOO_BIG                  : constant := 16#20E8#;
   PMERR_OTHER_SET_ID_REFS              : constant := 16#20E9#;
   PMERR_OVERRAN_SEG                    : constant := 16#20EA#;
   PMERR_OWN_SET_ID_REFS                : constant := 16#20EB#;
   PMERR_PATH_INCOMPLETE                : constant := 16#20EC#;
   PMERR_PATH_LIMIT_EXCEEDED            : constant := 16#20ED#;
   PMERR_PATH_UNKNOWN                   : constant := 16#20EE#;
   PMERR_PEL_IS_CLIPPED                 : constant := 16#20EF#;
   PMERR_PEL_NOT_AVAILABLE              : constant := 16#20F0#;
   PMERR_PRIMITIVE_STACK_EMPTY          : constant := 16#20F1#;
   PMERR_PROLOG_ERROR                   : constant := 16#20F2#;
   PMERR_PROLOG_SEG_ATTR_NOT_SET        : constant := 16#20F3#;
   PMERR_PS_BUSY                        : constant := 16#20F4#;
   PMERR_PS_IS_ASSOCIATED               : constant := 16#20F5#;
   PMERR_RAM_JNL_FILE_TOO_SMALL         : constant := 16#20F6#;
   PMERR_REALIZE_NOT_SUPPORTED          : constant := 16#20F7#;
   PMERR_REGION_IS_CLIP_REGION          : constant := 16#20F8#;
   PMERR_RESOURCE_DEPLETION             : constant := 16#20F9#;
   PMERR_SEG_AND_REFSEG_ARE_SAME        : constant := 16#20FA#;
   PMERR_SEG_CALL_RECURSIVE             : constant := 16#20FB#;
   PMERR_SEG_CALL_STACK_EMPTY           : constant := 16#20FC#;
   PMERR_SEG_CALL_STACK_FULL            : constant := 16#20FD#;
   PMERR_SEG_IS_CURRENT                 : constant := 16#20FE#;
   PMERR_SEG_NOT_CHAINED                : constant := 16#20FF#;
   PMERR_SEG_NOT_FOUND                  : constant := 16#2100#;
   PMERR_SEG_STORE_LIMIT_EXCEEDED       : constant := 16#2101#;
   PMERR_SETID_IN_USE                   : constant := 16#2102#;
   PMERR_SETID_NOT_FOUND                : constant := 16#2103#;
   PMERR_STARTDOC_NOT_ISSUED            : constant := 16#2104#;
   PMERR_STOP_DRAW_OCCURRED             : constant := 16#2105#;
   PMERR_TOO_MANY_METAFILES_IN_USE      : constant := 16#2106#;
   PMERR_TRUNCATED_ORDER                : constant := 16#2107#;
   PMERR_UNCHAINED_SEG_ZERO_INV         : constant := 16#2108#;
   PMERR_UNSUPPORTED_ATTR               : constant := 16#2109#;
   PMERR_UNSUPPORTED_ATTR_VALUE         : constant := 16#210A#;
   PMERR_ENDDOC_NOT_ISSUED              : constant := 16#210B#;
   PMERR_PS_NOT_ASSOCIATED              : constant := 16#210C#;
   PMERR_INV_FLOOD_FILL_OPTIONS         : constant := 16#210D#;
   PMERR_INV_FACENAME                   : constant := 16#210E#;
   PMERR_PALETTE_SELECTED               : constant := 16#210F#;
   PMERR_NO_PALETTE_SELECTED            : constant := 16#2110#;
   PMERR_INV_HPAL                       : constant := 16#2111#;
   PMERR_PALETTE_BUSY                   : constant := 16#2112#;
   PMERR_START_POINT_CLIPPED            : constant := 16#2113#;
   PMERR_NO_FILL                        : constant := 16#2114#;
   PMERR_INV_FACENAMEDESC               : constant := 16#2115#;
   PMERR_INV_BITMAP_DATA                : constant := 16#2116#;
   PMERR_INV_CHAR_ALIGN_ATTR            : constant := 16#2117#;
   PMERR_INV_HFONT                      : constant := 16#2118#;
   PMERR_HFONT_IS_SELECTED              : constant := 16#2119#;
   PMERR_DRVR_NOT_SUPPORTED             : constant := 16#2120#;
   WPERR_PROTECTED_CLASS                : constant := 16#1700#;
   WPERR_INVALID_CLASS                  : constant := 16#1701#;
   WPERR_INVALID_SUPERCLASS             : constant := 16#1702#;
   WPERR_NO_MEMORY                      : constant := 16#1703#;
   WPERR_SEMAPHORE_ERROR                : constant := 16#1704#;
   WPERR_BUFFER_TOO_SMALL               : constant := 16#1705#;
   WPERR_CLSLOADMOD_FAILED              : constant := 16#1706#;
   WPERR_CLSPROCADDR_FAILED             : constant := 16#1707#;
   WPERR_OBJWORD_LOCATION               : constant := 16#1708#;
   WPERR_INVALID_OBJECT                 : constant := 16#1709#;
   WPERR_MEMORY_CLEANUP                 : constant := 16#170A#;
   WPERR_INVALID_MODULE                 : constant := 16#170B#;
   WPERR_INVALID_OLDCLASS               : constant := 16#170C#;
   WPERR_INVALID_NEWCLASS               : constant := 16#170D#;
   WPERR_NOT_IMMEDIATE_CHILD            : constant := 16#170E#;
   WPERR_NOT_WORKPLACE_CLASS            : constant := 16#170F#;
   WPERR_CANT_REPLACE_METACLS           : constant := 16#1710#;
   WPERR_INI_FILE_WRITE                 : constant := 16#1711#;
   WPERR_INVALID_FOLDER                 : constant := 16#1712#;
   WPERR_BUFFER_OVERFLOW                : constant := 16#1713#;
   WPERR_OBJECT_NOT_FOUND               : constant := 16#1714#;
   WPERR_INVALID_HFIND                  : constant := 16#1715#;
   WPERR_INVALID_COUNT                  : constant := 16#1716#;
   WPERR_INVALID_BUFFER                 : constant := 16#1717#;
   WPERR_ALREADY_EXISTS                 : constant := 16#1718#;
   WPERR_INVALID_FLAGS                  : constant := 16#1719#;
   WPERR_INVALID_OBJECTID               : constant := 16#1720#;
   PMERR_SPL_DRIVER_ERROR               : constant := 16#4001#;
   PMERR_SPL_DEVICE_ERROR               : constant := 16#4002#;
   PMERR_SPL_DEVICE_NOT_INSTALLED       : constant := 16#4003#;
   PMERR_SPL_QUEUE_ERROR                : constant := 16#4004#;
   PMERR_SPL_INV_HSPL                   : constant := 16#4005#;
   PMERR_SPL_NO_DISK_SPACE              : constant := 16#4006#;
   PMERR_SPL_NO_MEMORY                  : constant := 16#4007#;
   PMERR_SPL_PRINT_ABORT                : constant := 16#4008#;
   PMERR_SPL_SPOOLER_NOT_INSTALLED      : constant := 16#4009#;
   PMERR_SPL_INV_FORMS_CODE             : constant := 16#400A#;
   PMERR_SPL_INV_PRIORITY               : constant := 16#400B#;
   PMERR_SPL_NO_FREE_JOB_ID             : constant := 16#400C#;
   PMERR_SPL_NO_DATA                    : constant := 16#400D#;
   PMERR_SPL_INV_TOKEN                  : constant := 16#400E#;
   PMERR_SPL_INV_DATATYPE               : constant := 16#400F#;
   PMERR_SPL_PROCESSOR_ERROR            : constant := 16#4010#;
   PMERR_SPL_INV_JOB_ID                 : constant := 16#4011#;
   PMERR_SPL_JOB_NOT_PRINTING           : constant := 16#4012#;
   PMERR_SPL_JOB_PRINTING               : constant := 16#4013#;
   PMERR_SPL_QUEUE_ALREADY_EXISTS       : constant := 16#4014#;
   PMERR_SPL_INV_QUEUE_NAME             : constant := 16#4015#;
   PMERR_SPL_QUEUE_NOT_EMPTY            : constant := 16#4016#;
   PMERR_SPL_DEVICE_ALREADY_EXISTS      : constant := 16#4017#;
   PMERR_SPL_DEVICE_LIMIT_REACHED       : constant := 16#4018#;
   PMERR_SPL_STATUS_STRING_TRUNC        : constant := 16#4019#;
   PMERR_SPL_INV_LENGTH_OR_COUNT        : constant := 16#401A#;
   PMERR_SPL_FILE_NOT_FOUND             : constant := 16#401B#;
   PMERR_SPL_CANNOT_OPEN_FILE           : constant := 16#401C#;
   PMERR_SPL_DRIVER_NOT_INSTALLED       : constant := 16#401D#;
   PMERR_SPL_INV_PROCESSOR_DATTYPE      : constant := 16#401E#;
   PMERR_SPL_INV_DRIVER_DATATYPE        : constant := 16#401F#;
   PMERR_SPL_PROCESSOR_NOT_INST         : constant := 16#4020#;
   PMERR_SPL_NO_SUCH_LOG_ADDRESS        : constant := 16#4021#;
   PMERR_SPL_PRINTER_NOT_FOUND          : constant := 16#4022#;
   PMERR_SPL_DD_NOT_FOUND               : constant := 16#4023#;
   PMERR_SPL_QUEUE_NOT_FOUND            : constant := 16#4024#;
   PMERR_SPL_MANY_QUEUES_ASSOC          : constant := 16#4025#;
   PMERR_SPL_NO_QUEUES_ASSOCIATED       : constant := 16#4026#;
   PMERR_SPL_INI_FILE_ERROR             : constant := 16#4027#;
   PMERR_SPL_NO_DEFAULT_QUEUE           : constant := 16#4028#;
   PMERR_SPL_NO_CURRENT_FORMS_CODE      : constant := 16#4029#;
   PMERR_SPL_NOT_AUTHORISED             : constant := 16#402A#;
   PMERR_SPL_TEMP_NETWORK_ERROR         : constant := 16#402B#;
   PMERR_SPL_HARD_NETWORK_ERROR         : constant := 16#402C#;
   PMERR_DEL_NOT_ALLOWED                : constant := 16#402D#;
   PMERR_CANNOT_DEL_QP_REF              : constant := 16#402E#;
   PMERR_CANNOT_DEL_QNAME_REF           : constant := 16#402F#;
   PMERR_CANNOT_DEL_PRINTER_DD_REF      : constant := 16#4030#;
   PMERR_CANNOT_DEL_PRN_NAME_REF        : constant := 16#4031#;
   PMERR_CANNOT_DEL_PRN_ADDR_REF        : constant := 16#4032#;
   PMERR_SPOOLER_QP_NOT_DEFINED         : constant := 16#4033#;
   PMERR_PRN_NAME_NOT_DEFINED           : constant := 16#4034#;
   PMERR_PRN_ADDR_NOT_DEFINED           : constant := 16#4035#;
   PMERR_PRINTER_DD_NOT_DEFINED         : constant := 16#4036#;
   PMERR_PRINTER_QUEUE_NOT_DEFINED      : constant := 16#4037#;
   PMERR_PRN_ADDR_IN_USE                : constant := 16#4038#;
   PMERR_SPL_TOO_MANY_OPEN_FILES        : constant := 16#4039#;
   PMERR_SPL_CP_NOT_REQD                : constant := 16#403A#;
   PMERR_UNABLE_TO_CLOSE_DEVICE         : constant := 16#4040#;
   PMERR_INV_TYPE                       : constant := 16#5001#;
   PMERR_INV_CONV                       : constant := 16#5002#;
   PMERR_INV_SEGLEN                     : constant := 16#5003#;
   PMERR_DUP_SEGNAME                    : constant := 16#5004#;
   PMERR_INV_XFORM                      : constant := 16#5005#;
   PMERR_INV_VIEWLIM                    : constant := 16#5006#;
   PMERR_INV_3DCOORD                    : constant := 16#5007#;
   PMERR_SMB_OVFLOW                     : constant := 16#5008#;
   PMERR_SEG_OVFLOW                     : constant := 16#5009#;
   PMERR_PIC_DUP_FILENAME               : constant := 16#5010#;
   WINDBG_HWND_NOT_DESTROYED            : constant := 16#1022#;
   WINDBG_HPTR_NOT_DESTROYED            : constant := 16#1023#;
   WINDBG_HACCEL_NOT_DESTROYED          : constant := 16#1024#;
   WINDBG_HENUM_NOT_DESTROYED           : constant := 16#1025#;
   WINDBG_VISRGN_SEM_BUSY               : constant := 16#1026#;
   WINDBG_USER_SEM_BUSY                 : constant := 16#1027#;
   WINDBG_DC_CACHE_BUSY                 : constant := 16#1028#;
   WINDBG_HOOK_STILL_INSTALLED          : constant := 16#1029#;
   WINDBG_WINDOW_STILL_LOCKED           : constant := 16#102A#;
   WINDBG_UPDATEPS_ASSERTION_FAIL       : constant := 16#102B#;
   WINDBG_SENDMSG_WITHIN_USER_SEM       : constant := 16#102C#;
   WINDBG_USER_SEM_NOT_ENTERED          : constant := 16#102D#;
   WINDBG_PROC_NOT_EXPORTED             : constant := 16#102E#;
   WINDBG_BAD_SENDMSG_HWND              : constant := 16#102F#;
   WINDBG_ABNORMAL_EXIT                 : constant := 16#1030#;
   WINDBG_INTERNAL_REVISION             : constant := 16#1031#;
   WINDBG_INITSYSTEM_FAILED             : constant := 16#1032#;
   WINDBG_HATOMTBL_NOT_DESTROYED        : constant := 16#1033#;
   WINDBG_WINDOW_UNLOCK_WAIT            : constant := 16#1035#;
   WM_NULL                              : constant := 16#0000#;
   WM_CREATE                            : constant := 16#0001#;
   WM_DESTROY                           : constant := 16#0002#;
   WM_ENABLE                            : constant := 16#0004#;
   WM_SHOW                              : constant := 16#0005#;
   WM_MOVE                              : constant := 16#0006#;
   WM_SIZE                              : constant := 16#0007#;
   WM_ADJUSTWINDOWPOS                   : constant := 16#0008#;
   WM_CALCVALIDRECTS                    : constant := 16#0009#;
   WM_SETWINDOWPARAMS                   : constant := 16#000A#;
   WM_QUERYWINDOWPARAMS                 : constant := 16#000B#;
   WM_HITTEST                           : constant := 16#000C#;
   WM_ACTIVATE                          : constant := 16#000D#;
   WM_SETFOCUS                          : constant := 16#000F#;
   WM_SETSELECTION                      : constant := 16#0010#;
   WM_PPAINT                            : constant := 16#0011#;
   WM_PSETFOCUS                         : constant := 16#0012#;
   WM_PSYSCOLORCHANGE                   : constant := 16#0013#;
   WM_PSIZE                             : constant := 16#0014#;
   WM_PACTIVATE                         : constant := 16#0015#;
   WM_PCONTROL                          : constant := 16#0016#;
   WM_COMMAND                           : constant := 16#0020#;
   WM_SYSCOMMAND                        : constant := 16#0021#;
   WM_HELP                              : constant := 16#0022#;
   WM_PAINT                             : constant := 16#0023#;
   WM_TIMER                             : constant := 16#0024#;
   WM_SEM1                              : constant := 16#0025#;
   WM_SEM2                              : constant := 16#0026#;
   WM_SEM3                              : constant := 16#0027#;
   WM_SEM4                              : constant := 16#0028#;
   WM_CLOSE                             : constant := 16#0029#;
   WM_QUIT                              : constant := 16#002A#;
   WM_SYSCOLORCHANGE                    : constant := 16#002B#;
   WM_SYSVALUECHANGED                   : constant := 16#002D#;
   WM_APPTERMINATENOTIFY                : constant := 16#002E#;
   WM_PRESPARAMCHANGED                  : constant := 16#002F#;
   WM_CONTROL                           : constant := 16#0030#;
   WM_VSCROLL                           : constant := 16#0031#;
   WM_HSCROLL                           : constant := 16#0032#;
   WM_INITMENU                          : constant := 16#0033#;
   WM_MENUSELECT                        : constant := 16#0034#;
   WM_MENUEND                           : constant := 16#0035#;
   WM_DRAWITEM                          : constant := 16#0036#;
   WM_MEASUREITEM                       : constant := 16#0037#;
   WM_CONTROLPOINTER                    : constant := 16#0038#;
   WM_QUERYDLGCODE                      : constant := 16#003A#;
   WM_INITDLG                           : constant := 16#003B#;
   WM_SUBSTITUTESTRING                  : constant := 16#003C#;
   WM_MATCHMNEMONIC                     : constant := 16#003D#;
   WM_SAVEAPPLICATION                   : constant := 16#003E#;
   WM_HELPBASE                          : constant := 16#0F00#;
   WM_HELPTOP                           : constant := 16#0FFF#;
   WM_USER                              : constant := 16#1000#;
   CMDSRC_OTHER                         : constant := 8#0000#;
   CMDSRC_PUSHBUTTON                    : constant := 1;
   CMDSRC_MENU                          : constant := 2;
   CMDSRC_ACCELERATOR                   : constant := 3;
   CMDSRC_FONTDLG                       : constant := 4;
   CMDSRC_FILEDLG                       : constant := 5;
   CMDSRC_PRINTDLG                      : constant := 6;
   CMDSRC_COLORDLG                      : constant := 7;
   PM_NOREMOVE                          : constant := 16#0000#;
   PM_REMOVE                            : constant := 16#0001#;
   RUM_IN                               : constant := 1;
   RUM_OUT                              : constant := 2;
   RUM_INOUT                            : constant := 3;
   SMD_DELAYED                          : constant := 16#0001#;
   SMD_IMMEDIATE                        : constant := 16#0002#;
   SSM_SYNCHRONOUS                      : constant := 16#0001#;
   SSM_ASYNCHRONOUS                     : constant := 16#0002#;
   SSM_MIXED                            : constant := 16#0003#;
   DTYP_USER                            : constant := 16384;
   DTYP_CTL_ARRAY                       : constant := 1;
   DTYP_CTL_PARRAY                      : constant := -1;
   DTYP_CTL_OFFSET                      : constant := 2;
   DTYP_CTL_LENGTH                      : constant := 3;
   DTYP_ACCEL                           : constant := 28;
   DTYP_ACCELTABLE                      : constant := 29;
   DTYP_ARCPARAMS                       : constant := 38;
   DTYP_AREABUNDLE                      : constant := 139;
   DTYP_ATOM                            : constant := 90;
   DTYP_BITMAPINFO                      : constant := 60;
   DTYP_BITMAPINFOHEADER                : constant := 61;
   DTYP_BITMAPINFO2                     : constant := 170;
   DTYP_BITMAPINFOHEADER2               : constant := 171;
   DTYP_BIT16                           : constant := 20;
   DTYP_BIT32                           : constant := 21;
   DTYP_BIT8                            : constant := 19;
   DTYP_BOOL                            : constant := 18;
   DTYP_BTNCDATA                        : constant := 35;
   DTYP_BYTE                            : constant := 13;
   DTYP_CATCHBUF                        : constant := 141;
   DTYP_CHAR                            : constant := 15;
   DTYP_CHARBUNDLE                      : constant := 135;
   DTYP_CLASSINFO                       : constant := 95;
   DTYP_COUNT2                          : constant := 93;
   DTYP_COUNT2B                         : constant := 70;
   DTYP_COUNT2CH                        : constant := 82;
   DTYP_COUNT4                          : constant := 152;
   DTYP_COUNT4B                         : constant := 42;
   DTYP_CPID                            : constant := 57;
   DTYP_CREATESTRUCT                    : constant := 98;
   DTYP_CURSORINFO                      : constant := 34;
   DTYP_DEVOPENSTRUC                    : constant := 124;
   DTYP_DLGTEMPLATE                     : constant := 96;
   DTYP_DLGTITEM                        : constant := 97;
   DTYP_ENTRYFDATA                      : constant := 127;
   DTYP_ERRORID                         : constant := 45;
   DTYP_FATTRS                          : constant := 75;
   DTYP_FFDESCS                         : constant := 142;
   DTYP_FIXED                           : constant := 99;
   DTYP_FONTMETRICS                     : constant := 74;
   DTYP_FRAMECDATA                      : constant := 144;
   DTYP_GRADIENTL                       : constant := 48;
   DTYP_HAB                             : constant := 10;
   DTYP_HACCEL                          : constant := 30;
   DTYP_HAPP                            : constant := 146;
   DTYP_HATOMTBL                        : constant := 91;
   DTYP_HBITMAP                         : constant := 62;
   DTYP_HCINFO                          : constant := 46;
   DTYP_HDC                             : constant := 132;
   DTYP_HENUM                           : constant := 117;
   DTYP_HHEAP                           : constant := 109;
   DTYP_HINI                            : constant := 53;
   DTYP_HLIB                            : constant := 147;
   DTYP_HMF                             : constant := 85;
   DTYP_HMQ                             : constant := 86;
   DTYP_HPOINTER                        : constant := 106;
   DTYP_HPROGRAM                        : constant := 131;
   DTYP_HPS                             : constant := 12;
   DTYP_HRGN                            : constant := 116;
   DTYP_HSEM                            : constant := 140;
   DTYP_HSPL                            : constant := 16#0020#;
   DTYP_HSWITCH                         : constant := 66;
   DTYP_HVPS                            : constant := 58;
   DTYP_HWND                            : constant := 11;
   DTYP_IDENTITY                        : constant := 133;
   DTYP_IDENTITY4                       : constant := 169;
   DTYP_IMAGEBUNDLE                     : constant := 136;
   DTYP_INDEX2                          : constant := 81;
   DTYP_IPT                             : constant := 155;
   DTYP_KERNINGPAIRS                    : constant := 118;
   DTYP_LENGTH2                         : constant := 68;
   DTYP_LENGTH4                         : constant := 69;
   DTYP_LINEBUNDLE                      : constant := 137;
   DTYP_LONG                            : constant := 25;
   DTYP_MARKERBUNDLE                    : constant := 138;
   DTYP_MATRIXLF                        : constant := 113;
   DTYP_MLECTLDATA                      : constant := 161;
   DTYP_MLEMARGSTRUCT                   : constant := 157;
   DTYP_MLEOVERFLOW                     : constant := 158;
   DTYP_OFFSET2B                        : constant := 112;
   DTYP_OWNERITEM                       : constant := 154;
   DTYP_PID                             : constant := 92;
   DTYP_PIX                             : constant := 156;
   DTYP_POINTERINFO                     : constant := 105;
   DTYP_POINTL                          : constant := 77;
   DTYP_PROGCATEGORY                    : constant := 129;
   DTYP_PROGRAMENTRY                    : constant := 16#0080#;
   DTYP_PROGTYPE                        : constant := 130;
   DTYP_PROPERTY2                       : constant := 88;
   DTYP_PROPERTY4                       : constant := 89;
   DTYP_QMSG                            : constant := 87;
   DTYP_RECTL                           : constant := 121;
   DTYP_RESID                           : constant := 125;
   DTYP_RGB                             : constant := 111;
   DTYP_RGNRECT                         : constant := 115;
   DTYP_SBCDATA                         : constant := 159;
   DTYP_SEGOFF                          : constant := 126;
   DTYP_SHORT                           : constant := 23;
   DTYP_SIZEF                           : constant := 101;
   DTYP_SIZEL                           : constant := 102;
   DTYP_STRL                            : constant := 17;
   DTYP_STR16                           : constant := 40;
   DTYP_STR32                           : constant := 37;
   DTYP_STR64                           : constant := 47;
   DTYP_STR8                            : constant := 33;
   DTYP_SWBLOCK                         : constant := 63;
   DTYP_SWCNTRL                         : constant := 16#0040#;
   DTYP_SWENTRY                         : constant := 65;
   DTYP_SWP                             : constant := 31;
   DTYP_TID                             : constant := 104;
   DTYP_TIME                            : constant := 107;
   DTYP_TRACKINFO                       : constant := 73;
   DTYP_UCHAR                           : constant := 22;
   DTYP_ULONG                           : constant := 26;
   DTYP_USERBUTTON                      : constant := 36;
   DTYP_USHORT                          : constant := 24;
   DTYP_WIDTH4                          : constant := 108;
   DTYP_WNDPARAMS                       : constant := 83;
   DTYP_WNDPROC                         : constant := 84;
   DTYP_WPOINT                          : constant := 59;
   DTYP_WRECT                           : constant := 55;
   DTYP_XYWINSIZE                       : constant := 52;
   DTYP_PACCEL                          : constant := -28;
   DTYP_PACCELTABLE                     : constant := -29;
   DTYP_PARCPARAMS                      : constant := -38;
   DTYP_PAREABUNDLE                     : constant := -139;
   DTYP_PATOM                           : constant := -90;
   DTYP_PBITMAPINFO                     : constant := -60;
   DTYP_PBITMAPINFOHEADER               : constant := -61;
   DTYP_PBITMAPINFO2                    : constant := -170;
   DTYP_PBITMAPINFOHEADER2              : constant := -171;
   DTYP_PBIT16                          : constant := -20;
   DTYP_PBIT32                          : constant := -21;
   DTYP_PBIT8                           : constant := -19;
   DTYP_PBOOL                           : constant := -18;
   DTYP_PBTNCDATA                       : constant := -35;
   DTYP_PBYTE                           : constant := -13;
   DTYP_PCATCHBUF                       : constant := -141;
   DTYP_PCHAR                           : constant := -15;
   DTYP_PCHARBUNDLE                     : constant := -135;
   DTYP_PCLASSINFO                      : constant := -95;
   DTYP_PCOUNT2                         : constant := -93;
   DTYP_PCOUNT2B                        : constant := -70;
   DTYP_PCOUNT2CH                       : constant := -82;
   DTYP_PCOUNT4                         : constant := -152;
   DTYP_PCOUNT4B                        : constant := -42;
   DTYP_PCPID                           : constant := -57;
   DTYP_PCREATESTRUCT                   : constant := -98;
   DTYP_PCURSORINFO                     : constant := -34;
   DTYP_PDEVOPENSTRUC                   : constant := -124;
   DTYP_PDLGTEMPLATE                    : constant := -96;
   DTYP_PDLGTITEM                       : constant := -97;
   DTYP_PENTRYFDATA                     : constant := -127;
   DTYP_PERRORID                        : constant := -45;
   DTYP_PFATTRS                         : constant := -75;
   DTYP_PFFDESCS                        : constant := -142;
   DTYP_PFIXED                          : constant := -99;
   DTYP_PFONTMETRICS                    : constant := -74;
   DTYP_PFRAMECDATA                     : constant := -144;
   DTYP_PGRADIENTL                      : constant := -48;
   DTYP_PHAB                            : constant := -10;
   DTYP_PHACCEL                         : constant := -30;
   DTYP_PHAPP                           : constant := -146;
   DTYP_PHATOMTBL                       : constant := -91;
   DTYP_PHBITMAP                        : constant := -62;
   DTYP_PHCINFO                         : constant := -46;
   DTYP_PHDC                            : constant := -132;
   DTYP_PHENUM                          : constant := -117;
   DTYP_PHHEAP                          : constant := -109;
   DTYP_PHINI                           : constant := -53;
   DTYP_PHLIB                           : constant := -147;
   DTYP_PHMF                            : constant := -85;
   DTYP_PHMQ                            : constant := -86;
   DTYP_PHPOINTER                       : constant := -106;
   DTYP_PHPROGRAM                       : constant := -131;
   DTYP_PHPS                            : constant := -12;
   DTYP_PHRGN                           : constant := -116;
   DTYP_PHSEM                           : constant := -140;
   DTYP_PHSPL                           : constant := -32;
   DTYP_PHSWITCH                        : constant := -66;
   DTYP_PHVPS                           : constant := -58;
   DTYP_PHWND                           : constant := -11;
   DTYP_PIDENTITY                       : constant := -133;
   DTYP_PIDENTITY4                      : constant := -169;
   DTYP_PIMAGEBUNDLE                    : constant := -136;
   DTYP_PINDEX2                         : constant := -81;
   DTYP_PIPT                            : constant := -155;
   DTYP_PKERNINGPAIRS                   : constant := -118;
   DTYP_PLENGTH2                        : constant := -68;
   DTYP_PLENGTH4                        : constant := -69;
   DTYP_PLINEBUNDLE                     : constant := -137;
   DTYP_PLONG                           : constant := -25;
   DTYP_PMARKERBUNDLE                   : constant := -138;
   DTYP_PMATRIXLF                       : constant := -113;
   DTYP_PMLECTLDATA                     : constant := -161;
   DTYP_PMLEMARGSTRUCT                  : constant := -157;
   DTYP_PMLEOVERFLOW                    : constant := -158;
   DTYP_POFFSET2B                       : constant := -112;
   DTYP_POWNERITEM                      : constant := -154;
   DTYP_PPID                            : constant := -92;
   DTYP_PPIX                            : constant := -156;
   DTYP_PPOINTERINFO                    : constant := -105;
   DTYP_PPOINTL                         : constant := -77;
   DTYP_PPROGCATEGORY                   : constant := -129;
   DTYP_PPROGRAMENTRY                   : constant := -128;
   DTYP_PPROGTYPE                       : constant := -130;
   DTYP_PPROPERTY2                      : constant := -88;
   DTYP_PPROPERTY4                      : constant := -89;
   DTYP_PQMSG                           : constant := -87;
   DTYP_PRECTL                          : constant := -121;
   DTYP_PRESID                          : constant := -125;
   DTYP_PRGB                            : constant := -111;
   DTYP_PRGNRECT                        : constant := -115;
   DTYP_PSBCDATA                        : constant := -159;
   DTYP_PSEGOFF                         : constant := -126;
   DTYP_PSHORT                          : constant := -23;
   DTYP_PSIZEF                          : constant := -101;
   DTYP_PSIZEL                          : constant := -102;
   DTYP_PSTRL                           : constant := -17;
   DTYP_PSTR16                          : constant := -40;
   DTYP_PSTR32                          : constant := -37;
   DTYP_PSTR64                          : constant := -47;
   DTYP_PSTR8                           : constant := -33;
   DTYP_PSWBLOCK                        : constant := -63;
   DTYP_PSWCNTRL                        : constant := -64;
   DTYP_PSWENTRY                        : constant := -65;
   DTYP_PSWP                            : constant := -31;
   DTYP_PTID                            : constant := -104;
   DTYP_PTIME                           : constant := -107;
   DTYP_PTRACKINFO                      : constant := -73;
   DTYP_PUCHAR                          : constant := -22;
   DTYP_PULONG                          : constant := -26;
   DTYP_PUSERBUTTON                     : constant := -36;
   DTYP_PUSHORT                         : constant := -24;
   DTYP_PWIDTH4                         : constant := -108;
   DTYP_PWNDPARAMS                      : constant := -83;
   DTYP_PWNDPROC                        : constant := -84;
   DTYP_PWPOINT                         : constant := -59;
   DTYP_PWRECT                          : constant := -55;
   DTYP_PXYWINSIZE                      : constant := -52;
   MPVOID                               : constant := 0;
   FCF_TITLEBAR                         : constant := 16#0001#;
   FCF_SYSMENU                          : constant := 16#0002#;
   FCF_MENU                             : constant := 16#0004#;
   FCF_SIZEBORDER                       : constant := 16#0008#;
   FCF_MINBUTTON                        : constant := 16#0010#;
   FCF_MAXBUTTON                        : constant := 16#0020#;
   FCF_MINMAX                           : constant := 16#0030#;
   FCF_VERTSCROLL                       : constant := 16#0040#;
   FCF_HORZSCROLL                       : constant := 16#0080#;
   FCF_DLGBORDER                        : constant := 16#0100#;
   FCF_BORDER                           : constant := 16#0200#;
   FCF_SHELLPOSITION                    : constant := 16#0400#;
   FCF_TASKLIST                         : constant := 16#0800#;
   FCF_NOBYTEALIGN                      : constant := 16#1000#;
   FCF_NOMOVEWITHOWNER                  : constant := 16#2000#;
   FCF_ICON                             : constant := 16#4000#;
   FCF_ACCELTABLE                       : constant := 16#8000#;
   FCF_SYSMODAL                         : constant := 16#0001_0000#;
   FCF_SCREENALIGN                      : constant := 16#0002_0000#;
   FCF_MOUSEALIGN                       : constant := 16#0004_0000#;
   FCF_PALETTE_NORMAL                   : constant := 16#0008_0000#;
   FCF_PALETTE_HELP                     : constant := 16#0010_0000#;
   FCF_PALETTE_POPUPODD                 : constant := 16#0020_0000#;
   FCF_PALETTE_POPUPEVEN                : constant := 16#0040_0000#;
   FCF_HIDEBUTTON                       : constant := 16#0100_0000#;
   FCF_HIDEMAX                          : constant := 16#0100_0020#;
   FCF_AUTOICON                         : constant := 16#4000_0000#;
   FCF_DBE_APPSTAT                      : constant := 16#8000_0000#;
   FCF_STANDARD                         : constant := 16#0000_CC3F#;
   FF_FLASHWINDOW                       : constant := 16#0001#;
   FF_ACTIVE                            : constant := 16#0002#;
   FF_FLASHHILITE                       : constant := 16#0004#;
   FF_OWNERHIDDEN                       : constant := 16#0008#;
   FF_DLGDISMISSED                      : constant := 16#0010#;
   FF_OWNERDISABLED                     : constant := 16#0020#;
   FF_SELECTED                          : constant := 16#0040#;
   FF_NOACTIVATESWP                     : constant := 16#0080#;
   FS_ICON                              : constant := 16#0001#;
   FS_ACCELTABLE                        : constant := 16#0002#;
   FS_SHELLPOSITION                     : constant := 16#0004#;
   FS_TASKLIST                          : constant := 16#0008#;
   FS_NOBYTEALIGN                       : constant := 16#0010#;
   FS_NOMOVEWITHOWNER                   : constant := 16#0020#;
   FS_SYSMODAL                          : constant := 16#0040#;
   FS_DLGBORDER                         : constant := 16#0080#;
   FS_BORDER                            : constant := 16#0100#;
   FS_SCREENALIGN                       : constant := 16#0200#;
   FS_MOUSEALIGN                        : constant := 16#0400#;
   FS_SIZEBORDER                        : constant := 16#0800#;
   FS_AUTOICON                          : constant := 16#1000#;
   FS_DBE_APPSTAT                       : constant := 16#8000#;
   FS_STANDARD                          : constant := 16#000F#;
   WM_FLASHWINDOW                       : constant := 16#0040#;
   WM_FORMATFRAME                       : constant := 16#0041#;
   WM_UPDATEFRAME                       : constant := 16#0042#;
   WM_FOCUSCHANGE                       : constant := 16#0043#;
   WM_SETBORDERSIZE                     : constant := 16#0044#;
   WM_TRACKFRAME                        : constant := 16#0045#;
   WM_MINMAXFRAME                       : constant := 16#0046#;
   WM_SETICON                           : constant := 16#0047#;
   WM_QUERYICON                         : constant := 16#0048#;
   WM_SETACCELTABLE                     : constant := 16#0049#;
   WM_QUERYACCELTABLE                   : constant := 16#004A#;
   WM_TRANSLATEACCEL                    : constant := 16#004B#;
   WM_QUERYTRACKINFO                    : constant := 16#004C#;
   WM_QUERYBORDERSIZE                   : constant := 16#004D#;
   WM_NEXTMENU                          : constant := 16#004E#;
   WM_ERASEBACKGROUND                   : constant := 16#004F#;
   WM_QUERYFRAMEINFO                    : constant := 16#0050#;
   WM_QUERYFOCUSCHAIN                   : constant := 16#0051#;
   WM_OWNERPOSCHANGE                    : constant := 16#0052#;
   WM_CALCFRAMERECT                     : constant := 16#0053#;
   WM_WINDOWPOSCHANGED                  : constant := 16#0055#;
   WM_ADJUSTFRAMEPOS                    : constant := 16#0056#;
   WM_QUERYFRAMECTLCOUNT                : constant := 16#0059#;
   WM_QUERYHELPINFO                     : constant := 16#005B#;
   WM_SETHELPINFO                       : constant := 16#005C#;
   WM_ERROR                             : constant := 16#005D#;
   WM_REALIZEPALETTE                    : constant := 16#005E#;
   FI_FRAME                             : constant := 16#0001#;
   FI_OWNERHIDE                         : constant := 16#0002#;
   FI_ACTIVATEOK                        : constant := 16#0004#;
   FI_NOMOVEWITHOWNER                   : constant := 16#0008#;
   FID_SYSMENU                          : constant := 16#0000_8002#;
   FID_TITLEBAR                         : constant := 16#0000_8003#;
   FID_MINMAX                           : constant := 16#0000_8004#;
   FID_MENU                             : constant := 16#0000_8005#;
   FID_VERTSCROLL                       : constant := 16#0000_8006#;
   FID_HORZSCROLL                       : constant := 16#0000_8007#;
   FID_CLIENT                           : constant := 16#0000_8008#;
   FID_DBE_APPSTAT                      : constant := 16#0000_8010#;
   FID_DBE_KBDSTAT                      : constant := 16#0000_8011#;
   FID_DBE_PECIC                        : constant := 16#0000_8012#;
   FID_DBE_KKPOPUP                      : constant := 16#0000_8013#;
   SC_SIZE                              : constant := 16#8000#;
   SC_MOVE                              : constant := 16#0000_8001#;
   SC_MINIMIZE                          : constant := 16#0000_8002#;
   SC_MAXIMIZE                          : constant := 16#0000_8003#;
   SC_CLOSE                             : constant := 16#0000_8004#;
   SC_NEXT                              : constant := 16#0000_8005#;
   SC_APPMENU                           : constant := 16#0000_8006#;
   SC_SYSMENU                           : constant := 16#0000_8007#;
   SC_RESTORE                           : constant := 16#0000_8008#;
   SC_NEXTFRAME                         : constant := 16#0000_8009#;
   SC_NEXTWINDOW                        : constant := 16#0000_8010#;
   SC_TASKMANAGER                       : constant := 16#0000_8011#;
   SC_HELPKEYS                          : constant := 16#0000_8012#;
   SC_HELPINDEX                         : constant := 16#0000_8013#;
   SC_HELPEXTENDED                      : constant := 16#0000_8014#;
   SC_SWITCHPANELIDS                    : constant := 16#0000_8015#;
   SC_DBE_FIRST                         : constant := 16#0000_8018#;
   SC_DBE_LAST                          : constant := 16#0000_801F#;
   SC_BEGINDRAG                         : constant := 16#0000_8020#;
   SC_ENDDRAG                           : constant := 16#0000_8021#;
   SC_SELECT                            : constant := 16#0000_8022#;
   SC_OPEN                              : constant := 16#0000_8023#;
   SC_CONTEXTMENU                       : constant := 16#0000_8024#;
   SC_CONTEXTHELP                       : constant := 16#0000_8025#;
   SC_TEXTEDIT                          : constant := 16#0000_8026#;
   SC_BEGINSELECT                       : constant := 16#0000_8027#;
   SC_ENDSELECT                         : constant := 16#0000_8028#;
   SC_WINDOW                            : constant := 16#0000_8029#;
   SC_HIDE                              : constant := 16#0000_802A#;
   PSF_LOCKWINDOWUPDATE                 : constant := 16#0001#;
   PSF_CLIPUPWARDS                      : constant := 16#0002#;
   PSF_CLIPDOWNWARDS                    : constant := 16#0004#;
   PSF_CLIPSIBLINGS                     : constant := 16#0008#;
   PSF_CLIPCHILDREN                     : constant := 16#0010#;
   PSF_PARENTCLIP                       : constant := 16#0020#;
   QV_OS2                               : constant := 16#0000#;
   QV_CMS                               : constant := 16#0001#;
   QV_TSO                               : constant := 16#0002#;
   QV_TSOBATCH                          : constant := 16#0003#;
   QV_OS400                             : constant := 16#0004#;
   SW_SCROLLCHILDREN                    : constant := 16#0001#;
   SW_INVALIDATERGN                     : constant := 16#0002#;
   WM_QUERYCONVERTPOS                   : constant := 16#00B0#;
   QCP_CONVERT                          : constant := 16#0001#;
   QCP_NOCONVERT                        : constant := 16#0000#;
   QWS_USER                             : constant := 8#0000#;
   QWS_ID                               : constant := -1;
   QWS_MIN                              : constant := -1;
   QWL_USER                             : constant := 8#0000#;
   QWL_STYLE                            : constant := -2;
   QWP_PFNWP                            : constant := -3;
   QWL_HMQ                              : constant := -4;
   QWL_RESERVED                         : constant := -5;
   QWL_PENDATA                          : constant := -7;
   QWL_MIN                              : constant := -7;
   QWL_HHEAP                            : constant := 16#0004#;
   QWL_HWNDFOCUSSAVE                    : constant := 16#0018#;
   QWL_DEFBUTTON                        : constant := 16#0040#;
   QWL_PSSCBLK                          : constant := 16#0048#;
   QWL_PFEPBLK                          : constant := 16#004C#;
   QWL_PSTATBLK                         : constant := 16#0050#;
   QWS_FLAGS                            : constant := 16#0008#;
   QWS_RESULT                           : constant := 16#000A#;
   QWS_XRESTORE                         : constant := 16#000C#;
   QWS_YRESTORE                         : constant := 16#000E#;
   QWS_CXRESTORE                        : constant := 16#0010#;
   QWS_CYRESTORE                        : constant := 16#0012#;
   QWS_XMINIMIZE                        : constant := 16#0014#;
   QWS_YMINIMIZE                        : constant := 16#0016#;
   AF_CHAR                              : constant := 16#0001#;
   AF_VIRTUALKEY                        : constant := 16#0002#;
   AF_SCANCODE                          : constant := 16#0004#;
   AF_SHIFT                             : constant := 16#0008#;
   AF_CONTROL                           : constant := 16#0010#;
   AF_ALT                               : constant := 16#0020#;
   AF_LONEKEY                           : constant := 16#0040#;
   AF_SYSCOMMAND                        : constant := 16#0100#;
   AF_HELP                              : constant := 16#0200#;
   BDS_HILITED                          : constant := 16#0100#;
   BDS_DISABLED                         : constant := 16#0200#;
   BDS_DEFAULT                          : constant := 16#0400#;
   BM_CLICK                             : constant := 16#0120#;
   BM_QUERYCHECKINDEX                   : constant := 16#0121#;
   BM_QUERYHILITE                       : constant := 16#0122#;
   BM_SETHILITE                         : constant := 16#0123#;
   BM_QUERYCHECK                        : constant := 16#0124#;
   BM_SETCHECK                          : constant := 16#0125#;
   BM_SETDEFAULT                        : constant := 16#0126#;
   BN_CLICKED                           : constant := 1;
   BN_DBLCLICKED                        : constant := 2;
   BN_PAINT                             : constant := 3;
   BS_PUSHBUTTON                        : constant := 8#0000#;
   BS_CHECKBOX                          : constant := 1;
   BS_AUTOCHECKBOX                      : constant := 2;
   BS_RADIOBUTTON                       : constant := 3;
   BS_AUTORADIOBUTTON                   : constant := 4;
   BS_3STATE                            : constant := 5;
   BS_AUTO3STATE                        : constant := 6;
   BS_USERBUTTON                        : constant := 7;
   BS_PRIMARYSTYLES                     : constant := 16#000F#;
   BS_BITMAP                            : constant := 16#0040#;
   BS_ICON                              : constant := 16#0080#;
   BS_HELP                              : constant := 16#0100#;
   BS_SYSCOMMAND                        : constant := 16#0200#;
   BS_DEFAULT                           : constant := 16#0400#;
   BS_NOPOINTERFOCUS                    : constant := 16#0800#;
   BS_NOBORDER                          : constant := 16#1000#;
   BS_NOCURSORSELECT                    : constant := 16#2000#;
   BS_AUTOSIZE                          : constant := 16#4000#;
   WM_RENDERFMT                         : constant := 16#0060#;
   WM_RENDERALLFMTS                     : constant := 16#0061#;
   WM_DESTROYCLIPBOARD                  : constant := 16#0062#;
   WM_PAINTCLIPBOARD                    : constant := 16#0063#;
   WM_SIZECLIPBOARD                     : constant := 16#0064#;
   WM_HSCROLLCLIPBOARD                  : constant := 16#0065#;
   WM_VSCROLLCLIPBOARD                  : constant := 16#0066#;
   WM_DRAWCLIPBOARD                     : constant := 16#0067#;
   CF_TEXT                              : constant := 1;
   CF_BITMAP                            : constant := 2;
   CF_DSPTEXT                           : constant := 3;
   CF_DSPBITMAP                         : constant := 4;
   CF_METAFILE                          : constant := 5;
   CF_DSPMETAFILE                       : constant := 6;
   CF_PALETTE                           : constant := 9;
   CF_MMPMFIRST                         : constant := 10;
   CF_MMPMLAST                          : constant := 19;
   SZFMT_TEXT                           : constant string := "#1";
   SZFMT_BITMAP                         : constant string := "#2";
   SZFMT_DSPTEXT                        : constant string := "#3";
   SZFMT_DSPBITMAP                      : constant string := "#4";
   SZFMT_METAFILE                       : constant string := "#5";
   SZFMT_DSPMETAFILE                    : constant string := "#6";
   SZFMT_PALETTE                        : constant string := "#9";
   SZFMT_SYLK                           : constant string := "Sylk";
   SZFMT_DIF                            : constant string := "Dif";
   SZFMT_TIFF                           : constant string := "Tiff";
   SZFMT_OEMTEXT                        : constant string := "OemText";
   SZFMT_DIB                            : constant string := "Dib";
   SZFMT_OWNERDISPLAY                   : constant string := "OwnerDisplay";
   SZFMT_LINK                           : constant string := "Link";
   SZFMT_METAFILEPICT                   : constant string := "MetaFilePict";
   SZFMT_DSPMETAFILEPICT                : constant string := "DspMetaFilePict";
   SZFMT_CPTEXT                         : constant string := "Codepage Text";
   CFI_OWNERFREE                        : constant := 16#0001#;
   CFI_OWNERDISPLAY                     : constant := 16#0002#;
   CFI_HANDLE                           : constant := 16#0200#;
   CFI_POINTER                          : constant := 16#0400#;
   WM_DDE_FIRST                         : constant := 16#00A0#;
   WM_DDE_INITIATE                      : constant := 16#00A0#;
   WM_DDE_REQUEST                       : constant := 16#00A1#;
   WM_DDE_ACK                           : constant := 16#00A2#;
   WM_DDE_DATA                          : constant := 16#00A3#;
   WM_DDE_ADVISE                        : constant := 16#00A4#;
   WM_DDE_UNADVISE                      : constant := 16#00A5#;
   WM_DDE_POKE                          : constant := 16#00A6#;
   WM_DDE_EXECUTE                       : constant := 16#00A7#;
   WM_DDE_TERMINATE                     : constant := 16#00A8#;
   WM_DDE_INITIATEACK                   : constant := 16#00A9#;
   WM_DDE_LAST                          : constant := 16#00AF#;
   DDE_FACK                             : constant := 16#0001#;
   DDE_FBUSY                            : constant := 16#0002#;
   DDE_FNODATA                          : constant := 16#0004#;
   DDE_FACKREQ                          : constant := 16#0008#;
   DDE_FRESPONSE                        : constant := 16#0010#;
   DDE_NOTPROCESSED                     : constant := 16#0020#;
   DDE_FRESERVED                        : constant := 16#00C0#;
   DDE_FAPPSTATUS                       : constant := 16#0000_FF00#;
   DDECTXT_CASESENSITIVE                : constant := 16#0001#;
   DDEFMT_TEXT                          : constant := 16#0001#;
   DDEPM_RETRY                          : constant := 16#0001#;
   DDEPM_NOFREE                         : constant := 16#0002#;
   SZDDESYS_TOPIC                       : constant string := "System";
   SZDDESYS_ITEM_TOPICS                 : constant string := "Topics";
   SZDDESYS_ITEM_SYSITEMS               : constant string := "SysItems";
   SZDDESYS_ITEM_RTNMSG                 : constant string := "ReturnMessage";
   SZDDESYS_ITEM_STATUS                 : constant string := "Status";
   SZDDESYS_ITEM_FORMATS                : constant string := "Formats";
   SZDDESYS_ITEM_SECURITY               : constant string := "Security";
   SZDDESYS_ITEM_ITEMFORMATS            : constant string := "ItemFormats";
   SZDDESYS_ITEM_HELP                   : constant string := "Help";
   SZDDESYS_ITEM_PROTOCOLS              : constant string := "Protocols";
   SZDDESYS_ITEM_RESTART                : constant string := "Restart";
   WCS_ERROR                            : constant := 8#0000#;
   WCS_EQ                               : constant := 1;
   WCS_LT                               : constant := 2;
   WCS_GT                               : constant := 3;
   CURSOR_SOLID                         : constant := 16#0000#;
   CURSOR_HALFTONE                      : constant := 16#0001#;
   CURSOR_FRAME                         : constant := 16#0002#;
   CURSOR_FLASH                         : constant := 16#0004#;
   CURSOR_SETPOS                        : constant := 16#8000#;
   SDT_DESTROY                          : constant := 16#0001#;
   SDT_NOBKGND                          : constant := 16#0002#;
   SDT_TILE                             : constant := 16#0004#;
   SDT_SCALE                            : constant := 16#0008#;
   SDT_PATTERN                          : constant := 16#0010#;
   SDT_CENTER                           : constant := 16#0020#;
   SDT_RETAIN                           : constant := 16#0040#;
   SDT_LOADFILE                         : constant := 16#0080#;
   DID_OK                               : constant := 1;
   DID_CANCEL                           : constant := 2;
   DID_ERROR                            : constant := 16#0000_FFFF#;
   MB_OK                                : constant := 16#0000#;
   MB_OKCANCEL                          : constant := 16#0001#;
   MB_RETRYCANCEL                       : constant := 16#0002#;
   MB_ABORTRETRYIGNORE                  : constant := 16#0003#;
   MB_YESNO                             : constant := 16#0004#;
   MB_YESNOCANCEL                       : constant := 16#0005#;
   MB_CANCEL                            : constant := 16#0006#;
   MB_ENTER                             : constant := 16#0007#;
   MB_ENTERCANCEL                       : constant := 16#0008#;
   MB_NOICON                            : constant := 16#0000#;
   MB_CUANOTIFICATION                   : constant := 16#0000#;
   MB_ICONQUESTION                      : constant := 16#0010#;
   MB_ICONEXCLAMATION                   : constant := 16#0020#;
   MB_CUAWARNING                        : constant := 16#0020#;
   MB_ICONASTERISK                      : constant := 16#0030#;
   MB_ICONHAND                          : constant := 16#0040#;
   MB_CUACRITICAL                       : constant := 16#0040#;
   MB_QUERY                             : constant := 16#0010#;
   MB_WARNING                           : constant := 16#0020#;
   MB_INFORMATION                       : constant := 16#0030#;
   MB_CRITICAL                          : constant := 16#0040#;
   MB_ERROR                             : constant := 16#0040#;
   MB_DEFBUTTON1                        : constant := 16#0000#;
   MB_DEFBUTTON2                        : constant := 16#0100#;
   MB_DEFBUTTON3                        : constant := 16#0200#;
   MB_APPLMODAL                         : constant := 16#0000#;
   MB_SYSTEMMODAL                       : constant := 16#1000#;
   MB_HELP                              : constant := 16#2000#;
   MB_MOVEABLE                          : constant := 16#4000#;
   MBID_OK                              : constant := 1;
   MBID_CANCEL                          : constant := 2;
   MBID_ABORT                           : constant := 3;
   MBID_RETRY                           : constant := 4;
   MBID_IGNORE                          : constant := 5;
   MBID_YES                             : constant := 6;
   MBID_NO                              : constant := 7;
   MBID_HELP                            : constant := 8;
   MBID_ENTER                           : constant := 9;
   MBID_ERROR                           : constant := 16#0000_FFFF#;
   WA_WARNING                           : constant := 8#0000#;
   WA_NOTE                              : constant := 1;
   WA_ERROR                             : constant := 2;
   WA_CDEFALARMS                        : constant := 3;
   WA_WINDOWOPEN                        : constant := 3;
   WA_WINDOWCLOSE                       : constant := 4;
   WA_BEGINDRAG                         : constant := 5;
   WA_ENDDRAG                           : constant := 6;
   WA_STARTUP                           : constant := 7;
   WA_SHUTDOWN                          : constant := 8;
   WA_SHRED                             : constant := 9;
   WA_CWINALARMS                        : constant := 13;
   DLGC_ENTRYFIELD                      : constant := 16#0001#;
   DLGC_BUTTON                          : constant := 16#0002#;
   DLGC_RADIOBUTTON                     : constant := 16#0004#;
   DLGC_STATIC                          : constant := 16#0008#;
   DLGC_DEFAULT                         : constant := 16#0010#;
   DLGC_PUSHBUTTON                      : constant := 16#0020#;
   DLGC_CHECKBOX                        : constant := 16#0040#;
   DLGC_SCROLLBAR                       : constant := 16#0080#;
   DLGC_MENU                            : constant := 16#0100#;
   DLGC_TABONCLICK                      : constant := 16#0200#;
   DLGC_MLE                             : constant := 16#0400#;
   EDI_FIRSTTABITEM                     : constant := 8#0000#;
   EDI_LASTTABITEM                      : constant := 1;
   EDI_NEXTTABITEM                      : constant := 2;
   EDI_PREVTABITEM                      : constant := 3;
   EDI_FIRSTGROUPITEM                   : constant := 4;
   EDI_LASTGROUPITEM                    : constant := 5;
   EDI_NEXTGROUPITEM                    : constant := 6;
   EDI_PREVGROUPITEM                    : constant := 7;
   CBID_LIST                            : constant := 16#029A#;
   CBID_EDIT                            : constant := 16#029B#;
   CBM_SHOWLIST                         : constant := 16#0170#;
   CBM_HILITE                           : constant := 16#0171#;
   CBM_ISLISTSHOWING                    : constant := 16#0172#;
   CBN_EFCHANGE                         : constant := 1;
   CBN_EFSCROLL                         : constant := 2;
   CBN_MEMERROR                         : constant := 3;
   CBN_LBSELECT                         : constant := 4;
   CBN_LBSCROLL                         : constant := 5;
   CBN_SHOWLIST                         : constant := 6;
   CBN_ENTER                            : constant := 7;
   CBS_SIMPLE                           : constant := 16#0001#;
   CBS_DROPDOWN                         : constant := 16#0002#;
   CBS_DROPDOWNLIST                     : constant := 16#0004#;
   CBS_COMPATIBLE                       : constant := 16#0008#;
   EM_QUERYCHANGED                      : constant := 16#0140#;
   EM_QUERYSEL                          : constant := 16#0141#;
   EM_SETSEL                            : constant := 16#0142#;
   EM_SETTEXTLIMIT                      : constant := 16#0143#;
   EM_CUT                               : constant := 16#0144#;
   EM_COPY                              : constant := 16#0145#;
   EM_CLEAR                             : constant := 16#0146#;
   EM_PASTE                             : constant := 16#0147#;
   EM_QUERYFIRSTCHAR                    : constant := 16#0148#;
   EM_SETFIRSTCHAR                      : constant := 16#0149#;
   EM_QUERYREADONLY                     : constant := 16#014A#;
   EM_SETREADONLY                       : constant := 16#014B#;
   EM_SETINSERTMODE                     : constant := 16#014C#;
   EN_SETFOCUS                          : constant := 16#0001#;
   EN_KILLFOCUS                         : constant := 16#0002#;
   EN_CHANGE                            : constant := 16#0004#;
   EN_SCROLL                            : constant := 16#0008#;
   EN_MEMERROR                          : constant := 16#0010#;
   EN_OVERFLOW                          : constant := 16#0020#;
   EN_INSERTMODETOGGLE                  : constant := 16#0040#;
   ES_LEFT                              : constant := 16#0000#;
   ES_CENTER                            : constant := 16#0001#;
   ES_RIGHT                             : constant := 16#0002#;
   ES_AUTOSCROLL                        : constant := 16#0004#;
   ES_MARGIN                            : constant := 16#0008#;
   ES_AUTOTAB                           : constant := 16#0010#;
   ES_READONLY                          : constant := 16#0020#;
   ES_COMMAND                           : constant := 16#0040#;
   ES_UNREADABLE                        : constant := 16#0080#;
   ES_AUTOSIZE                          : constant := 16#0200#;
   ES_ANY                               : constant := 16#0000#;
   ES_SBCS                              : constant := 16#1000#;
   ES_DBCS                              : constant := 16#2000#;
   ES_MIXED                             : constant := 16#3000#;
   TBM_SETHILITE                        : constant := 16#01E3#;
   TBM_QUERYHILITE                      : constant := 16#01E4#;
   HK_SENDMSG                           : constant := 8#0000#;
   HK_INPUT                             : constant := 1;
   HK_MSGFILTER                         : constant := 2;
   HK_JOURNALRECORD                     : constant := 3;
   HK_JOURNALPLAYBACK                   : constant := 4;
   HK_HELP                              : constant := 5;
   HK_LOADER                            : constant := 6;
   HK_REGISTERUSERMSG                   : constant := 7;
   HK_MSGCONTROL                        : constant := 8;
   HK_PLIST_ENTRY                       : constant := 9;
   HK_PLIST_EXIT                        : constant := 10;
   HK_FINDWORD                          : constant := 11;
   HK_CODEPAGECHANGED                   : constant := 12;
   HK_WINDOWDC                          : constant := 15;
   HK_DESTROYWINDOW                     : constant := 16#0010#;
   HK_CHECKMSGFILTER                    : constant := 20;
   HK_MSGINPUT                          : constant := 21;
   HK_ALARM                             : constant := 22;
   HK_LOCKUP                            : constant := 23;
   HK_FLUSHBUF                          : constant := 24;
   HLPM_FRAME                           : constant := -1;
   HLPM_WINDOW                          : constant := -2;
   HLPM_MENU                            : constant := -3;
    HMQ_CURRENT                         : constant HMQ := 1;
   LHK_DELETEPROC                       : constant := 1;
   LHK_DELETELIB                        : constant := 2;
   LHK_LOADPROC                         : constant := 3;
   LHK_LOADLIB                          : constant := 4;
   MCHK_MSGINTEREST                     : constant := 1;
   MCHK_CLASSMSGINTEREST                : constant := 2;
   MCHK_SYNCHRONISATION                 : constant := 3;
   MCHK_MSGMODE                         : constant := 4;
   MSGF_DIALOGBOX                       : constant := 1;
   MSGF_MESSAGEBOX                      : constant := 2;
   MSGF_DDEPOSTMSG                      : constant := 3;
   MSGF_TRACK                           : constant := 8;
   PM_MODEL_1X                          : constant := 8#0000#;
   PM_MODEL_2X                          : constant := 1;
   RUMHK_DATATYPE                       : constant := 1;
   RUMHK_MSG                            : constant := 2;
   FC_NOSETFOCUS                        : constant := 16#0001#;
   FC_NOBRINGTOTOP                      : constant := 16#0001#;
   FC_NOLOSEFOCUS                       : constant := 16#0002#;
   FC_NOBRINGTOPFIRSTWINDOW             : constant := 16#0002#;
   FC_NOSETACTIVE                       : constant := 16#0004#;
   FC_NOLOSEACTIVE                      : constant := 16#0008#;
   FC_NOSETSELECTION                    : constant := 16#0010#;
   FC_NOLOSESELECTION                   : constant := 16#0020#;
   QFC_NEXTINCHAIN                      : constant := 16#0001#;
   QFC_ACTIVE                           : constant := 16#0002#;
   QFC_FRAME                            : constant := 16#0003#;
   QFC_SELECTACTIVE                     : constant := 16#0004#;
   QFC_PARTOFCHAIN                      : constant := 16#0005#;
   WM_MOUSEFIRST                        : constant := 16#0070#;
   WM_MOUSEMOVE                         : constant := 16#0070#;
   WM_BUTTONCLICKFIRST                  : constant := 16#0071#;
   WM_BUTTON1DOWN                       : constant := 16#0071#;
   WM_BUTTON1UP                         : constant := 16#0072#;
   WM_BUTTON1DBLCLK                     : constant := 16#0073#;
   WM_BUTTON2DOWN                       : constant := 16#0074#;
   WM_BUTTON2UP                         : constant := 16#0075#;
   WM_BUTTON2DBLCLK                     : constant := 16#0076#;
   WM_BUTTON3DOWN                       : constant := 16#0077#;
   WM_BUTTON3UP                         : constant := 16#0078#;
   WM_BUTTON3DBLCLK                     : constant := 16#0079#;
   WM_BUTTONCLICKLAST                   : constant := 16#0079#;
   WM_MOUSELAST                         : constant := 16#0079#;
   WM_CHAR                              : constant := 16#007A#;
   WM_VIOCHAR                           : constant := 16#007B#;
   WM_JOURNALNOTIFY                     : constant := 16#007C#;
   WM_MOUSEMAP                          : constant := 16#007D#;
   WM_VRNDISABLED                       : constant := 16#007E#;
   WM_VRNENABLED                        : constant := 16#007F#;
   WM_EXTMOUSEFIRST                     : constant := 16#0410#;
   WM_CHORD                             : constant := 16#0410#;
   WM_BUTTON1MOTIONSTART                : constant := 16#0411#;
   WM_BUTTON1MOTIONEND                  : constant := 16#0412#;
   WM_BUTTON1CLICK                      : constant := 16#0413#;
   WM_BUTTON2MOTIONSTART                : constant := 16#0414#;
   WM_BUTTON2MOTIONEND                  : constant := 16#0415#;
   WM_BUTTON2CLICK                      : constant := 16#0416#;
   WM_BUTTON3MOTIONSTART                : constant := 16#0417#;
   WM_BUTTON3MOTIONEND                  : constant := 16#0418#;
   WM_BUTTON3CLICK                      : constant := 16#0419#;
   WM_EXTMOUSELAST                      : constant := 16#0419#;
   WM_MOUSETRANSLATEFIRST               : constant := 16#0420#;
   WM_BEGINDRAG                         : constant := 16#0420#;
   WM_ENDDRAG                           : constant := 16#0421#;
   WM_SINGLESELECT                      : constant := 16#0422#;
   WM_OPEN                              : constant := 16#0423#;
   WM_CONTEXTMENU                       : constant := 16#0424#;
   WM_CONTEXTHELP                       : constant := 16#0425#;
   WM_TEXTEDIT                          : constant := 16#0426#;
   WM_BEGINSELECT                       : constant := 16#0427#;
   WM_ENDSELECT                         : constant := 16#0428#;
   WM_MOUSETRANSLATELAST                : constant := 16#0428#;
   WM_PENFIRST                          : constant := 16#0481#;
   WM_PENLAST                           : constant := 16#049F#;
   WM_MMPMFIRST                         : constant := 16#0500#;
   WM_MMPMLAST                          : constant := 16#05FF#;
   INP_NONE                             : constant := 16#0000#;
   INP_KBD                              : constant := 16#0001#;
   INP_MULT                             : constant := 16#0002#;
   INP_RES2                             : constant := 16#0004#;
   INP_SHIFT                            : constant := 16#0008#;
   INP_CTRL                             : constant := 16#0010#;
   INP_ALT                              : constant := 16#0020#;
   INP_RES3                             : constant := 16#0040#;
   INP_RES4                             : constant := 16#0080#;
   INP_IGNORE                           : constant := 16#0000_FFFF#;
   JRN_QUEUESTATUS                      : constant := 16#0001#;
   JRN_PHYSKEYSTATE                     : constant := 16#0002#;
   KC_NONE                              : constant := 16#0000#;
   KC_CHAR                              : constant := 16#0001#;
   KC_VIRTUALKEY                        : constant := 16#0002#;
   KC_SCANCODE                          : constant := 16#0004#;
   KC_SHIFT                             : constant := 16#0008#;
   KC_CTRL                              : constant := 16#0010#;
   KC_ALT                               : constant := 16#0020#;
   KC_KEYUP                             : constant := 16#0040#;
   KC_PREVDOWN                          : constant := 16#0080#;
   KC_LONEKEY                           : constant := 16#0100#;
   KC_DEADKEY                           : constant := 16#0200#;
   KC_COMPOSITE                         : constant := 16#0400#;
   KC_INVALIDCOMP                       : constant := 16#0800#;
   KC_TOGGLE                            : constant := 16#1000#;
   KC_INVALIDCHAR                       : constant := 16#2000#;
   KC_DBCSRSRVD1                        : constant := 16#4000#;
   KC_DBCSRSRVD2                        : constant := 16#8000#;
   VK_BUTTON1                           : constant := 16#0001#;
   VK_BUTTON2                           : constant := 16#0002#;
   VK_BUTTON3                           : constant := 16#0003#;
   VK_BREAK                             : constant := 16#0004#;
   VK_BACKSPACE                         : constant := 16#0005#;
   VK_TAB                               : constant := 16#0006#;
   VK_BACKTAB                           : constant := 16#0007#;
   VK_NEWLINE                           : constant := 16#0008#;
   VK_SHIFT                             : constant := 16#0009#;
   VK_CTRL                              : constant := 16#000A#;
   VK_ALT                               : constant := 16#000B#;
   VK_ALTGRAF                           : constant := 16#000C#;
   VK_PAUSE                             : constant := 16#000D#;
   VK_CAPSLOCK                          : constant := 16#000E#;
   VK_ESC                               : constant := 16#000F#;
   VK_SPACE                             : constant := 16#0010#;
   VK_PAGEUP                            : constant := 16#0011#;
   VK_PAGEDOWN                          : constant := 16#0012#;
   VK_END                               : constant := 16#0013#;
   VK_HOME                              : constant := 16#0014#;
   VK_LEFT                              : constant := 16#0015#;
   VK_UP                                : constant := 16#0016#;
   VK_RIGHT                             : constant := 16#0017#;
   VK_DOWN                              : constant := 16#0018#;
   VK_PRINTSCRN                         : constant := 16#0019#;
   VK_INSERT                            : constant := 16#001A#;
   VK_DELETE                            : constant := 16#001B#;
   VK_SCRLLOCK                          : constant := 16#001C#;
   VK_NUMLOCK                           : constant := 16#001D#;
   VK_ENTER                             : constant := 16#001E#;
   VK_SYSRQ                             : constant := 16#001F#;
   VK_F1                                : constant := 16#0020#;
   VK_F2                                : constant := 16#0021#;
   VK_F3                                : constant := 16#0022#;
   VK_F4                                : constant := 16#0023#;
   VK_F5                                : constant := 16#0024#;
   VK_F6                                : constant := 16#0025#;
   VK_F7                                : constant := 16#0026#;
   VK_F8                                : constant := 16#0027#;
   VK_F9                                : constant := 16#0028#;
   VK_F10                               : constant := 16#0029#;
   VK_F11                               : constant := 16#002A#;
   VK_F12                               : constant := 16#002B#;
   VK_F13                               : constant := 16#002C#;
   VK_F14                               : constant := 16#002D#;
   VK_F15                               : constant := 16#002E#;
   VK_F16                               : constant := 16#002F#;
   VK_F17                               : constant := 16#0030#;
   VK_F18                               : constant := 16#0031#;
   VK_F19                               : constant := 16#0032#;
   VK_F20                               : constant := 16#0033#;
   VK_F21                               : constant := 16#0034#;
   VK_F22                               : constant := 16#0035#;
   VK_F23                               : constant := 16#0036#;
   VK_F24                               : constant := 16#0037#;
   VK_ENDDRAG                           : constant := 16#0038#;
   VK_CLEAR                             : constant := 16#0039#;
   VK_EREOF                             : constant := 16#003A#;
   VK_PA1                               : constant := 16#003B#;
   VK_MENU                              : constant := 16#0029#;
   VK_DBCSFIRST                         : constant := 16#0080#;
   VK_DBCSLAST                          : constant := 16#00FF#;
   VK_USERFIRST                         : constant := 16#0100#;
   VK_USERLAST                          : constant := 16#01FF#;
   LS_MULTIPLESEL                       : constant := 16#0001#;
   LS_OWNERDRAW                         : constant := 16#0002#;
   LS_NOADJUSTPOS                       : constant := 16#0004#;
   LS_HORZSCROLL                        : constant := 16#0008#;
   LS_EXTENDEDSEL                       : constant := 16#0010#;
   LN_SELECT                            : constant := 1;
   LN_SETFOCUS                          : constant := 2;
   LN_KILLFOCUS                         : constant := 3;
   LN_SCROLL                            : constant := 4;
   LN_ENTER                             : constant := 5;
   LM_QUERYITEMCOUNT                    : constant := 16#0160#;
   LM_INSERTITEM                        : constant := 16#0161#;
   LM_SETTOPINDEX                       : constant := 16#0162#;
   LM_DELETEITEM                        : constant := 16#0163#;
   LM_SELECTITEM                        : constant := 16#0164#;
   LM_QUERYSELECTION                    : constant := 16#0165#;
   LM_SETITEMTEXT                       : constant := 16#0166#;
   LM_QUERYITEMTEXTLENGTH               : constant := 16#0167#;
   LM_QUERYITEMTEXT                     : constant := 16#0168#;
   LM_SETITEMHANDLE                     : constant := 16#0169#;
   LM_QUERYITEMHANDLE                   : constant := 16#016A#;
   LM_SEARCHSTRING                      : constant := 16#016B#;
   LM_SETITEMHEIGHT                     : constant := 16#016C#;
   LM_QUERYTOPINDEX                     : constant := 16#016D#;
   LM_DELETEALL                         : constant := 16#016E#;
   LIT_CURSOR                           : constant := -4;
   LIT_ERROR                            : constant := -3;
   LIT_MEMERROR                         : constant := -2;
   LIT_NONE                             : constant := -1;
   LIT_FIRST                            : constant := -1;
   LIT_END                              : constant := -1;
   LIT_SORTASCENDING                    : constant := -2;
   LIT_SORTDESCENDING                   : constant := -3;
   LSS_SUBSTRING                        : constant := 16#0001#;
   LSS_PREFIX                           : constant := 16#0002#;
   LSS_CASESENSITIVE                    : constant := 16#0004#;
   MIA_NODISMISS                        : constant := 16#0020#;
   MIA_FRAMED                           : constant := 16#1000#;
   MIA_CHECKED                          : constant := 16#2000#;
   MIA_DISABLED                         : constant := 16#4000#;
   MIA_HILITED                          : constant := 16#8000#;
   MIS_TEXT                             : constant := 16#0001#;
   MIS_BITMAP                           : constant := 16#0002#;
   MIS_SEPARATOR                        : constant := 16#0004#;
   MIS_OWNERDRAW                        : constant := 16#0008#;
   MIS_SUBMENU                          : constant := 16#0010#;
   MIS_MULTMENU                         : constant := 16#0020#;
   MIS_SYSCOMMAND                       : constant := 16#0040#;
   MIS_HELP                             : constant := 16#0080#;
   MIS_STATIC                           : constant := 16#0100#;
   MIS_BUTTONSEPARATOR                  : constant := 16#0200#;
   MIS_BREAK                            : constant := 16#0400#;
   MIS_BREAKSEPARATOR                   : constant := 16#0800#;
   MIS_GROUP                            : constant := 16#1000#;
   MIS_SINGLE                           : constant := 16#2000#;
   MIT_END                              : constant := -1;
   MIT_NONE                             : constant := -1;
   MIT_MEMERROR                         : constant := -1;
   MIT_ERROR                            : constant := -1;
   MIT_FIRST                            : constant := -2;
   MIT_LAST                             : constant := -3;
   MM_INSERTITEM                        : constant := 16#0180#;
   MM_DELETEITEM                        : constant := 16#0181#;
   MM_QUERYITEM                         : constant := 16#0182#;
   MM_SETITEM                           : constant := 16#0183#;
   MM_QUERYITEMCOUNT                    : constant := 16#0184#;
   MM_STARTMENUMODE                     : constant := 16#0185#;
   MM_ENDMENUMODE                       : constant := 16#0186#;
   MM_REMOVEITEM                        : constant := 16#0188#;
   MM_SELECTITEM                        : constant := 16#0189#;
   MM_QUERYSELITEMID                    : constant := 16#018A#;
   MM_QUERYITEMTEXT                     : constant := 16#018B#;
   MM_QUERYITEMTEXTLENGTH               : constant := 16#018C#;
   MM_SETITEMHANDLE                     : constant := 16#018D#;
   MM_SETITEMTEXT                       : constant := 16#018E#;
   MM_ITEMPOSITIONFROMID                : constant := 16#018F#;
   MM_ITEMIDFROMPOSITION                : constant := 16#0190#;
   MM_QUERYITEMATTR                     : constant := 16#0191#;
   MM_SETITEMATTR                       : constant := 16#0192#;
   MM_ISITEMVALID                       : constant := 16#0193#;
   MM_QUERYITEMRECT                     : constant := 16#0194#;
   MM_QUERYDEFAULTITEMID                : constant := 16#0431#;
   MM_SETDEFAULTITEMID                  : constant := 16#0432#;
   MS_ACTIONBAR                         : constant := 16#0001#;
   MS_TITLEBUTTON                       : constant := 16#0002#;
   MS_VERTICALFLIP                      : constant := 16#0004#;
   MS_CONDITIONALCASCADE                : constant := 16#0040#;
   PU_POSITIONONITEM                    : constant := 16#0001#;
   PU_HRAIN                             : constant := 16#0002#;
   PU_VRAIN                             : constant := 16#0004#;
   PU_NONE                              : constant := 16#0000#;
   PU_MOUSEBUTTON1DOWN                  : constant := 16#0008#;
   PU_MOUSEBUTTON2DOWN                  : constant := 16#0010#;
   PU_MOUSEBUTTON3DOWN                  : constant := 16#0018#;
   PU_SELECTITEM                        : constant := 16#0020#;
   PU_MOUSEBUTTON1                      : constant := 16#0040#;
   PU_MOUSEBUTTON2                      : constant := 16#0080#;
   PU_MOUSEBUTTON3                      : constant := 16#0100#;
   PU_KEYBOARD                          : constant := 16#0200#;
   BMSG_POST                            : constant := 16#0000#;
   BMSG_SEND                            : constant := 16#0001#;
   BMSG_POSTQUEUE                       : constant := 16#0002#;
   BMSG_DESCENDANTS                     : constant := 16#0004#;
   BMSG_FRAMEONLY                       : constant := 16#0008#;
   CVR_ALIGNLEFT                        : constant := 16#0001#;
   CVR_ALIGNBOTTOM                      : constant := 16#0002#;
   CVR_ALIGNRIGHT                       : constant := 16#0004#;
   CVR_ALIGNTOP                         : constant := 16#0008#;
   CVR_REDRAW                           : constant := 16#0010#;
   HT_NORMAL                            : constant := 8#0000#;
   HT_TRANSPARENT                       : constant := -1;
   HT_DISCARD                           : constant := -2;
   HT_ERROR                             : constant := -3;
   QS_KEY                               : constant := 16#0001#;
   QS_MOUSEBUTTON                       : constant := 16#0002#;
   QS_MOUSEMOVE                         : constant := 16#0004#;
   QS_MOUSE                             : constant := 16#0006#;
   QS_TIMER                             : constant := 16#0008#;
   QS_PAINT                             : constant := 16#0010#;
   QS_POSTMSG                           : constant := 16#0020#;
   QS_SEM1                              : constant := 16#0040#;
   QS_SEM2                              : constant := 16#0080#;
   QS_SEM3                              : constant := 16#0100#;
   QS_SEM4                              : constant := 16#0200#;
   QS_SENDMSG                           : constant := 16#0400#;
   QS_MSGINPUT                          : constant := 16#0800#;
   SMIM_ALL                             : constant := 16#0EFF#;
   SMI_NOINTEREST                       : constant := 16#0001#;
   SMI_INTEREST                         : constant := 16#0002#;
   SMI_RESET                            : constant := 16#0004#;
   SMI_AUTODISPATCH                     : constant := 16#0008#;
   WPM_TEXT                             : constant := 16#0001#;
   WPM_CTLDATA                          : constant := 16#0002#;
   WPM_PRESPARAMS                       : constant := 16#0004#;
   WPM_CCHTEXT                          : constant := 16#0008#;
   WPM_CBCTLDATA                        : constant := 16#0010#;
   WPM_CBPRESPARAMS                     : constant := 16#0020#;
   DP_NORMAL                            : constant := 16#0000#;
   DP_HALFTONED                         : constant := 16#0001#;
   DP_INVERTED                          : constant := 16#0002#;
   SBMP_OLD_SYSMENU                     : constant := 1;
   SBMP_OLD_SBUPARROW                   : constant := 2;
   SBMP_OLD_SBDNARROW                   : constant := 3;
   SBMP_OLD_SBRGARROW                   : constant := 4;
   SBMP_OLD_SBLFARROW                   : constant := 5;
   SBMP_MENUCHECK                       : constant := 6;
   SBMP_OLD_CHECKBOXES                  : constant := 7;
   SBMP_BTNCORNERS                      : constant := 8;
   SBMP_OLD_MINBUTTON                   : constant := 9;
   SBMP_OLD_MAXBUTTON                   : constant := 10;
   SBMP_OLD_RESTOREBUTTON               : constant := 11;
   SBMP_OLD_CHILDSYSMENU                : constant := 12;
   SBMP_DRIVE                           : constant := 15;
   SBMP_FILE                            : constant := 16#0010#;
   SBMP_FOLDER                          : constant := 17;
   SBMP_TREEPLUS                        : constant := 18;
   SBMP_TREEMINUS                       : constant := 19;
   SBMP_PROGRAM                         : constant := 22;
   SBMP_MENUATTACHED                    : constant := 23;
   SBMP_SIZEBOX                         : constant := 24;
   SBMP_SYSMENU                         : constant := 25;
   SBMP_MINBUTTON                       : constant := 26;
   SBMP_MAXBUTTON                       : constant := 27;
   SBMP_RESTOREBUTTON                   : constant := 28;
   SBMP_CHILDSYSMENU                    : constant := 29;
   SBMP_SYSMENUDEP                      : constant := 30;
   SBMP_MINBUTTONDEP                    : constant := 31;
   SBMP_MAXBUTTONDEP                    : constant := 16#0020#;
   SBMP_RESTOREBUTTONDEP                : constant := 33;
   SBMP_CHILDSYSMENUDEP                 : constant := 34;
   SBMP_SBUPARROW                       : constant := 35;
   SBMP_SBDNARROW                       : constant := 36;
   SBMP_SBLFARROW                       : constant := 37;
   SBMP_SBRGARROW                       : constant := 38;
   SBMP_SBUPARROWDEP                    : constant := 39;
   SBMP_SBDNARROWDEP                    : constant := 40;
   SBMP_SBLFARROWDEP                    : constant := 41;
   SBMP_SBRGARROWDEP                    : constant := 42;
   SBMP_SBUPARROWDIS                    : constant := 43;
   SBMP_SBDNARROWDIS                    : constant := 44;
   SBMP_SBLFARROWDIS                    : constant := 45;
   SBMP_SBRGARROWDIS                    : constant := 46;
   SBMP_COMBODOWN                       : constant := 47;
   SBMP_CHECKBOXES                      : constant := 48;
   SPTR_ARROW                           : constant := 1;
   SPTR_TEXT                            : constant := 2;
   SPTR_WAIT                            : constant := 3;
   SPTR_SIZE                            : constant := 4;
   SPTR_MOVE                            : constant := 5;
   SPTR_SIZENWSE                        : constant := 6;
   SPTR_SIZENESW                        : constant := 7;
   SPTR_SIZEWE                          : constant := 8;
   SPTR_SIZENS                          : constant := 9;
   SPTR_APPICON                         : constant := 10;
   SPTR_ICONINFORMATION                 : constant := 11;
   SPTR_ICONQUESTION                    : constant := 12;
   SPTR_ICONERROR                       : constant := 13;
   SPTR_ICONWARNING                     : constant := 14;
   SPTR_ILLEGAL                         : constant := 18;
   SPTR_FILE                            : constant := 19;
   SPTR_FOLDER                          : constant := 20;
   SPTR_MULTFILE                        : constant := 21;
   SPTR_PROGRAM                         : constant := 22;
   SPTR_DISPLAY_PTRS                    : constant := 22;
   SPTR_PENFIRST                        : constant := 23;
   SPTR_PENLAST                         : constant := 39;
   SPTR_CPTR                            : constant := 39;
   SPTR_HANDICON                        : constant := 13;
   SPTR_QUESICON                        : constant := 12;
   SPTR_BANGICON                        : constant := 14;
   SPTR_NOTEICON                        : constant := 11;
   SB_LINEUP                            : constant := 1;
   SB_LINEDOWN                          : constant := 2;
   SB_LINELEFT                          : constant := 1;
   SB_LINERIGHT                         : constant := 2;
   SB_PAGEUP                            : constant := 3;
   SB_PAGEDOWN                          : constant := 4;
   SB_PAGELEFT                          : constant := 3;
   SB_PAGERIGHT                         : constant := 4;
   SB_SLIDERTRACK                       : constant := 5;
   SB_SLIDERPOSITION                    : constant := 6;
   SB_ENDSCROLL                         : constant := 7;
   SBM_SETSCROLLBAR                     : constant := 16#01A0#;
   SBM_SETPOS                           : constant := 16#01A1#;
   SBM_QUERYPOS                         : constant := 16#01A2#;
   SBM_QUERYRANGE                       : constant := 16#01A3#;
   SBM_SETTHUMBSIZE                     : constant := 16#01A6#;
   SBS_HORZ                             : constant := 8#0000#;
   SBS_VERT                             : constant := 1;
   SBS_THUMBSIZE                        : constant := 2;
   SBS_AUTOTRACK                        : constant := 4;
   SBS_AUTOSIZE                         : constant := 16#2000#;
   SM_SETHANDLE                         : constant := 16#0100#;
   SM_QUERYHANDLE                       : constant := 16#0101#;
   SS_TEXT                              : constant := 16#0001#;
   SS_GROUPBOX                          : constant := 16#0002#;
   SS_ICON                              : constant := 16#0003#;
   SS_BITMAP                            : constant := 16#0004#;
   SS_FGNDRECT                          : constant := 16#0005#;
   SS_HALFTONERECT                      : constant := 16#0006#;
   SS_BKGNDRECT                         : constant := 16#0007#;
   SS_FGNDFRAME                         : constant := 16#0008#;
   SS_HALFTONEFRAME                     : constant := 16#0009#;
   SS_BKGNDFRAME                        : constant := 16#000A#;
   SS_SYSICON                           : constant := 16#000B#;
   SS_AUTOSIZE                          : constant := 16#0040#;
   PP_FOREGROUNDCOLOR                   : constant := 1;
   PP_FOREGROUNDCOLORINDEX              : constant := 2;
   PP_BACKGROUNDCOLOR                   : constant := 3;
   PP_BACKGROUNDCOLORINDEX              : constant := 4;
   PP_HILITEFOREGROUNDCOLOR             : constant := 5;
   PP_HILITEFOREGROUNDCOLORINDEX        : constant := 6;
   PP_HILITEBACKGROUNDCOLOR             : constant := 7;
   PP_HILITEBACKGROUNDCOLORINDEX        : constant := 8;
   PP_DISABLEDFOREGROUNDCOLOR           : constant := 9;
   PP_DISABLEDFOREGROUNDCOLORINDEX      : constant := 10;
   PP_DISABLEDBACKGROUNDCOLOR           : constant := 11;
   PP_DISABLEDBACKGROUNDCOLORINDEX      : constant := 12;
   PP_BORDERCOLOR                       : constant := 13;
   PP_BORDERCOLORINDEX                  : constant := 14;
   PP_FONTNAMESIZE                      : constant := 15;
   PP_FONTHANDLE                        : constant := 16#0010#;
   PP_RESERVED                          : constant := 17;
   PP_ACTIVECOLOR                       : constant := 18;
   PP_ACTIVECOLORINDEX                  : constant := 19;
   PP_INACTIVECOLOR                     : constant := 20;
   PP_INACTIVECOLORINDEX                : constant := 21;
   PP_ACTIVETEXTFGNDCOLOR               : constant := 22;
   PP_ACTIVETEXTFGNDCOLORINDEX          : constant := 23;
   PP_ACTIVETEXTBGNDCOLOR               : constant := 24;
   PP_ACTIVETEXTBGNDCOLORINDEX          : constant := 25;
   PP_INACTIVETEXTFGNDCOLOR             : constant := 26;
   PP_INACTIVETEXTFGNDCOLORINDEX        : constant := 27;
   PP_INACTIVETEXTBGNDCOLOR             : constant := 28;
   PP_INACTIVETEXTBGNDCOLORINDEX        : constant := 29;
   PP_SHADOW                            : constant := 30;
   PP_MENUFOREGROUNDCOLOR               : constant := 31;
   PP_MENUFOREGROUNDCOLORINDEX          : constant := 16#0020#;
   PP_MENUBACKGROUNDCOLOR               : constant := 33;
   PP_MENUBACKGROUNDCOLORINDEX          : constant := 34;
   PP_MENUHILITEFGNDCOLOR               : constant := 35;
   PP_MENUHILITEFGNDCOLORINDEX          : constant := 36;
   PP_MENUHILITEBGNDCOLOR               : constant := 37;
   PP_MENUHILITEBGNDCOLORINDEX          : constant := 38;
   PP_MENUDISABLEDFGNDCOLOR             : constant := 39;
   PP_MENUDISABLEDFGNDCOLORINDEX        : constant := 40;
   PP_MENUDISABLEDBGNDCOLOR             : constant := 41;
   PP_MENUDISABLEDBGNDCOLORINDEX        : constant := 42;
   PP_USER                              : constant := 16#8000#;
   QPF_NOINHERIT                        : constant := 16#0001#;
   QPF_ID1COLORINDEX                    : constant := 16#0002#;
   QPF_ID2COLORINDEX                    : constant := 16#0004#;
   QPF_PURERGBCOLOR                     : constant := 16#0008#;
   QPF_VALIDFLAGS                       : constant := 16#000F#;
   SV_SWAPBUTTON                        : constant := 8#0000#;
   SV_DBLCLKTIME                        : constant := 1;
   SV_CXDBLCLK                          : constant := 2;
   SV_CYDBLCLK                          : constant := 3;
   SV_CXSIZEBORDER                      : constant := 4;
   SV_CYSIZEBORDER                      : constant := 5;
   SV_ALARM                             : constant := 6;
   SV_CURSORRATE                        : constant := 9;
   SV_FIRSTSCROLLRATE                   : constant := 10;
   SV_SCROLLRATE                        : constant := 11;
   SV_NUMBEREDLISTS                     : constant := 12;
   SV_WARNINGFREQ                       : constant := 13;
   SV_NOTEFREQ                          : constant := 14;
   SV_ERRORFREQ                         : constant := 15;
   SV_WARNINGDURATION                   : constant := 16#0010#;
   SV_NOTEDURATION                      : constant := 17;
   SV_ERRORDURATION                     : constant := 18;
   SV_CXSCREEN                          : constant := 20;
   SV_CYSCREEN                          : constant := 21;
   SV_CXVSCROLL                         : constant := 22;
   SV_CYHSCROLL                         : constant := 23;
   SV_CYVSCROLLARROW                    : constant := 24;
   SV_CXHSCROLLARROW                    : constant := 25;
   SV_CXBORDER                          : constant := 26;
   SV_CYBORDER                          : constant := 27;
   SV_CXDLGFRAME                        : constant := 28;
   SV_CYDLGFRAME                        : constant := 29;
   SV_CYTITLEBAR                        : constant := 30;
   SV_CYVSLIDER                         : constant := 31;
   SV_CXHSLIDER                         : constant := 16#0020#;
   SV_CXMINMAXBUTTON                    : constant := 33;
   SV_CYMINMAXBUTTON                    : constant := 34;
   SV_CYMENU                            : constant := 35;
   SV_CXFULLSCREEN                      : constant := 36;
   SV_CYFULLSCREEN                      : constant := 37;
   SV_CXICON                            : constant := 38;
   SV_CYICON                            : constant := 39;
   SV_CXPOINTER                         : constant := 40;
   SV_CYPOINTER                         : constant := 41;
   SV_DEBUG                             : constant := 42;
   SV_CMOUSEBUTTONS                     : constant := 43;
   SV_CPOINTERBUTTONS                   : constant := 43;
   SV_POINTERLEVEL                      : constant := 44;
   SV_CURSORLEVEL                       : constant := 45;
   SV_TRACKRECTLEVEL                    : constant := 46;
   SV_CTIMERS                           : constant := 47;
   SV_MOUSEPRESENT                      : constant := 48;
   SV_CXBYTEALIGN                       : constant := 49;
   SV_CXALIGN                           : constant := 49;
   SV_CYBYTEALIGN                       : constant := 50;
   SV_CYALIGN                           : constant := 50;
   SV_EXTRAKEYBEEP                      : constant := 57;
   SV_SETLIGHTS                         : constant := 58;
   SV_INSERTMODE                        : constant := 59;
   SV_MENUROLLDOWNDELAY                 : constant := 16#0040#;
   SV_MENUROLLUPDELAY                   : constant := 65;
   SV_ALTMNEMONIC                       : constant := 66;
   SV_TASKLISTMOUSEACCESS               : constant := 67;
   SV_CXICONTEXTWIDTH                   : constant := 68;
   SV_CICONTEXTLINES                    : constant := 69;
   SV_CHORDTIME                         : constant := 70;
   SV_CXCHORD                           : constant := 71;
   SV_CYCHORD                           : constant := 72;
   SV_CXMOTIONSTART                     : constant := 73;
   SV_CYMOTIONSTART                     : constant := 74;
   SV_BEGINDRAG                         : constant := 75;
   SV_ENDDRAG                           : constant := 76;
   SV_SINGLESELECT                      : constant := 77;
   SV_OPEN                              : constant := 78;
   SV_CONTEXTMENU                       : constant := 79;
   SV_CONTEXTHELP                       : constant := 80;
   SV_TEXTEDIT                          : constant := 81;
   SV_BEGINSELECT                       : constant := 82;
   SV_ENDSELECT                         : constant := 83;
   SV_BEGINDRAGKB                       : constant := 84;
   SV_ENDDRAGKB                         : constant := 85;
   SV_SELECTKB                          : constant := 86;
   SV_OPENKB                            : constant := 87;
   SV_CONTEXTMENUKB                     : constant := 88;
   SV_CONTEXTHELPKB                     : constant := 89;
   SV_TEXTEDITKB                        : constant := 90;
   SV_BEGINSELECTKB                     : constant := 91;
   SV_ENDSELECTKB                       : constant := 92;
   SV_ANIMATION                         : constant := 93;
   SV_ANIMATIONSPEED                    : constant := 94;
   SV_MONOICONS                         : constant := 95;
   SV_KBDALTERED                        : constant := 96;
   SV_PRINTSCREEN                       : constant := 97;
   SV_CSYSVALUES                        : constant := 98;
   SYSCLR_SHADOWHILITEBGND              : constant := -50;
   SYSCLR_SHADOWHILITEFGND              : constant := -49;
   SYSCLR_SHADOWTEXT                    : constant := -48;
   SYSCLR_ENTRYFIELD                    : constant := -47;
   SYSCLR_MENUDISABLEDTEXT              : constant := -46;
   SYSCLR_MENUHILITE                    : constant := -45;
   SYSCLR_MENUHILITEBGND                : constant := -44;
   SYSCLR_PAGEBACKGROUND                : constant := -43;
   SYSCLR_FIELDBACKGROUND               : constant := -42;
   SYSCLR_BUTTONLIGHT                   : constant := -41;
   SYSCLR_BUTTONMIDDLE                  : constant := -40;
   SYSCLR_BUTTONDARK                    : constant := -39;
   SYSCLR_BUTTONDEFAULT                 : constant := -38;
   SYSCLR_TITLEBOTTOM                   : constant := -37;
   SYSCLR_SHADOW                        : constant := -36;
   SYSCLR_ICONTEXT                      : constant := -35;
   SYSCLR_DIALOGBACKGROUND              : constant := -34;
   SYSCLR_HILITEFOREGROUND              : constant := -33;
   SYSCLR_HILITEBACKGROUND              : constant := -32;
   SYSCLR_INACTIVETITLETEXTBGND         : constant := -31;
   SYSCLR_ACTIVETITLETEXTBGND           : constant := -30;
   SYSCLR_INACTIVETITLETEXT             : constant := -29;
   SYSCLR_ACTIVETITLETEXT               : constant := -28;
   SYSCLR_OUTPUTTEXT                    : constant := -27;
   SYSCLR_WINDOWSTATICTEXT              : constant := -26;
   SYSCLR_SCROLLBAR                     : constant := -25;
   SYSCLR_BACKGROUND                    : constant := -24;
   SYSCLR_ACTIVETITLE                   : constant := -23;
   SYSCLR_INACTIVETITLE                 : constant := -22;
   SYSCLR_MENU                          : constant := -21;
   SYSCLR_WINDOW                        : constant := -20;
   SYSCLR_WINDOWFRAME                   : constant := -19;
   SYSCLR_MENUTEXT                      : constant := -18;
   SYSCLR_WINDOWTEXT                    : constant := -17;
   SYSCLR_TITLETEXT                     : constant := -16;
   SYSCLR_ACTIVEBORDER                  : constant := -15;
   SYSCLR_INACTIVEBORDER                : constant := -14;
   SYSCLR_APPWORKSPACE                  : constant := -13;
   SYSCLR_HELPBACKGROUND                : constant := -12;
   SYSCLR_HELPTEXT                      : constant := -11;
   SYSCLR_HELPHILITE                    : constant := -10;
   SYSCLR_CSYSCOLORS                    : constant := 41;
   TID_CURSOR                           : constant := 16#0000_FFFF#;
   TID_SCROLL                           : constant := 16#0000_FFFE#;
   TID_FLASHWINDOW                      : constant := 16#0000_FFFD#;
   TID_USERMAX                          : constant := 16#7FFF#;
   TF_LEFT                              : constant := 16#0001#;
   TF_TOP                               : constant := 16#0002#;
   TF_RIGHT                             : constant := 16#0004#;
   TF_BOTTOM                            : constant := 16#0008#;
   TF_SETPOINTERPOS                     : constant := 16#0010#;
   TF_GRID                              : constant := 16#0020#;
   TF_STANDARD                          : constant := 16#0040#;
   TF_ALLINBOUNDARY                     : constant := 16#0080#;
   TF_VALIDATETRACKRECT                 : constant := 16#0100#;
   TF_PARTINBOUNDARY                    : constant := 16#0200#;
   TF_MOVE                              : constant := 16#000F#;
   MLS_WORDWRAP                         : constant := 16#0001#;
   MLS_BORDER                           : constant := 16#0002#;
   MLS_VSCROLL                          : constant := 16#0004#;
   MLS_HSCROLL                          : constant := 16#0008#;
   MLS_READONLY                         : constant := 16#0010#;
   MLS_IGNORETAB                        : constant := 16#0020#;
   MLS_DISABLEUNDO                      : constant := 16#0040#;
   MLFFMTRECT_FORMATRECT                : constant := 16#0007#;
   MLFFMTRECT_LIMITHORZ                 : constant := 16#0001#;
   MLFFMTRECT_LIMITVERT                 : constant := 16#0002#;
   MLFFMTRECT_MATCHWINDOW               : constant := 16#0004#;
   MLFIE_CFTEXT                         : constant := 8#0000#;
   MLFIE_NOTRANS                        : constant := 1;
   MLFIE_WINFMT                         : constant := 2;
   MLFIE_RTF                            : constant := 3;
   MLFEFR_RESIZE                        : constant := 16#0001#;
   MLFEFR_TABSTOP                       : constant := 16#0002#;
   MLFEFR_FONT                          : constant := 16#0004#;
   MLFEFR_TEXT                          : constant := 16#0008#;
   MLFEFR_WORDWRAP                      : constant := 16#0010#;
   MLFETL_TEXTBYTES                     : constant := 16#0020#;
   MLFMARGIN_LEFT                       : constant := 16#0001#;
   MLFMARGIN_BOTTOM                     : constant := 16#0002#;
   MLFMARGIN_RIGHT                      : constant := 16#0003#;
   MLFMARGIN_TOP                        : constant := 16#0004#;
   MLFQS_MINMAXSEL                      : constant := 8#0000#;
   MLFQS_MINSEL                         : constant := 1;
   MLFQS_MAXSEL                         : constant := 2;
   MLFQS_ANCHORSEL                      : constant := 3;
   MLFQS_CURSORSEL                      : constant := 4;
   MLFCLPBD_TOOMUCHTEXT                 : constant := 16#0001#;
   MLFCLPBD_ERROR                       : constant := 16#0002#;
   MLFSEARCH_CASESENSITIVE              : constant := 16#0001#;
   MLFSEARCH_SELECTMATCH                : constant := 16#0002#;
   MLFSEARCH_CHANGEALL                  : constant := 16#0004#;
   MLM_SETTEXTLIMIT                     : constant := 16#01B0#;
   MLM_QUERYTEXTLIMIT                   : constant := 16#01B1#;
   MLM_SETFORMATRECT                    : constant := 16#01B2#;
   MLM_QUERYFORMATRECT                  : constant := 16#01B3#;
   MLM_SETWRAP                          : constant := 16#01B4#;
   MLM_QUERYWRAP                        : constant := 16#01B5#;
   MLM_SETTABSTOP                       : constant := 16#01B6#;
   MLM_QUERYTABSTOP                     : constant := 16#01B7#;
   MLM_SETREADONLY                      : constant := 16#01B8#;
   MLM_QUERYREADONLY                    : constant := 16#01B9#;
   MLM_QUERYCHANGED                     : constant := 16#01BA#;
   MLM_SETCHANGED                       : constant := 16#01BB#;
   MLM_QUERYLINECOUNT                   : constant := 16#01BC#;
   MLM_CHARFROMLINE                     : constant := 16#01BD#;
   MLM_LINEFROMCHAR                     : constant := 16#01BE#;
   MLM_QUERYLINELENGTH                  : constant := 16#01BF#;
   MLM_QUERYTEXTLENGTH                  : constant := 16#01C0#;
   MLM_FORMAT                           : constant := 16#01C1#;
   MLM_SETIMPORTEXPORT                  : constant := 16#01C2#;
   MLM_IMPORT                           : constant := 16#01C3#;
   MLM_EXPORT                           : constant := 16#01C4#;
   MLM_DELETE                           : constant := 16#01C6#;
   MLM_QUERYFORMATLINELENGTH            : constant := 16#01C7#;
   MLM_QUERYFORMATTEXTLENGTH            : constant := 16#01C8#;
   MLM_INSERT                           : constant := 16#01C9#;
   MLM_SETSEL                           : constant := 16#01CA#;
   MLM_QUERYSEL                         : constant := 16#01CB#;
   MLM_QUERYSELTEXT                     : constant := 16#01CC#;
   MLM_QUERYUNDO                        : constant := 16#01CD#;
   MLM_UNDO                             : constant := 16#01CE#;
   MLM_RESETUNDO                        : constant := 16#01CF#;
   MLM_QUERYFONT                        : constant := 16#01D0#;
   MLM_SETFONT                          : constant := 16#01D1#;
   MLM_SETTEXTCOLOR                     : constant := 16#01D2#;
   MLM_QUERYTEXTCOLOR                   : constant := 16#01D3#;
   MLM_SETBACKCOLOR                     : constant := 16#01D4#;
   MLM_QUERYBACKCOLOR                   : constant := 16#01D5#;
   MLM_QUERYFIRSTCHAR                   : constant := 16#01D6#;
   MLM_SETFIRSTCHAR                     : constant := 16#01D7#;
   MLM_CUT                              : constant := 16#01D8#;
   MLM_COPY                             : constant := 16#01D9#;
   MLM_PASTE                            : constant := 16#01DA#;
   MLM_CLEAR                            : constant := 16#01DB#;
   MLM_ENABLEREFRESH                    : constant := 16#01DC#;
   MLM_DISABLEREFRESH                   : constant := 16#01DD#;
   MLM_SEARCH                           : constant := 16#01DE#;
   MLM_QUERYIMPORTEXPORT                : constant := 16#01DF#;
   MLN_OVERFLOW                         : constant := 16#0001#;
   MLN_PIXHORZOVERFLOW                  : constant := 16#0002#;
   MLN_PIXVERTOVERFLOW                  : constant := 16#0003#;
   MLN_TEXTOVERFLOW                     : constant := 16#0004#;
   MLN_VSCROLL                          : constant := 16#0005#;
   MLN_HSCROLL                          : constant := 16#0006#;
   MLN_CHANGE                           : constant := 16#0007#;
   MLN_SETFOCUS                         : constant := 16#0008#;
   MLN_KILLFOCUS                        : constant := 16#0009#;
   MLN_MARGIN                           : constant := 16#000A#;
   MLN_SEARCHPAUSE                      : constant := 16#000B#;
   MLN_MEMERROR                         : constant := 16#000C#;
   MLN_UNDOOVERFLOW                     : constant := 16#000D#;
   MLN_CLPBDFAIL                        : constant := 16#000F#;
   GPI_ERROR                            : constant := 8#0000#;
   GPI_OK                               : constant := 1;
   GPI_ALTERROR                         : constant := -1;
   GPI_HITS                             : constant := 2;
   BMB_ERROR                            : constant := -1;
   CLR_ERROR                            : constant := -255;
   CLR_NOINDEX                          : constant := -254;
   CLR_FALSE                            : constant := -5;
   CLR_TRUE                             : constant := -4;
   CLR_DEFAULT                          : constant := -3;
   CLR_WHITE                            : constant := -2;
   CLR_BLACK                            : constant := -1;
   CLR_BACKGROUND                       : constant := 8#0000#;
   CLR_BLUE                             : constant := 1;
   CLR_RED                              : constant := 2;
   CLR_PINK                             : constant := 3;
   CLR_GREEN                            : constant := 4;
   CLR_CYAN                             : constant := 5;
   CLR_YELLOW                           : constant := 6;
   CLR_NEUTRAL                          : constant := 7;
   CLR_DARKGRAY                         : constant := 8;
   CLR_DARKBLUE                         : constant := 9;
   CLR_DARKRED                          : constant := 10;
   CLR_DARKPINK                         : constant := 11;
   CLR_DARKGREEN                        : constant := 12;
   CLR_DARKCYAN                         : constant := 13;
   CLR_BROWN                            : constant := 14;
   CLR_PALEGRAY                         : constant := 15;
   RGB_ERROR                            : constant := -255;
   RGB_BLACK                            : constant := 16#0000#;
   RGB_BLUE                             : constant := 16#00FF#;
   RGB_GREEN                            : constant := 16#0000_FF00#;
   RGB_CYAN                             : constant := 16#0000_FFFF#;
   RGB_RED                              : constant := 16#00FF_0000#;
   RGB_PINK                             : constant := 16#00FF_00FF#;
   RGB_YELLOW                           : constant := 16#00FF_FF00#;
   RGB_WHITE                            : constant := 16#00FF_FFFF#;
   GPIA_NOASSOC                         : constant := 16#0000#;
   GPIA_ASSOC                           : constant := 16#4000#;
   GPIF_DEFAULT                         : constant := 16#0000#;
   GPIF_SHORT                           : constant := 16#0100#;
   GPIF_LONG                            : constant := 16#0200#;
   GPIT_NORMAL                          : constant := 16#0000#;
   GPIT_MICRO                           : constant := 16#1000#;
   GRES_ATTRS                           : constant := 16#0001#;
   GRES_SEGMENTS                        : constant := 16#0002#;
   GRES_ALL                             : constant := 16#0004#;
   GPIE_SEGMENT                         : constant := 8#0000#;
   GPIE_ELEMENT                         : constant := 1;
   GPIE_DATA                            : constant := 2;
   PS_UNITS                             : constant := 16#00FC#;
   PS_FORMAT                            : constant := 16#0F00#;
   PS_TYPE                              : constant := 16#1000#;
   PS_MODE                              : constant := 16#2000#;
   PS_ASSOCIATE                         : constant := 16#4000#;
   PS_NORESET                           : constant := 16#8000#;
   PRIM_LINE                            : constant := 1;
   PRIM_CHAR                            : constant := 2;
   PRIM_MARKER                          : constant := 3;
   PRIM_AREA                            : constant := 4;
   PRIM_IMAGE                           : constant := 5;
   PU_ARBITRARY                         : constant := 16#0004#;
   PU_PELS                              : constant := 16#0008#;
   PU_LOMETRIC                          : constant := 16#000C#;
   PU_HIMETRIC                          : constant := 16#0010#;
   PU_LOENGLISH                         : constant := 16#0014#;
   PU_HIENGLISH                         : constant := 16#0018#;
   PU_TWIPS                             : constant := 16#001C#;
   ROP_SRCCOPY                          : constant := 16#00CC#;
   ROP_SRCPAINT                         : constant := 16#00EE#;
   ROP_SRCAND                           : constant := 16#0088#;
   ROP_SRCINVERT                        : constant := 16#0066#;
   ROP_SRCERASE                         : constant := 16#0044#;
   ROP_NOTSRCCOPY                       : constant := 16#0033#;
   ROP_NOTSRCERASE                      : constant := 16#0011#;
   ROP_MERGECOPY                        : constant := 16#00C0#;
   ROP_MERGEPAINT                       : constant := 16#00BB#;
   ROP_PATCOPY                          : constant := 16#00F0#;
   ROP_PATPAINT                         : constant := 16#00FB#;
   ROP_PATINVERT                        : constant := 16#005A#;
   ROP_DSTINVERT                        : constant := 16#0055#;
   ROP_ZERO                             : constant := 16#0000#;
   ROP_ONE                              : constant := 16#00FF#;
   BBO_OR                               : constant := 8#0000#;
   BBO_AND                              : constant := 1;
   BBO_IGNORE                           : constant := 2;
   BBO_PAL_COLORS                       : constant := 4;
   BBO_NO_COLOR_INFO                    : constant := 8;
   FF_BOUNDARY                          : constant := 8#0000#;
   FF_SURFACE                           : constant := 1;
   AM_ERROR                             : constant := -1;
   AM_PRESERVE                          : constant := 8#0000#;
   AM_NOPRESERVE                        : constant := 1;
   FM_ERROR                             : constant := -1;
   FM_DEFAULT                           : constant := 8#0000#;
   FM_OR                                : constant := 1;
   FM_OVERPAINT                         : constant := 2;
   FM_LEAVEALONE                        : constant := 5;
   FM_XOR                               : constant := 4;
   FM_AND                               : constant := 6;
   FM_SUBTRACT                          : constant := 7;
   FM_MASKSRCNOT                        : constant := 8;
   FM_ZERO                              : constant := 9;
   FM_NOTMERGESRC                       : constant := 10;
   FM_NOTXORSRC                         : constant := 11;
   FM_INVERT                            : constant := 12;
   FM_MERGESRCNOT                       : constant := 13;
   FM_NOTCOPYSRC                        : constant := 14;
   FM_MERGENOTSRC                       : constant := 15;
   FM_NOTMASKSRC                        : constant := 16#0010#;
   FM_ONE                               : constant := 17;
   BM_ERROR                             : constant := -1;
   BM_DEFAULT                           : constant := 8#0000#;
   BM_OR                                : constant := 1;
   BM_OVERPAINT                         : constant := 2;
   BM_LEAVEALONE                        : constant := 5;
   BM_XOR                               : constant := 4;
   BM_AND                               : constant := 6;
   BM_SUBTRACT                          : constant := 7;
   BM_MASKSRCNOT                        : constant := 8;
   BM_ZERO                              : constant := 9;
   BM_NOTMERGESRC                       : constant := 10;
   BM_NOTXORSRC                         : constant := 11;
   BM_INVERT                            : constant := 12;
   BM_MERGESRCNOT                       : constant := 13;
   BM_NOTCOPYSRC                        : constant := 14;
   BM_MERGENOTSRC                       : constant := 15;
   BM_NOTMASKSRC                        : constant := 16#0010#;
   BM_ONE                               : constant := 17;
   BM_SRCTRANSPARENT                    : constant := 18;
   BM_DESTTRANSPARENT                   : constant := 19;
   LINETYPE_ERROR                       : constant := -1;
   LINETYPE_DEFAULT                     : constant := 8#0000#;
   LINETYPE_DOT                         : constant := 1;
   LINETYPE_SHORTDASH                   : constant := 2;
   LINETYPE_DASHDOT                     : constant := 3;
   LINETYPE_DOUBLEDOT                   : constant := 4;
   LINETYPE_LONGDASH                    : constant := 5;
   LINETYPE_DASHDOUBLEDOT               : constant := 6;
   LINETYPE_SOLID                       : constant := 7;
   LINETYPE_INVISIBLE                   : constant := 8;
   LINETYPE_ALTERNATE                   : constant := 9;
   LINEWIDTH_ERROR                      : constant := -1;
   LINEWIDTH_DEFAULT                    : constant := 8#0000#;
   LINEWIDTH_NORMAL                     : constant := 16#0001_0000#;
   LINEWIDTH_THICK                      : constant := 16#0002_0000#;
   LINEWIDTHGEOM_ERROR                  : constant := -1;
   LINEEND_ERROR                        : constant := -1;
   LINEEND_DEFAULT                      : constant := 8#0000#;
   LINEEND_FLAT                         : constant := 1;
   LINEEND_SQUARE                       : constant := 2;
   LINEEND_ROUND                        : constant := 3;
   LINEJOIN_ERROR                       : constant := -1;
   LINEJOIN_DEFAULT                     : constant := 8#0000#;
   LINEJOIN_BEVEL                       : constant := 1;
   LINEJOIN_ROUND                       : constant := 2;
   LINEJOIN_MITRE                       : constant := 3;
   CHDIRN_ERROR                         : constant := -1;
   CHDIRN_DEFAULT                       : constant := 8#0000#;
   CHDIRN_LEFTRIGHT                     : constant := 1;
   CHDIRN_TOPBOTTOM                     : constant := 2;
   CHDIRN_RIGHTLEFT                     : constant := 3;
   CHDIRN_BOTTOMTOP                     : constant := 4;
   TA_NORMAL_HORIZ                      : constant := 16#0001#;
   TA_LEFT                              : constant := 16#0002#;
   TA_CENTER                            : constant := 16#0003#;
   TA_RIGHT                             : constant := 16#0004#;
   TA_STANDARD_HORIZ                    : constant := 16#0005#;
   TA_NORMAL_VERT                       : constant := 16#0100#;
   TA_TOP                               : constant := 16#0200#;
   TA_HALF                              : constant := 16#0300#;
   TA_BASE                              : constant := 16#0400#;
   TA_BOTTOM                            : constant := 16#0500#;
   TA_STANDARD_VERT                     : constant := 16#0600#;
   CM_ERROR                             : constant := -1;
   CM_DEFAULT                           : constant := 8#0000#;
   CM_MODE1                             : constant := 1;
   CM_MODE2                             : constant := 2;
   CM_MODE3                             : constant := 3;
   MARKSYM_ERROR                        : constant := -1;
   MARKSYM_DEFAULT                      : constant := 8#0000#;
   MARKSYM_CROSS                        : constant := 1;
   MARKSYM_PLUS                         : constant := 2;
   MARKSYM_DIAMOND                      : constant := 3;
   MARKSYM_SQUARE                       : constant := 4;
   MARKSYM_SIXPOINTSTAR                 : constant := 5;
   MARKSYM_EIGHTPOINTSTAR               : constant := 6;
   MARKSYM_SOLIDDIAMOND                 : constant := 7;
   MARKSYM_SOLIDSQUARE                  : constant := 8;
   MARKSYM_DOT                          : constant := 9;
   MARKSYM_SMALLCIRCLE                  : constant := 10;
   MARKSYM_BLANK                        : constant := 16#0040#;
   TXTBOX_TOPLEFT                       : constant := 8#0000#;
   TXTBOX_BOTTOMLEFT                    : constant := 1;
   TXTBOX_TOPRIGHT                      : constant := 2;
   TXTBOX_BOTTOMRIGHT                   : constant := 3;
   TXTBOX_CONCAT                        : constant := 4;
   TXTBOX_COUNT                         : constant := 5;
   PVIS_ERROR                           : constant := 8#0000#;
   PVIS_INVISIBLE                       : constant := 1;
   PVIS_VISIBLE                         : constant := 2;
   RVIS_ERROR                           : constant := 8#0000#;
   RVIS_INVISIBLE                       : constant := 1;
   RVIS_PARTIAL                         : constant := 2;
   RVIS_VISIBLE                         : constant := 3;
   FONT_DEFAULT                         : constant := 1;
   FONT_MATCH                           : constant := 2;
   LCIDT_FONT                           : constant := 6;
   LCIDT_BITMAP                         : constant := 7;
   LCID_ALL                             : constant := -1;
   CHS_OPAQUE                           : constant := 16#0001#;
   CHS_VECTOR                           : constant := 16#0002#;
   CHS_LEAVEPOS                         : constant := 16#0008#;
   CHS_CLIP                             : constant := 16#0010#;
   CHS_UNDERSCORE                       : constant := 16#0200#;
   CHS_STRIKEOUT                        : constant := 16#0400#;
   FWEIGHT_DONT_CARE                    : constant := 8#0000#;
   FWEIGHT_ULTRA_LIGHT                  : constant := 1;
   FWEIGHT_EXTRA_LIGHT                  : constant := 2;
   FWEIGHT_LIGHT                        : constant := 3;
   FWEIGHT_SEMI_LIGHT                   : constant := 4;
   FWEIGHT_NORMAL                       : constant := 5;
   FWEIGHT_SEMI_BOLD                    : constant := 6;
   FWEIGHT_BOLD                         : constant := 7;
   FWEIGHT_EXTRA_BOLD                   : constant := 8;
   FWEIGHT_ULTRA_BOLD                   : constant := 9;
   FWIDTH_DONT_CARE                     : constant := 8#0000#;
   FWIDTH_ULTRA_CONDENSED               : constant := 1;
   FWIDTH_EXTRA_CONDENSED               : constant := 2;
   FWIDTH_CONDENSED                     : constant := 3;
   FWIDTH_SEMI_CONDENSED                : constant := 4;
   FWIDTH_NORMAL                        : constant := 5;
   FWIDTH_SEMI_EXPANDED                 : constant := 6;
   FWIDTH_EXPANDED                      : constant := 7;
   FWIDTH_EXTRA_EXPANDED                : constant := 8;
   FWIDTH_ULTRA_EXPANDED                : constant := 9;
   FTYPE_ITALIC                         : constant := 16#0001#;
   FTYPE_ITALIC_DONT_CARE               : constant := 16#0002#;
   FTYPE_OBLIQUE                        : constant := 16#0004#;
   FTYPE_OBLIQUE_DONT_CARE              : constant := 16#0008#;
   FTYPE_ROUNDED                        : constant := 16#0010#;
   FTYPE_ROUNDED_DONT_CARE              : constant := 16#0020#;
   QFA_PUBLIC                           : constant := 1;
   QFA_PRIVATE                          : constant := 2;
   QFA_ERROR                            : constant := -1;
   QF_PUBLIC                            : constant := 16#0001#;
   QF_PRIVATE                           : constant := 16#0002#;
   QF_NO_GENERIC                        : constant := 16#0004#;
   QF_NO_DEVICE                         : constant := 16#0008#;
   QCD_LCT_FORMAT                       : constant := 8#0000#;
   QCD_LCT_LOINDEX                      : constant := 1;
   QCD_LCT_HIINDEX                      : constant := 2;
   QCD_LCT_OPTIONS                      : constant := 3;
   QLCT_ERROR                           : constant := -1;
   QLCT_RGB                             : constant := -2;
   QLCT_NOTLOADED                       : constant := -1;
   PAL_ERROR                            : constant := -1;
   PC_RESERVED                          : constant := 16#0001#;
   PC_EXPLICIT                          : constant := 16#0002#;
   PC_NOCOLLAPSE                        : constant := 16#0004#;
   SCP_ALTERNATE                        : constant := 8#0000#;
   SCP_WINDING                          : constant := 2;
   SCP_AND                              : constant := 4;
   SCP_RESET                            : constant := 8#0000#;
   SCP_INCL                             : constant := 8#0000#;
   SCP_EXCL                             : constant := 8;
   MPATH_STROKE                         : constant := 6;
   FPATH_ALTERNATE                      : constant := 8#0000#;
   FPATH_WINDING                        : constant := 2;
   FPATH_INCL                           : constant := 8#0000#;
   FPATH_EXCL                           : constant := 8;
   DCTL_ERASE                           : constant := 1;
   DCTL_DISPLAY                         : constant := 2;
   DCTL_BOUNDARY                        : constant := 3;
   DCTL_DYNAMIC                         : constant := 4;
   DCTL_CORRELATE                       : constant := 5;
   DCTL_ERROR                           : constant := -1;
   DCTL_OFF                             : constant := 8#0000#;
   DCTL_ON                              : constant := 1;
   DM_ERROR                             : constant := 8#0000#;
   DM_DRAW                              : constant := 1;
   DM_RETAIN                            : constant := 2;
   DM_DRAWANDRETAIN                     : constant := 3;
   SDW_ERROR                            : constant := -1;
   SDW_OFF                              : constant := 8#0000#;
   SDW_ON                               : constant := 1;
   PICKAP_DEFAULT                       : constant := 8#0000#;
   PICKAP_REC                           : constant := 2;
   PICKSEL_VISIBLE                      : constant := 8#0000#;
   PICKSEL_ALL                          : constant := 1;
   DFORM_NOCONV                         : constant := 8#0000#;
   DFORM_S370SHORT                      : constant := 1;
   DFORM_PCSHORT                        : constant := 2;
   DFORM_PCLONG                         : constant := 4;
   ATTR_ERROR                           : constant := -1;
   ATTR_DETECTABLE                      : constant := 1;
   ATTR_VISIBLE                         : constant := 2;
   ATTR_CHAINED                         : constant := 6;
   ATTR_DYNAMIC                         : constant := 8;
   ATTR_FASTCHAIN                       : constant := 9;
   ATTR_PROP_DETECTABLE                 : constant := 10;
   ATTR_PROP_VISIBLE                    : constant := 11;
   ATTR_OFF                             : constant := 8#0000#;
   ATTR_ON                              : constant := 1;
   LOWER_PRI                            : constant := -1;
   HIGHER_PRI                           : constant := 1;
   CVTC_WORLD                           : constant := 1;
   CVTC_MODEL                           : constant := 2;
   CVTC_DEFAULTPAGE                     : constant := 3;
   CVTC_PAGE                            : constant := 4;
   CVTC_DEVICE                          : constant := 5;
   TRANSFORM_REPLACE                    : constant := 8#0000#;
   TRANSFORM_ADD                        : constant := 1;
   TRANSFORM_PREEMPT                    : constant := 2;
   SEGEM_ERROR                          : constant := 8#0000#;
   SEGEM_INSERT                         : constant := 1;
   SEGEM_REPLACE                        : constant := 2;
   POLYGON_NOBOUNDARY                   : constant := 16#0000#;
   POLYGON_BOUNDARY                     : constant := 16#0001#;
   POLYGON_ALTERNATE                    : constant := 16#0000#;
   POLYGON_WINDING                      : constant := 16#0002#;
   POLYGON_INCL                         : constant := 16#0000#;
   POLYGON_EXCL                         : constant := 16#0008#;
   LCOL_RESET                           : constant := 16#0001#;
   LCOL_REALIZABLE                      : constant := 16#0002#;
   LCOL_PURECOLOR                       : constant := 16#0004#;
   LCOL_OVERRIDE_DEFAULT_COLORS         : constant := 16#0008#;
   LCOL_REALIZED                        : constant := 16#0010#;
   LCOLF_DEFAULT                        : constant := 8#0000#;
   LCOLF_INDRGB                         : constant := 1;
   LCOLF_CONSECRGB                      : constant := 2;
   LCOLF_RGB                            : constant := 3;
   LCOLF_PALETTE                        : constant := 4;
   LCOLOPT_REALIZED                     : constant := 16#0001#;
   LCOLOPT_INDEX                        : constant := 16#0002#;
   BA_NOBOUNDARY                        : constant := 8#0000#;
   BA_BOUNDARY                          : constant := 16#0001#;
   BA_ALTERNATE                         : constant := 8#0000#;
   BA_WINDING                           : constant := 16#0002#;
   BA_INCL                              : constant := 8#0000#;
   BA_EXCL                              : constant := 8;
   DRO_FILL                             : constant := 1;
   DRO_OUTLINE                          : constant := 2;
   DRO_OUTLINEFILL                      : constant := 3;
   PATSYM_ERROR                         : constant := -1;
   PATSYM_DEFAULT                       : constant := 8#0000#;
   PATSYM_DENSE1                        : constant := 1;
   PATSYM_DENSE2                        : constant := 2;
   PATSYM_DENSE3                        : constant := 3;
   PATSYM_DENSE4                        : constant := 4;
   PATSYM_DENSE5                        : constant := 5;
   PATSYM_DENSE6                        : constant := 6;
   PATSYM_DENSE7                        : constant := 7;
   PATSYM_DENSE8                        : constant := 8;
   PATSYM_VERT                          : constant := 9;
   PATSYM_HORIZ                         : constant := 10;
   PATSYM_DIAG1                         : constant := 11;
   PATSYM_DIAG2                         : constant := 12;
   PATSYM_DIAG3                         : constant := 13;
   PATSYM_DIAG4                         : constant := 14;
   PATSYM_NOSHADE                       : constant := 15;
   PATSYM_SOLID                         : constant := 16#0010#;
   PATSYM_HALFTONE                      : constant := 17;
   PATSYM_HATCH                         : constant := 18;
   PATSYM_DIAGHATCH                     : constant := 19;
   PATSYM_BLANK                         : constant := 16#0040#;
   LCID_ERROR                           : constant := -1;
   LCID_DEFAULT                         : constant := 8#0000#;
   CBM_INIT                             : constant := 16#0004#;
   CRGN_OR                              : constant := 1;
   CRGN_COPY                            : constant := 2;
   CRGN_XOR                             : constant := 4;
   CRGN_AND                             : constant := 6;
   CRGN_DIFF                            : constant := 7;
   RGN_ERROR                            : constant := 8#0000#;
   RGN_NULL                             : constant := 1;
   RGN_RECT                             : constant := 2;
   RGN_COMPLEX                          : constant := 3;
   PRGN_ERROR                           : constant := 8#0000#;
   PRGN_OUTSIDE                         : constant := 1;
   PRGN_INSIDE                          : constant := 2;
   RRGN_ERROR                           : constant := 8#0000#;
   RRGN_OUTSIDE                         : constant := 1;
   RRGN_PARTIAL                         : constant := 2;
   RRGN_INSIDE                          : constant := 3;
   EQRGN_ERROR                          : constant := 8#0000#;
   EQRGN_NOTEQUAL                       : constant := 1;
   EQRGN_EQUAL                          : constant := 2;
   RECTDIR_LFRT_TOPBOT                  : constant := 1;
   RECTDIR_RTLF_TOPBOT                  : constant := 2;
   RECTDIR_LFRT_BOTTOP                  : constant := 3;
   RECTDIR_RTLF_BOTTOP                  : constant := 4;
   PMF_SEGBASE                          : constant := 8#0000#;
   PMF_LOADTYPE                         : constant := 1;
   PMF_RESOLVE                          : constant := 2;
   PMF_LCIDS                            : constant := 3;
   PMF_RESET                            : constant := 4;
   PMF_SUPPRESS                         : constant := 5;
   PMF_COLORTABLES                      : constant := 6;
   PMF_COLORREALIZABLE                  : constant := 7;
   PMF_DEFAULTS                         : constant := 8;
   PMF_DELETEOBJECTS                    : constant := 9;
   RS_DEFAULT                           : constant := 8#0000#;
   RS_NODISCARD                         : constant := 1;
   LC_DEFAULT                           : constant := 8#0000#;
   LC_NOLOAD                            : constant := 1;
   LC_LOADDISC                          : constant := 3;
   LT_DEFAULT                           : constant := 8#0000#;
   LT_NOMODIFY                          : constant := 1;
   LT_ORIGINALVIEW                      : constant := 4;
   RES_DEFAULT                          : constant := 8#0000#;
   RES_NORESET                          : constant := 1;
   RES_RESET                            : constant := 2;
   SUP_DEFAULT                          : constant := 8#0000#;
   SUP_NOSUPPRESS                       : constant := 1;
   SUP_SUPPRESS                         : constant := 2;
   CTAB_DEFAULT                         : constant := 8#0000#;
   CTAB_NOMODIFY                        : constant := 1;
   CTAB_REPLACE                         : constant := 3;
   CTAB_REPLACEPALETTE                  : constant := 4;
   CREA_DEFAULT                         : constant := 8#0000#;
   CREA_REALIZE                         : constant := 1;
   CREA_NOREALIZE                       : constant := 2;
   CREA_DOREALIZE                       : constant := 3;
   DDEF_DEFAULT                         : constant := 8#0000#;
   DDEF_IGNORE                          : constant := 1;
   DDEF_LOADDISC                        : constant := 3;
   DOBJ_DEFAULT                         : constant := 8#0000#;
   DOBJ_NODELETE                        : constant := 1;
   DOBJ_DELETE                          : constant := 2;
   RSP_DEFAULT                          : constant := 8#0000#;
   RSP_NODISCARD                        : constant := 1;
   LBB_COLOR                            : constant := 16#0001#;
   LBB_BACK_COLOR                       : constant := 16#0002#;
   LBB_MIX_MODE                         : constant := 16#0004#;
   LBB_BACK_MIX_MODE                    : constant := 16#0008#;
   LBB_WIDTH                            : constant := 16#0010#;
   LBB_GEOM_WIDTH                       : constant := 16#0020#;
   LBB_TYPE                             : constant := 16#0040#;
   LBB_END                              : constant := 16#0080#;
   LBB_JOIN                             : constant := 16#0100#;
   CBB_COLOR                            : constant := 16#0001#;
   CBB_BACK_COLOR                       : constant := 16#0002#;
   CBB_MIX_MODE                         : constant := 16#0004#;
   CBB_BACK_MIX_MODE                    : constant := 16#0008#;
   CBB_SET                              : constant := 16#0010#;
   CBB_MODE                             : constant := 16#0020#;
   CBB_BOX                              : constant := 16#0040#;
   CBB_ANGLE                            : constant := 16#0080#;
   CBB_SHEAR                            : constant := 16#0100#;
   CBB_DIRECTION                        : constant := 16#0200#;
   CBB_TEXT_ALIGN                       : constant := 16#0400#;
   CBB_EXTRA                            : constant := 16#0800#;
   CBB_BREAK_EXTRA                      : constant := 16#1000#;
   MBB_COLOR                            : constant := 16#0001#;
   MBB_BACK_COLOR                       : constant := 16#0002#;
   MBB_MIX_MODE                         : constant := 16#0004#;
   MBB_BACK_MIX_MODE                    : constant := 16#0008#;
   MBB_SET                              : constant := 16#0010#;
   MBB_SYMBOL                           : constant := 16#0020#;
   MBB_BOX                              : constant := 16#0040#;
   ABB_COLOR                            : constant := 16#0001#;
   ABB_BACK_COLOR                       : constant := 16#0002#;
   ABB_MIX_MODE                         : constant := 16#0004#;
   ABB_BACK_MIX_MODE                    : constant := 16#0008#;
   ABB_SET                              : constant := 16#0010#;
   ABB_SYMBOL                           : constant := 16#0020#;
   ABB_REF_POINT                        : constant := 16#0040#;
   IBB_COLOR                            : constant := 16#0001#;
   IBB_BACK_COLOR                       : constant := 16#0002#;
   IBB_MIX_MODE                         : constant := 16#0004#;
   IBB_BACK_MIX_MODE                    : constant := 16#0008#;
   DEV_ERROR                            : constant := 8#0000#;
   DEV_OK                               : constant := 1;
   ADDRESS                              : constant := 8#0000#;
   DRIVER_NAME                          : constant := 1;
   DRIVER_DATA                          : constant := 2;
   DATA_TYPE                            : constant := 3;
   COMMENT                              : constant := 4;
   PROC_NAME                            : constant := 5;
   PROC_PARAMS                          : constant := 6;
   SPL_PARAMS                           : constant := 7;
   NETWORK_PARAMS                       : constant := 8;
   OD_QUEUED                            : constant := 2;
   OD_DIRECT                            : constant := 5;
   OD_INFO                              : constant := 6;
   OD_METAFILE                          : constant := 7;
   OD_MEMORY                            : constant := 8;
   OD_METAFILE_NOQUERY                  : constant := 9;
   CAPS_FAMILY                          : constant := 8#0000#;
   CAPS_IO_CAPS                         : constant := 1;
   CAPS_TECHNOLOGY                      : constant := 2;
   CAPS_DRIVER_VERSION                  : constant := 3;
   CAPS_WIDTH                           : constant := 4;
   CAPS_HEIGHT                          : constant := 5;
   CAPS_WIDTH_IN_CHARS                  : constant := 6;
   CAPS_HEIGHT_IN_CHARS                 : constant := 7;
   CAPS_HORIZONTAL_RESOLUTION           : constant := 8;
   CAPS_VERTICAL_RESOLUTION             : constant := 9;
   CAPS_CHAR_WIDTH                      : constant := 10;
   CAPS_CHAR_HEIGHT                     : constant := 11;
   CAPS_SMALL_CHAR_WIDTH                : constant := 12;
   CAPS_SMALL_CHAR_HEIGHT               : constant := 13;
   CAPS_COLORS                          : constant := 14;
   CAPS_COLOR_PLANES                    : constant := 15;
   CAPS_COLOR_BITCOUNT                  : constant := 16#0010#;
   CAPS_COLOR_TABLE_SUPPORT             : constant := 17;
   CAPS_MOUSE_BUTTONS                   : constant := 18;
   CAPS_FOREGROUND_MIX_SUPPORT          : constant := 19;
   CAPS_BACKGROUND_MIX_SUPPORT          : constant := 20;
   CAPS_DEVICE_WINDOWING                : constant := 31;
   CAPS_ADDITIONAL_GRAPHICS             : constant := 16#0020#;
   CAPS_VIO_LOADABLE_FONTS              : constant := 21;
   CAPS_WINDOW_BYTE_ALIGNMENT           : constant := 22;
   CAPS_BITMAP_FORMATS                  : constant := 23;
   CAPS_RASTER_CAPS                     : constant := 24;
   CAPS_MARKER_HEIGHT                   : constant := 25;
   CAPS_MARKER_WIDTH                    : constant := 26;
   CAPS_DEVICE_FONTS                    : constant := 27;
   CAPS_GRAPHICS_SUBSET                 : constant := 28;
   CAPS_GRAPHICS_VERSION                : constant := 29;
   CAPS_GRAPHICS_VECTOR_SUBSET          : constant := 30;
   CAPS_PHYS_COLORS                     : constant := 33;
   CAPS_COLOR_INDEX                     : constant := 34;
   CAPS_GRAPHICS_CHAR_WIDTH             : constant := 35;
   CAPS_GRAPHICS_CHAR_HEIGHT            : constant := 36;
   CAPS_HORIZONTAL_FONT_RES             : constant := 37;
   CAPS_VERTICAL_FONT_RES               : constant := 38;
   CAPS_DEVICE_FONT_SIM                 : constant := 39;
   CAPS_LINEWIDTH_THICK                 : constant := 40;
   CAPS_DEVICE_POLYSET_POINTS           : constant := 41;
   CAPS_IO_DUMMY                        : constant := 1;
   CAPS_IO_SUPPORTS_OP                  : constant := 2;
   CAPS_IO_SUPPORTS_IP                  : constant := 3;
   CAPS_IO_SUPPORTS_IO                  : constant := 4;
   CAPS_TECH_UNKNOWN                    : constant := 8#0000#;
   CAPS_TECH_VECTOR_PLOTTER             : constant := 1;
   CAPS_TECH_RASTER_DISPLAY             : constant := 2;
   CAPS_TECH_RASTER_PRINTER             : constant := 3;
   CAPS_TECH_RASTER_CAMERA              : constant := 4;
   CAPS_TECH_POSTSCRIPT                 : constant := 5;
   CAPS_COLTABL_RGB_8                   : constant := 16#0001#;
   CAPS_COLTABL_RGB_8_PLUS              : constant := 16#0002#;
   CAPS_COLTABL_TRUE_MIX                : constant := 16#0004#;
   CAPS_COLTABL_REALIZE                 : constant := 16#0008#;
   CAPS_FM_OR                           : constant := 16#0001#;
   CAPS_FM_OVERPAINT                    : constant := 16#0002#;
   CAPS_FM_XOR                          : constant := 16#0008#;
   CAPS_FM_LEAVEALONE                   : constant := 16#0010#;
   CAPS_FM_AND                          : constant := 16#0020#;
   CAPS_FM_GENERAL_BOOLEAN              : constant := 16#0040#;
   CAPS_BM_OR                           : constant := 16#0001#;
   CAPS_BM_OVERPAINT                    : constant := 16#0002#;
   CAPS_BM_XOR                          : constant := 16#0008#;
   CAPS_BM_LEAVEALONE                   : constant := 16#0010#;
   CAPS_BM_AND                          : constant := 16#0020#;
   CAPS_BM_GENERAL_BOOLEAN              : constant := 16#0040#;
   CAPS_BM_SRCTRANSPARENT               : constant := 16#0080#;
   CAPS_BM_DESTTRANSPARENT              : constant := 16#0100#;
   CAPS_DEV_WINDOWING_SUPPORT           : constant := 16#0001#;
   CAPS_VDD_DDB_TRANSFER                : constant := 16#0001#;
   CAPS_GRAPHICS_KERNING_SUPPORT        : constant := 16#0002#;
   CAPS_FONT_OUTLINE_DEFAULT            : constant := 16#0004#;
   CAPS_FONT_IMAGE_DEFAULT              : constant := 16#0008#;
   CAPS_SCALED_DEFAULT_MARKERS          : constant := 16#0040#;
   CAPS_COLOR_CURSOR_SUPPORT            : constant := 16#0080#;
   CAPS_PALETTE_MANAGER                 : constant := 16#0100#;
   CAPS_COSMETIC_WIDELINE_SUPPORT       : constant := 16#0200#;
   CAPS_DIRECT_FILL                     : constant := 16#0400#;
   CAPS_REBUILD_FILLS                   : constant := 16#0800#;
   CAPS_CLIP_FILLS                      : constant := 16#1000#;
   CAPS_ENHANCED_FONTMETRICS            : constant := 16#2000#;
   CAPS_ENHANCED_TEXT                   : constant := 16#4000#;
   CAPS_TRANSFORM_SUPPORT               : constant := 16#4000#;
   CAPS_BYTE_ALIGN_REQUIRED             : constant := 8#0000#;
   CAPS_BYTE_ALIGN_RECOMMENDED          : constant := 1;
   CAPS_BYTE_ALIGN_NOT_REQUIRED         : constant := 2;
   CAPS_RASTER_BITBLT                   : constant := 16#0001#;
   CAPS_RASTER_BANDING                  : constant := 16#0002#;
   CAPS_RASTER_BITBLT_SCALING           : constant := 16#0004#;
   CAPS_RASTER_SET_PEL                  : constant := 16#0010#;
   CAPS_RASTER_FONTS                    : constant := 16#0020#;
   CAPS_RASTER_FLOOD_FILL               : constant := 16#0040#;
   DEVESC_ERROR                         : constant := -1;
   DEVESC_NOTIMPLEMENTED                : constant := 8#0000#;
   DEVESC_QUERYESCSUPPORT               : constant := 8#0000#;
   DEVESC_GETSCALINGFACTOR              : constant := 1;
   DEVESC_QUERYVIOCELLSIZES             : constant := 2;
   DEVESC_GETCP                         : constant := 8000;
   DEVESC_STARTDOC                      : constant := 8150;
   DEVESC_ENDDOC                        : constant := 8151;
   DEVESC_NEXTBAND                      : constant := 8152;
   DEVESC_ABORTDOC                      : constant := 8153;
   DEVESC_NEWFRAME                      : constant := 16300;
   DEVESC_DRAFTMODE                     : constant := 16301;
   DEVESC_FLUSHOUTPUT                   : constant := 16302;
   DEVESC_RAWDATA                       : constant := 16303;
   DEVESC_SETMODE                       : constant := 16304;
   DEVESC_DBE_FIRST                     : constant := 24450;
   DEVESC_DBE_LAST                      : constant := 24455;
   DEVESC_CHAR_EXTRA                    : constant := 16998;
   DEVESC_BREAK_EXTRA                   : constant := 16999;
   DEVESC_STD_JOURNAL                   : constant := 32600;
   DPDM_ERROR                           : constant := -1;
   DPDM_NONE                            : constant := 8#0000#;
   DPDM_POSTJOBPROP                     : constant := 8#0000#;
   DPDM_CHANGEPROP                      : constant := 1;
   DPDM_QUERYJOBPROP                    : constant := 2;
   DQHC_ERROR                           : constant := -1;
   HCAPS_CURRENT                        : constant := 1;
   HCAPS_SELECTABLE                     : constant := 2;
   MAXNAMEL                             : constant := 60;
    HINI_PROFILE                        : constant HINI := 0;
   MAXPATHL                             : constant := 16#0080#;
   PROG_DEFAULT                         : constant := 8#0000#;
   PROG_FULLSCREEN                      : constant := 1;
   PROG_WINDOWABLEVIO                   : constant := 2;
   PROG_PM                              : constant := 3;
   PROG_GROUP                           : constant := 5;
   PROG_REAL                            : constant := 4;
   PROG_VDM                             : constant := 4;
   PROG_WINDOWEDVDM                     : constant := 7;
   PROG_DLL                             : constant := 6;
   PROG_PDD                             : constant := 8;
   PROG_VDD                             : constant := 9;
   PROG_WINDOW_REAL                     : constant := 10;
   PROG_WINDOW_PROT                     : constant := 11;
   PROG_WINDOW_AUTO                     : constant := 12;
   PROG_SEAMLESSVDM                     : constant := 13;
   PROG_SEAMLESSCOMMON                  : constant := 14;
   PROG_30_STDSEAMLESSCOMMON            : constant := 14;
   PROG_31_STDSEAMLESSVDM               : constant := 15;
   PROG_31_STDSEAMLESSCOMMON            : constant := 16#0010#;
   PROG_31_ENHSEAMLESSVDM               : constant := 17;
   PROG_31_ENHSEAMLESSCOMMON            : constant := 18;
   PROG_31_ENH                          : constant := 19;
   PROG_31_STD                          : constant := 20;
   PROG_RESERVED                        : constant := 255;
   SAF_VALIDFLAGS                       : constant := 16#001F#;
   SAF_INSTALLEDCMDLINE                 : constant := 16#0001#;
   SAF_STARTCHILDAPP                    : constant := 16#0002#;
   SAF_MAXIMIZED                        : constant := 16#0004#;
   SAF_MINIMIZED                        : constant := 16#0008#;
   SAF_BACKGROUND                       : constant := 16#0010#;
   SHE_VISIBLE                          : constant := 16#0000#;
   SHE_INVISIBLE                        : constant := 16#0001#;
   SHE_RESERVED                         : constant := 16#00FF#;
   SHE_UNPROTECTED                      : constant := 16#0000#;
   SHE_PROTECTED                        : constant := 16#0002#;
   SWL_INVISIBLE                        : constant := 16#0001#;
   SWL_GRAYED                           : constant := 16#0002#;
   SWL_VISIBLE                          : constant := 16#0004#;
   SWL_NOTJUMPABLE                      : constant := 16#0001#;
   SWL_JUMPABLE                         : constant := 16#0002#;
   PL_ALTERED                           : constant := 16#008E#;
   FDM_FILTER                           : constant := 16#1028#;
   FDM_VALIDATE                         : constant := 16#1029#;
   FDM_ERROR                            : constant := 16#102A#;
   DID_FILE_DIALOG                      : constant := 16#0100#;
   DID_FILENAME_TXT                     : constant := 257;
   DID_FILENAME_ED                      : constant := 258;
   DID_DRIVE_TXT                        : constant := 259;
   DID_DRIVE_CB                         : constant := 260;
   DID_FILTER_TXT                       : constant := 261;
   DID_FILTER_CB                        : constant := 262;
   DID_DIRECTORY_TXT                    : constant := 263;
   DID_DIRECTORY_LB                     : constant := 264;
   DID_FILES_TXT                        : constant := 265;
   DID_FILES_LB                         : constant := 266;
   DID_HELP_PB                          : constant := 267;
   DID_APPLY_PB                         : constant := 268;
   DID_OK_PB                            : constant := 1;
   DID_CANCEL_PB                        : constant := 2;
   FDS_CENTER                           : constant := 16#0001#;
   FDS_CUSTOM                           : constant := 16#0002#;
   FDS_FILTERUNION                      : constant := 16#0004#;
   FDS_HELPBUTTON                       : constant := 16#0008#;
   FDS_APPLYBUTTON                      : constant := 16#0010#;
   FDS_PRELOAD_VOLINFO                  : constant := 16#0020#;
   FDS_MODELESS                         : constant := 16#0040#;
   FDS_INCLUDE_EAS                      : constant := 16#0080#;
   FDS_OPEN_DIALOG                      : constant := 16#0100#;
   FDS_SAVEAS_DIALOG                    : constant := 16#0200#;
   FDS_MULTIPLESEL                      : constant := 16#0400#;
   FDS_ENABLEFILELB                     : constant := 16#0800#;
   FDS_EFSELECTION                      : constant := 8#0000#;
   FDS_LBSELECTION                      : constant := 1;
   FDS_SUCCESSFUL                       : constant := 8#0000#;
   FDS_ERR_DEALLOCATE_MEMORY            : constant := 1;
   FDS_ERR_FILTER_TRUNC                 : constant := 2;
   FDS_ERR_INVALID_DIALOG               : constant := 3;
   FDS_ERR_INVALID_DRIVE                : constant := 4;
   FDS_ERR_INVALID_FILTER               : constant := 5;
   FDS_ERR_INVALID_PATHFILE             : constant := 6;
   FDS_ERR_OUT_OF_MEMORY                : constant := 7;
   FDS_ERR_PATH_TOO_LONG                : constant := 8;
   FDS_ERR_TOO_MANY_FILE_TYPES          : constant := 9;
   FDS_ERR_INVALID_VERSION              : constant := 10;
   FDS_ERR_INVALID_CUSTOM_HANDLE        : constant := 11;
   FDS_ERR_DIALOG_LOAD_ERROR            : constant := 12;
   FDS_ERR_DRIVE_ERROR                  : constant := 13;
   IDS_FILE_ALL_FILES_SELECTOR          : constant := 1000;
   IDS_FILE_BACK_CUR_PATH               : constant := 1001;
   IDS_FILE_BACK_PREV_PATH              : constant := 1002;
   IDS_FILE_BACK_SLASH                  : constant := 1003;
   IDS_FILE_BASE_FILTER                 : constant := 1004;
   IDS_FILE_BLANK                       : constant := 1005;
   IDS_FILE_COLON                       : constant := 1006;
   IDS_FILE_DOT                         : constant := 1007;
   IDS_FILE_DRIVE_LETTERS               : constant := 1008;
   IDS_FILE_FWD_CUR_PATH                : constant := 1009;
   IDS_FILE_FWD_PREV_PATH               : constant := 1010;
   IDS_FILE_FORWARD_SLASH               : constant := 1011;
   IDS_FILE_PARENT_DIR                  : constant := 1012;
   IDS_FILE_Q_MARK                      : constant := 1013;
   IDS_FILE_SPLAT                       : constant := 1014;
   IDS_FILE_SPLAT_DOT                   : constant := 1015;
   IDS_FILE_SAVEAS_TITLE                : constant := 1016;
   IDS_FILE_SAVEAS_FILTER_TXT           : constant := 1017;
   IDS_FILE_SAVEAS_FILENM_TXT           : constant := 1018;
   IDS_FILE_DUMMY_FILE_NAME             : constant := 1019;
   IDS_FILE_DUMMY_FILE_EXT              : constant := 1020;
   IDS_FILE_DUMMY_DRIVE                 : constant := 1021;
   IDS_FILE_DUMMY_ROOT_DIR              : constant := 1022;
   IDS_FILE_PATH_PTR                    : constant := 1023;
   IDS_FILE_VOLUME_PREFIX               : constant := 16#0400#;
   IDS_FILE_VOLUME_SUFFIX               : constant := 1025;
   IDS_FILE_PATH_PTR2                   : constant := 1026;
   IDS_FILE_INVALID_CHARS               : constant := 1027;
   IDS_FILE_BAD_DRIVE_NAME              : constant := 1100;
   IDS_FILE_BAD_DRIVE_OR_PATH_NAME      : constant := 1101;
   IDS_FILE_BAD_FILE_NAME               : constant := 1102;
   IDS_FILE_BAD_FQF                     : constant := 1103;
   IDS_FILE_BAD_NETWORK_NAME            : constant := 1104;
   IDS_FILE_BAD_SUB_DIR_NAME            : constant := 1105;
   IDS_FILE_DRIVE_NOT_AVAILABLE         : constant := 1106;
   IDS_FILE_FQFNAME_TOO_LONG            : constant := 1107;
   IDS_FILE_OPEN_DIALOG_NOTE            : constant := 1108;
   IDS_FILE_PATH_TOO_LONG               : constant := 1109;
   IDS_FILE_SAVEAS_DIALOG_NOTE          : constant := 1110;
   IDS_FILE_DRIVE_DISK_CHANGE           : constant := 1120;
   IDS_FILE_DRIVE_NOT_READY             : constant := 1122;
   IDS_FILE_DRIVE_LOCKED                : constant := 1123;
   IDS_FILE_DRIVE_NO_SECTOR             : constant := 1124;
   IDS_FILE_DRIVE_SOME_ERROR            : constant := 1125;
   IDS_FILE_DRIVE_INVALID               : constant := 1126;
   IDS_FILE_INSERT_DISK_NOTE            : constant := 1127;
   IDS_FILE_OK_WHEN_READY               : constant := 1128;
   CCHMAXPATH                           : constant := 260;
   CCHMAXPATHCOMP                       : constant := 16#0100#;
   FNTM_FACENAMECHANGED                 : constant := 16#1032#;
   FNTM_POINTSIZECHANGED                : constant := 16#1033#;
   FNTM_STYLECHANGED                    : constant := 16#1034#;
   FNTM_COLORCHANGED                    : constant := 16#1035#;
   FNTM_UPDATEPREVIEW                   : constant := 16#1036#;
   FNTM_FILTERLIST                      : constant := 16#1037#;
   FNTS_CENTER                          : constant := 16#0001#;
   FNTS_CUSTOM                          : constant := 16#0002#;
   FNTS_OWNERDRAWPREVIEW                : constant := 16#0004#;
   FNTS_HELPBUTTON                      : constant := 16#0008#;
   FNTS_APPLYBUTTON                     : constant := 16#0010#;
   FNTS_RESETBUTTON                     : constant := 16#0020#;
   FNTS_MODELESS                        : constant := 16#0040#;
   FNTS_INITFROMFATTRS                  : constant := 16#0080#;
   FNTS_BITMAPONLY                      : constant := 16#0100#;
   FNTS_VECTORONLY                      : constant := 16#0200#;
   FNTS_FIXEDWIDTHONLY                  : constant := 16#0400#;
   FNTS_PROPORTIONALONLY                : constant := 16#0800#;
   FNTS_NOSYNTHESIZEDFONTS              : constant := 16#1000#;
   FNTF_NOVIEWSCREENFONTS               : constant := 16#0001#;
   FNTF_NOVIEWPRINTERFONTS              : constant := 16#0002#;
   FNTF_SCREENFONTSELECTED              : constant := 16#0004#;
   FNTF_PRINTERFONTSELECTED             : constant := 16#0008#;
   CLRC_FOREGROUND                      : constant := 1;
   CLRC_BACKGROUND                      : constant := 2;
   FNTI_BITMAPFONT                      : constant := 16#0001#;
   FNTI_VECTORFONT                      : constant := 16#0002#;
   FNTI_FIXEDWIDTHFONT                  : constant := 16#0004#;
   FNTI_PROPORTIONALFONT                : constant := 16#0008#;
   FNTI_SYNTHESIZED                     : constant := 16#0010#;
   FNTI_DEFAULTLIST                     : constant := 16#0020#;
   FNTI_FAMILYNAME                      : constant := 16#0100#;
   FNTI_STYLENAME                       : constant := 16#0200#;
   FNTI_POINTSIZE                       : constant := 16#0400#;
   FNTS_SUCCESSFUL                      : constant := 8#0000#;
   FNTS_ERR_INVALID_DIALOG              : constant := 3;
   FNTS_ERR_ALLOC_SHARED_MEM            : constant := 4;
   FNTS_ERR_INVALID_PARM                : constant := 5;
   FNTS_ERR_OUT_OF_MEMORY               : constant := 7;
   FNTS_ERR_INVALID_VERSION             : constant := 10;
   FNTS_ERR_DIALOG_LOAD_ERROR           : constant := 12;
   DID_FONT_DIALOG                      : constant := 300;
   DID_NAME                             : constant := 301;
   DID_STYLE                            : constant := 302;
   DID_DISPLAY_FILTER                   : constant := 303;
   DID_PRINTER_FILTER                   : constant := 304;
   DID_SIZE                             : constant := 305;
   DID_SAMPLE                           : constant := 306;
   DID_OUTLINE                          : constant := 307;
   DID_UNDERSCORE                       : constant := 308;
   DID_STRIKEOUT                        : constant := 309;
   DID_HELP_BUTTON                      : constant := 310;
   DID_APPLY_BUTTON                     : constant := 311;
   DID_RESET_BUTTON                     : constant := 312;
   DID_OK_BUTTON                        : constant := 1;
   DID_CANCEL_BUTTON                    : constant := 2;
   DID_NAME_PREFIX                      : constant := 313;
   DID_STYLE_PREFIX                     : constant := 314;
   DID_SIZE_PREFIX                      : constant := 315;
   DID_SAMPLE_GROUPBOX                  : constant := 316;
   DID_EMPHASIS_GROUPBOX                : constant := 317;
   DID_FONT_ISO_SUPPORT                 : constant := 318;
   DID_FONT_ISO_UNTESTED                : constant := 319;
   IDS_FONT_SAMPLE                      : constant := 350;
   IDS_FONT_BLANK                       : constant := 351;
   IDS_FONT_KEY_0                       : constant := 352;
   IDS_FONT_KEY_9                       : constant := 353;
   IDS_FONT_KEY_SEP                     : constant := 354;
   IDS_FONT_DISP_ONLY                   : constant := 355;
   IDS_FONT_PRINTER_ONLY                : constant := 356;
   IDS_FONT_COMBINED                    : constant := 357;
   IDS_FONT_WEIGHT1                     : constant := 358;
   IDS_FONT_WEIGHT2                     : constant := 359;
   IDS_FONT_WEIGHT3                     : constant := 360;
   IDS_FONT_WEIGHT4                     : constant := 361;
   IDS_FONT_WEIGHT5                     : constant := 362;
   IDS_FONT_WEIGHT6                     : constant := 363;
   IDS_FONT_WEIGHT7                     : constant := 364;
   IDS_FONT_WEIGHT8                     : constant := 365;
   IDS_FONT_WEIGHT9                     : constant := 366;
   IDS_FONT_WIDTH1                      : constant := 367;
   IDS_FONT_WIDTH2                      : constant := 368;
   IDS_FONT_WIDTH3                      : constant := 369;
   IDS_FONT_WIDTH4                      : constant := 370;
   IDS_FONT_WIDTH5                      : constant := 371;
   IDS_FONT_WIDTH6                      : constant := 372;
   IDS_FONT_WIDTH7                      : constant := 373;
   IDS_FONT_WIDTH8                      : constant := 374;
   IDS_FONT_WIDTH9                      : constant := 375;
   IDS_FONT_OPTION0                     : constant := 376;
   IDS_FONT_OPTION1                     : constant := 377;
   IDS_FONT_OPTION2                     : constant := 378;
   IDS_FONT_OPTION3                     : constant := 379;
   IDS_FONT_POINT_SIZE_LIST             : constant := 380;
   SPBS_ALLCHARACTERS                   : constant := 16#0000#;
   SPBS_NUMERICONLY                     : constant := 16#0001#;
   SPBS_READONLY                        : constant := 16#0002#;
   SPBS_SERVANT                         : constant := 16#0000#;
   SPBS_MASTER                          : constant := 16#0010#;
   SPBS_JUSTDEFAULT                     : constant := 16#0000#;
   SPBS_JUSTRIGHT                       : constant := 16#0004#;
   SPBS_JUSTLEFT                        : constant := 16#0008#;
   SPBS_JUSTCENTER                      : constant := 16#000C#;
   SPBS_NOBORDER                        : constant := 16#0020#;
   SPBS_PADWITHZEROS                    : constant := 16#0080#;
   SPBS_FASTSPIN                        : constant := 16#0100#;
   SPBM_OVERRIDESETLIMITS               : constant := 16#0200#;
   SPBM_QUERYLIMITS                     : constant := 16#0201#;
   SPBM_SETTEXTLIMIT                    : constant := 16#0202#;
   SPBM_SPINUP                          : constant := 16#0203#;
   SPBM_SPINDOWN                        : constant := 16#0204#;
   SPBM_QUERYVALUE                      : constant := 16#0205#;
   SPBM_SETARRAY                        : constant := 16#0206#;
   SPBM_SETLIMITS                       : constant := 16#0207#;
   SPBM_SETCURRENTVALUE                 : constant := 16#0208#;
   SPBM_SETMASTER                       : constant := 16#0209#;
   SPBN_UPARROW                         : constant := 16#020A#;
   SPBN_DOWNARROW                       : constant := 16#020B#;
   SPBN_ENDSPIN                         : constant := 16#020C#;
   SPBN_CHANGE                          : constant := 16#020D#;
   SPBN_SETFOCUS                        : constant := 16#020E#;
   SPBN_KILLFOCUS                       : constant := 16#020F#;
   SPBQ_UPDATEIFVALID                   : constant := 8#0000#;
   SPBQ_ALWAYSUPDATE                    : constant := 1;
   SPBQ_DONOTUPDATE                     : constant := 3;
   SLM_ADDDETENT                        : constant := 16#0369#;
   SLM_QUERYDETENTPOS                   : constant := 16#036A#;
   SLM_QUERYSCALETEXT                   : constant := 16#036B#;
   SLM_QUERYSLIDERINFO                  : constant := 16#036C#;
   SLM_QUERYTICKPOS                     : constant := 16#036D#;
   SLM_QUERYTICKSIZE                    : constant := 16#036E#;
   SLM_REMOVEDETENT                     : constant := 16#036F#;
   SLM_SETSCALETEXT                     : constant := 16#0370#;
   SLM_SETSLIDERINFO                    : constant := 16#0371#;
   SLM_SETTICKSIZE                      : constant := 16#0372#;
   SLN_CHANGE                           : constant := 1;
   SLN_SLIDERTRACK                      : constant := 2;
   SLN_SETFOCUS                         : constant := 3;
   SLN_KILLFOCUS                        : constant := 4;
   SLS_HORIZONTAL                       : constant := 16#0000#;
   SLS_VERTICAL                         : constant := 16#0001#;
   SLS_CENTER                           : constant := 16#0000#;
   SLS_BOTTOM                           : constant := 16#0002#;
   SLS_TOP                              : constant := 16#0004#;
   SLS_LEFT                             : constant := 16#0002#;
   SLS_RIGHT                            : constant := 16#0004#;
   SLS_SNAPTOINCREMENT                  : constant := 16#0008#;
   SLS_BUTTONSBOTTOM                    : constant := 16#0010#;
   SLS_BUTTONSTOP                       : constant := 16#0020#;
   SLS_BUTTONSLEFT                      : constant := 16#0010#;
   SLS_BUTTONSRIGHT                     : constant := 16#0020#;
   SLS_OWNERDRAW                        : constant := 16#0040#;
   SLS_READONLY                         : constant := 16#0080#;
   SLS_RIBBONSTRIP                      : constant := 16#0100#;
   SLS_HOMEBOTTOM                       : constant := 16#0000#;
   SLS_HOMETOP                          : constant := 16#0200#;
   SLS_HOMELEFT                         : constant := 16#0000#;
   SLS_HOMERIGHT                        : constant := 16#0200#;
   SLS_PRIMARYSCALE1                    : constant := 16#0000#;
   SLS_PRIMARYSCALE2                    : constant := 16#0400#;
   SMA_SCALE1                           : constant := 16#0001#;
   SMA_SCALE2                           : constant := 16#0002#;
   SMA_SHAFTDIMENSIONS                  : constant := 16#0000#;
   SMA_SHAFTPOSITION                    : constant := 16#0001#;
   SMA_SLIDERARMDIMENSIONS              : constant := 16#0002#;
   SMA_SLIDERARMPOSITION                : constant := 16#0003#;
   SMA_RANGEVALUE                       : constant := 16#0000#;
   SMA_INCREMENTVALUE                   : constant := 16#0001#;
   SMA_SETALLTICKS                      : constant := 16#0000_FFFF#;
   SDA_RIBBONSTRIP                      : constant := 1;
   SDA_SLIDERSHAFT                      : constant := 2;
   SDA_BACKGROUND                       : constant := 3;
   SDA_SLIDERARM                        : constant := 4;
   PMERR_UPDATE_IN_PROGRESS             : constant := 16#1F06#;
   SLDERR_INVALID_PARAMETERS            : constant := -1;
   BKM_CALCPAGERECT                     : constant := 16#0353#;
   BKM_DELETEPAGE                       : constant := 16#0354#;
   BKM_INSERTPAGE                       : constant := 16#0355#;
   BKM_INVALIDATETABS                   : constant := 16#0356#;
   BKM_TURNTOPAGE                       : constant := 16#0357#;
   BKM_QUERYPAGECOUNT                   : constant := 16#0358#;
   BKM_QUERYPAGEID                      : constant := 16#0359#;
   BKM_QUERYPAGEDATA                    : constant := 16#035A#;
   BKM_QUERYPAGEWINDOWHWND              : constant := 16#035B#;
   BKM_QUERYTABBITMAP                   : constant := 16#035C#;
   BKM_QUERYTABTEXT                     : constant := 16#035D#;
   BKM_SETDIMENSIONS                    : constant := 16#035E#;
   BKM_SETPAGEDATA                      : constant := 16#035F#;
   BKM_SETPAGEWINDOWHWND                : constant := 16#0360#;
   BKM_SETSTATUSLINETEXT                : constant := 16#0361#;
   BKM_SETTABBITMAP                     : constant := 16#0362#;
   BKM_SETTABTEXT                       : constant := 16#0363#;
   BKM_SETNOTEBOOKCOLORS                : constant := 16#0364#;
   BKM_QUERYPAGESTYLE                   : constant := 16#0365#;
   BKM_QUERYSTATUSLINETEXT              : constant := 16#0366#;
   BKN_PAGESELECTED                     : constant := 130;
   BKN_NEWPAGESIZE                      : constant := 131;
   BKN_HELP                             : constant := 132;
   BKN_PAGEDELETED                      : constant := 133;
   BKA_ALL                              : constant := 16#0001#;
   BKA_SINGLE                           : constant := 16#0002#;
   BKA_TAB                              : constant := 16#0004#;
   BKA_LAST                             : constant := 16#0002#;
   BKA_FIRST                            : constant := 16#0004#;
   BKA_NEXT                             : constant := 16#0008#;
   BKA_PREV                             : constant := 16#0010#;
   BKA_TOP                              : constant := 16#0020#;
   BKA_MAJORTAB                         : constant := 16#0001#;
   BKA_MINORTAB                         : constant := 16#0002#;
   BKA_PAGEBUTTON                       : constant := 16#0100#;
   BKA_STATUSTEXTON                     : constant := 16#0001#;
   BKA_MAJOR                            : constant := 16#0040#;
   BKA_MINOR                            : constant := 16#0080#;
   BKA_AUTOPAGESIZE                     : constant := 16#0100#;
   BKA_END                              : constant := 16#0200#;
   BKA_TEXT                             : constant := 16#0400#;
   BKA_BITMAP                           : constant := 16#0800#;
   BKS_BACKPAGESBR                      : constant := 16#0001#;
   BKS_BACKPAGESBL                      : constant := 16#0002#;
   BKS_BACKPAGESTR                      : constant := 16#0004#;
   BKS_BACKPAGESTL                      : constant := 16#0008#;
   BKS_MAJORTABRIGHT                    : constant := 16#0010#;
   BKS_MAJORTABLEFT                     : constant := 16#0020#;
   BKS_MAJORTABTOP                      : constant := 16#0040#;
   BKS_MAJORTABBOTTOM                   : constant := 16#0080#;
   BKS_SQUARETABS                       : constant := 16#0000#;
   BKS_ROUNDEDTABS                      : constant := 16#0100#;
   BKS_POLYGONTABS                      : constant := 16#0200#;
   BKS_SOLIDBIND                        : constant := 16#0000#;
   BKS_SPIRALBIND                       : constant := 16#0400#;
   BKS_STATUSTEXTLEFT                   : constant := 16#0000#;
   BKS_STATUSTEXTRIGHT                  : constant := 16#1000#;
   BKS_STATUSTEXTCENTER                 : constant := 16#2000#;
   BKS_TABTEXTLEFT                      : constant := 16#0000#;
   BKS_TABTEXTRIGHT                     : constant := 16#4000#;
   BKS_TABTEXTCENTER                    : constant := 16#8000#;
   BKA_BACKGROUNDPAGECOLORINDEX         : constant := 16#0001#;
   BKA_BACKGROUNDPAGECOLOR              : constant := 16#0002#;
   BKA_BACKGROUNDMAJORCOLORINDEX        : constant := 16#0003#;
   BKA_BACKGROUNDMAJORCOLOR             : constant := 16#0004#;
   BKA_BACKGROUNDMINORCOLORINDEX        : constant := 16#0005#;
   BKA_BACKGROUNDMINORCOLOR             : constant := 16#0006#;
   BKA_FOREGROUNDMAJORCOLORINDEX        : constant := 16#0007#;
   BKA_FOREGROUNDMAJORCOLOR             : constant := 16#0008#;
   BKA_FOREGROUNDMINORCOLORINDEX        : constant := 16#0009#;
   BKA_FOREGROUNDMINORCOLOR             : constant := 16#000A#;
   BOOKERR_INVALID_PARAMETERS           : constant := -1;
   PMERR_NOT_DRAGGING                   : constant := 16#1F00#;
   PMERR_ALREADY_DRAGGING               : constant := 16#1F01#;
   WM_DRAGFIRST                         : constant := 16#0310#;
   WM_DRAGLAST                          : constant := 16#032F#;
   DM_DROP                              : constant := 16#032F#;
   DM_DRAGOVER                          : constant := 16#032E#;
   DM_DRAGLEAVE                         : constant := 16#032D#;
   DM_DROPHELP                          : constant := 16#032C#;
   DM_ENDCONVERSATION                   : constant := 16#032B#;
   DM_PRINT                             : constant := 16#032A#;
   DM_RENDER                            : constant := 16#0329#;
   DM_RENDERCOMPLETE                    : constant := 16#0328#;
   DM_RENDERPREPARE                     : constant := 16#0327#;
   DM_DRAGFILECOMPLETE                  : constant := 16#0326#;
   DM_EMPHASIZETARGET                   : constant := 16#0325#;
   DM_DRAGERROR                         : constant := 16#0324#;
   DM_FILERENDERED                      : constant := 16#0323#;
   DM_RENDERFILE                        : constant := 16#0322#;
   DM_DRAGOVERNOTIFY                    : constant := 16#0321#;
   DM_PRINTOBJECT                       : constant := 16#0320#;
   DM_DISCARDOBJECT                     : constant := 16#031F#;
   MSGF_DRAG                            : constant := 16#0010#;
   DC_OPEN                              : constant := 16#0001#;
   DC_REF                               : constant := 16#0002#;
   DC_GROUP                             : constant := 16#0004#;
   DC_CONTAINER                         : constant := 16#0008#;
   DC_PREPARE                           : constant := 16#0010#;
   DC_REMOVEABLEMEDIA                   : constant := 16#0020#;
   DF_MOVE                              : constant := 16#0001#;
   DF_SOURCE                            : constant := 16#0002#;
   DF_SUCCESSFUL                        : constant := 16#0004#;
   DFF_MOVE                             : constant := 1;
   DFF_COPY                             : constant := 2;
   DFF_DELETE                           : constant := 3;
   DME_IGNOREABORT                      : constant := 1;
   DME_IGNORECONTINUE                   : constant := 2;
   DME_REPLACE                          : constant := 3;
   DME_RETRY                            : constant := 4;
   DMFL_TARGETSUCCESSFUL                : constant := 16#0001#;
   DMFL_TARGETFAIL                      : constant := 16#0002#;
   DMFL_NATIVERENDER                    : constant := 16#0004#;
   DMFL_RENDERRETRY                     : constant := 16#0008#;
   DMFL_RENDEROK                        : constant := 16#0010#;
   DMFL_RENDERFAIL                      : constant := 16#0020#;
   DO_DEFAULT                           : constant := 16#0000_BFFE#;
   DO_UNKNOWN                           : constant := 16#0000_BFFF#;
   DO_COPYABLE                          : constant := 16#0001#;
   DO_MOVEABLE                          : constant := 16#0002#;
   DO_LINKABLE                          : constant := 16#0004#;
   DO_COPY                              : constant := 16#0010#;
   DO_MOVE                              : constant := 16#0020#;
   DO_LINK                              : constant := 16#0018#;
   DO_CREATE                            : constant := 16#0040#;
   DOR_NODROP                           : constant := 16#0000#;
   DOR_DROP                             : constant := 16#0001#;
   DOR_NODROPOP                         : constant := 16#0002#;
   DOR_NEVERDROP                        : constant := 16#0003#;
   DRG_ICON                             : constant := 16#0001#;
   DRG_BITMAP                           : constant := 16#0002#;
   DRG_POLYGON                          : constant := 16#0004#;
   DRG_STRETCH                          : constant := 16#0008#;
   DRG_TRANSPARENT                      : constant := 16#0010#;
   DRG_CLOSED                           : constant := 16#0020#;
   DRR_SOURCE                           : constant := 1;
   DRR_TARGET                           : constant := 2;
   DRR_ABORT                            : constant := 3;
   DRT_ASM                              : constant string := "Assembler Code";
   DRT_BASIC                            : constant string := "BASIC Code";
   DRT_BINDATA                          : constant string := "Binary Data";
   DRT_BITMAP                           : constant string := "Bitmap";
   DRT_C                                : constant string := "C Code";
   DRT_COBOL                            : constant string := "COBOL Code";
   DRT_DLL                              : constant string := "Dynamic Link Library";
   DRT_DOSCMD                           : constant string := "DOS Command File";
   DRT_EXE                              : constant string := "Executable";
   DRT_FORTRAN                          : constant string := "FORTRAN Code";
   DRT_ICON                             : constant string := "Icon";
   DRT_LIB                              : constant string := "Library";
   DRT_METAFILE                         : constant string := "Metafile";
   DRT_OS2CMD                           : constant string := "OS/2 Command File";
   DRT_PASCAL                           : constant string := "Pascal Code";
   DRT_RESOURCE                         : constant string := "Resource File";
   DRT_TEXT                             : constant string := "Plain Text";
   DRT_UNKNOWN                          : constant string := "Unknown";
   VDA_ITEM                             : constant := 16#0001#;
   VDA_ITEMBACKGROUND                   : constant := 16#0002#;
   VDA_SURROUNDING                      : constant := 16#0003#;
   VDA_BACKGROUND                       : constant := 16#0004#;
   VIA_BITMAP                           : constant := 16#0001#;
   VIA_ICON                             : constant := 16#0002#;
   VIA_TEXT                             : constant := 16#0004#;
   VIA_RGB                              : constant := 16#0008#;
   VIA_COLORINDEX                       : constant := 16#0010#;
   VIA_OWNERDRAW                        : constant := 16#0020#;
   VIA_DISABLED                         : constant := 16#0040#;
   VIA_DRAGGABLE                        : constant := 16#0080#;
   VIA_DROPONABLE                       : constant := 16#0100#;
   VM_QUERYITEM                         : constant := 16#0375#;
   VM_QUERYITEMATTR                     : constant := 16#0376#;
   VM_QUERYMETRICS                      : constant := 16#0377#;
   VM_QUERYSELECTEDITEM                 : constant := 16#0378#;
   VM_SELECTITEM                        : constant := 16#0379#;
   VM_SETITEM                           : constant := 16#037A#;
   VM_SETITEMATTR                       : constant := 16#037B#;
   VM_SETMETRICS                        : constant := 16#037C#;
   VMA_ITEMSIZE                         : constant := 16#0001#;
   VMA_ITEMSPACING                      : constant := 16#0002#;
   VN_SELECT                            : constant := 16#0078#;
   VN_ENTER                             : constant := 16#0079#;
   VN_DRAGLEAVE                         : constant := 16#007A#;
   VN_DRAGOVER                          : constant := 16#007B#;
   VN_DROP                              : constant := 16#007C#;
   VN_DROPHELP                          : constant := 16#007D#;
   VN_INITDRAG                          : constant := 16#007E#;
   VN_SETFOCUS                          : constant := 16#007F#;
   VN_KILLFOCUS                         : constant := 16#0080#;
   VN_HELP                              : constant := 16#0081#;
   VS_BITMAP                            : constant := 16#0001#;
   VS_ICON                              : constant := 16#0002#;
   VS_TEXT                              : constant := 16#0004#;
   VS_RGB                               : constant := 16#0008#;
   VS_COLORINDEX                        : constant := 16#0010#;
   VS_BORDER                            : constant := 16#0020#;
   VS_ITEMBORDER                        : constant := 16#0040#;
   VS_SCALEBITMAPS                      : constant := 16#0080#;
   VS_RIGHTTOLEFT                       : constant := 16#0100#;
   VS_OWNERDRAW                         : constant := 16#0200#;
   VSERR_INVALID_PARAMETERS             : constant := -1;
   CA_CONTAINERTITLE                    : constant := 16#0200#;
   CA_TITLESEPARATOR                    : constant := 16#0400#;
   CA_TITLELEFT                         : constant := 16#0800#;
   CA_TITLERIGHT                        : constant := 16#1000#;
   CA_TITLECENTER                       : constant := 16#2000#;
   CA_OWNERDRAW                         : constant := 16#4000#;
   CA_DETAILSVIEWTITLES                 : constant := 16#8000#;
   CA_ORDEREDTARGETEMPH                 : constant := 16#0001_0000#;
   CA_DRAWBITMAP                        : constant := 16#0002_0000#;
   CA_DRAWICON                          : constant := 16#0004_0000#;
   CA_TITLEREADONLY                     : constant := 16#0008_0000#;
   CA_OWNERPAINTBACKGROUND              : constant := 16#0010_0000#;
   CA_MIXEDTARGETEMPH                   : constant := 16#0020_0000#;
   CA_TREELINE                          : constant := 16#0040_0000#;
   CCS_EXTENDSEL                        : constant := 16#0001#;
   CCS_MULTIPLESEL                      : constant := 16#0002#;
   CCS_SINGLESEL                        : constant := 16#0004#;
   CCS_AUTOPOSITION                     : constant := 16#0008#;
   CCS_VERIFYPOINTERS                   : constant := 16#0010#;
   CCS_READONLY                         : constant := 16#0020#;
   CCS_MINIRECORDCORE                   : constant := 16#0040#;
   CFA_LEFT                             : constant := 16#0001#;
   CFA_RIGHT                            : constant := 16#0002#;
   CFA_CENTER                           : constant := 16#0004#;
   CFA_TOP                              : constant := 16#0008#;
   CFA_VCENTER                          : constant := 16#0010#;
   CFA_BOTTOM                           : constant := 16#0020#;
   CFA_INVISIBLE                        : constant := 16#0040#;
   CFA_BITMAPORICON                     : constant := 16#0100#;
   CFA_SEPARATOR                        : constant := 16#0200#;
   CFA_HORZSEPARATOR                    : constant := 16#0400#;
   CFA_STRING                           : constant := 16#0800#;
   CFA_OWNER                            : constant := 16#1000#;
   CFA_DATE                             : constant := 16#2000#;
   CFA_TIME                             : constant := 16#4000#;
   CFA_FIREADONLY                       : constant := 16#8000#;
   CFA_FITITLEREADONLY                  : constant := 16#0001_0000#;
   CFA_ULONG                            : constant := 16#0002_0000#;
   CID_LEFTCOLTITLEWND                  : constant := 16#7FF0#;
   CID_RIGHTCOLTITLEWND                 : constant := 16#7FF1#;
   CID_BLANKBOX                         : constant := 16#7FF2#;
   CID_HSCROLL                          : constant := 16#7FF3#;
   CID_RIGHTHSCROLL                     : constant := 16#7FF4#;
   CID_CNRTITLEWND                      : constant := 16#7FF5#;
   CID_LEFTDVWND                        : constant := 16#7FF7#;
   CID_RIGHTDVWND                       : constant := 16#7FF8#;
   CID_VSCROLL                          : constant := 16#7FF9#;
   CID_MLE                              : constant := 16#7FFA#;
   CM_ALLOCDETAILFIELDINFO              : constant := 16#0330#;
   CM_ALLOCRECORD                       : constant := 16#0331#;
   CM_ARRANGE                           : constant := 16#0332#;
   CM_ERASERECORD                       : constant := 16#0333#;
   CM_FILTER                            : constant := 16#0334#;
   CM_FREEDETAILFIELDINFO               : constant := 16#0335#;
   CM_FREERECORD                        : constant := 16#0336#;
   CM_HORZSCROLLSPLITWINDOW             : constant := 16#0337#;
   CM_INSERTDETAILFIELDINFO             : constant := 16#0338#;
   CM_INSERTRECORD                      : constant := 16#0339#;
   CM_INVALIDATEDETAILFIELDINFO         : constant := 16#033A#;
   CM_INVALIDATERECORD                  : constant := 16#033B#;
   CM_PAINTBACKGROUND                   : constant := 16#033C#;
   CM_QUERYCNRINFO                      : constant := 16#033D#;
   CM_QUERYDETAILFIELDINFO              : constant := 16#033E#;
   CM_QUERYDRAGIMAGE                    : constant := 16#033F#;
   CM_QUERYRECORD                       : constant := 16#0340#;
   CM_QUERYRECORDEMPHASIS               : constant := 16#0341#;
   CM_QUERYRECORDFROMRECT               : constant := 16#0342#;
   CM_QUERYRECORDRECT                   : constant := 16#0343#;
   CM_QUERYVIEWPORTRECT                 : constant := 16#0344#;
   CM_REMOVEDETAILFIELDINFO             : constant := 16#0345#;
   CM_REMOVERECORD                      : constant := 16#0346#;
   CM_SCROLLWINDOW                      : constant := 16#0347#;
   CM_SEARCHSTRING                      : constant := 16#0348#;
   CM_SETCNRINFO                        : constant := 16#0349#;
   CM_SETRECORDEMPHASIS                 : constant := 16#034A#;
   CM_SORTRECORD                        : constant := 16#034B#;
   CM_OPENEDIT                          : constant := 16#034C#;
   CM_CLOSEEDIT                         : constant := 16#034D#;
   CM_COLLAPSETREE                      : constant := 16#034E#;
   CM_EXPANDTREE                        : constant := 16#034F#;
   CM_QUERYRECORDINFO                   : constant := 16#0350#;
   CMA_TOP                              : constant := 16#0001#;
   CMA_BOTTOM                           : constant := 16#0002#;
   CMA_LEFT                             : constant := 16#0004#;
   CMA_RIGHT                            : constant := 16#0008#;
   CMA_FIRST                            : constant := 16#0010#;
   CMA_LAST                             : constant := 16#0020#;
   CMA_END                              : constant := 16#0040#;
   CMA_PREV                             : constant := 16#0080#;
   CMA_NEXT                             : constant := 16#0100#;
   CMA_HORIZONTAL                       : constant := 16#0200#;
   CMA_VERTICAL                         : constant := 16#0400#;
   CMA_ICON                             : constant := 16#0800#;
   CMA_TEXT                             : constant := 16#1000#;
   CMA_PARTIAL                          : constant := 16#2000#;
   CMA_COMPLETE                         : constant := 16#4000#;
   CMA_PARENT                           : constant := 16#0001#;
   CMA_FIRSTCHILD                       : constant := 16#0002#;
   CMA_LASTCHILD                        : constant := 16#0004#;
   CMA_CNRTITLE                         : constant := 16#0001#;
   CMA_DELTA                            : constant := 16#0002#;
   CMA_FLWINDOWATTR                     : constant := 16#0004#;
   CMA_LINESPACING                      : constant := 16#0008#;
   CMA_PFIELDINFOLAST                   : constant := 16#0010#;
   CMA_PSORTRECORD                      : constant := 16#0020#;
   CMA_PTLORIGIN                        : constant := 16#0040#;
   CMA_SLBITMAPORICON                   : constant := 16#0080#;
   CMA_XVERTSPLITBAR                    : constant := 16#0100#;
   CMA_PFIELDINFOOBJECT                 : constant := 16#0200#;
   CMA_TREEICON                         : constant := 16#0400#;
   CMA_TREEBITMAP                       : constant := 16#0800#;
   CMA_CXTREEINDENT                     : constant := 16#1000#;
   CMA_CXTREELINE                       : constant := 16#2000#;
   CMA_SLTREEBITMAPORICON               : constant := 16#4000#;
   CMA_ITEMORDER                        : constant := 16#0001#;
   CMA_WINDOW                           : constant := 16#0002#;
   CMA_WORKSPACE                        : constant := 16#0004#;
   CMA_ZORDER                           : constant := 16#0008#;
   CMA_DELTATOP                         : constant := 16#0001#;
   CMA_DELTABOT                         : constant := 16#0002#;
   CMA_DELTAHOME                        : constant := 16#0004#;
   CMA_DELTAEND                         : constant := 16#0008#;
   CMA_NOREPOSITION                     : constant := 16#0001#;
   CMA_REPOSITION                       : constant := 16#0002#;
   CMA_TEXTCHANGED                      : constant := 16#0004#;
   CMA_ERASE                            : constant := 16#0008#;
   CMA_FREE                             : constant := 16#0001#;
   CMA_INVALIDATE                       : constant := 16#0002#;
   CN_DRAGAFTER                         : constant := 16#0065#;
   CN_DRAGLEAVE                         : constant := 16#0066#;
   CN_DRAGOVER                          : constant := 16#0067#;
   CN_DROP                              : constant := 16#0068#;
   CN_DROPHELP                          : constant := 16#0069#;
   CN_ENTER                             : constant := 16#006A#;
   CN_INITDRAG                          : constant := 16#006B#;
   CN_EMPHASIS                          : constant := 16#006C#;
   CN_KILLFOCUS                         : constant := 16#006D#;
   CN_SCROLL                            : constant := 16#006E#;
   CN_QUERYDELTA                        : constant := 16#006F#;
   CN_SETFOCUS                          : constant := 16#0070#;
   CN_REALLOCPSZ                        : constant := 16#0071#;
   CN_BEGINEDIT                         : constant := 16#0072#;
   CN_ENDEDIT                           : constant := 16#0073#;
   CN_COLLAPSETREE                      : constant := 16#0074#;
   CN_EXPANDTREE                        : constant := 16#0075#;
   CN_HELP                              : constant := 16#0076#;
   CN_CONTEXTMENU                       : constant := 16#0077#;
   CRA_SELECTED                         : constant := 16#0001#;
   CRA_TARGET                           : constant := 16#0002#;
   CRA_CURSORED                         : constant := 16#0004#;
   CRA_INUSE                            : constant := 16#0008#;
   CRA_FILTERED                         : constant := 16#0010#;
   CRA_DROPONABLE                       : constant := 16#0020#;
   CRA_RECORDREADONLY                   : constant := 16#0040#;
   CRA_EXPANDED                         : constant := 16#0080#;
   CRA_COLLAPSED                        : constant := 16#0100#;
   CRA_SOURCE                           : constant := 16#4000#;
   CV_TEXT                              : constant := 16#0001#;
   CV_NAME                              : constant := 16#0002#;
   CV_ICON                              : constant := 16#0004#;
   CV_DETAIL                            : constant := 16#0008#;
   CV_FLOW                              : constant := 16#0010#;
   CV_MINI                              : constant := 16#0020#;
   CV_TREE                              : constant := 16#0040#;
   PMERR_NOFILTERED_ITEMS               : constant := 16#1F02#;
   PMERR_COMPARISON_FAILED              : constant := 16#1F03#;
   PMERR_RECORD_CURRENTLY_INSERTED      : constant := 16#1F04#;
   PMERR_FI_CURRENTLY_INSERTED          : constant := 16#1F05#;
   CO_FAILIFEXISTS                      : constant := 8#0000#;
   CO_REPLACEIFEXISTS                   : constant := 1;
   CO_UPDATEIFEXISTS                    : constant := 2;
   SPL_ERROR                            : constant := 8#0000#;
   SPL_OK                               : constant := 1;
   SPL_INI_SPOOLER                      : constant string := "PM_SPOOLER";
   SPL_INI_QUEUE                        : constant string := "PM_SPOOLER_QUEUE";
   SPL_INI_PRINTER                      : constant string := "PM_SPOOLER_PRINTER";
   SPL_INI_PRINTERDESCR                 : constant string := "PM_SPOOLER_PRINTER_DESCR";
   SPL_INI_QUEUEDESCR                   : constant string := "PM_SPOOLER_QUEUE_DESCR";
   SPL_INI_QUEUEDD                      : constant string := "PM_SPOOLER_QUEUE_DD";
   SPL_INI_QUEUEDDDATA                  : constant string := "PM_SPOOLER_QUEUE_DDDATA";
   SPLC_ABORT                           : constant := 1;
   SPLC_PAUSE                           : constant := 2;
   SPLC_CONTINUE                        : constant := 3;
   SPLDATA_PRINTERJAM                   : constant := 16#0001#;
   SPLDATA_FORMCHGREQD                  : constant := 16#0002#;
   SPLDATA_CARTCHGREQD                  : constant := 16#0004#;
   SPLDATA_PENCHGREQD                   : constant := 16#0008#;
   SPLDATA_DATAERROR                    : constant := 16#0010#;
   SPLDATA_UNEXPECTERROR                : constant := 16#0020#;
   SPLDATA_OTHER                        : constant := 16#8000#;
   SPLINFO_QPERROR                      : constant := 16#0001#;
   SPLINFO_DDERROR                      : constant := 16#0002#;
   SPLINFO_SPLERROR                     : constant := 16#0004#;
   SPLINFO_OTHERERROR                   : constant := 16#0080#;
   SPLINFO_INFORMATION                  : constant := 16#0100#;
   SPLINFO_WARNING                      : constant := 16#0200#;
   SPLINFO_ERROR                        : constant := 16#0400#;
   SPLINFO_SEVERE                       : constant := 16#0800#;
   SPLINFO_USERINTREQD                  : constant := 16#1000#;
   SSQL_ERROR                           : constant := -1;
   QP_RAWDATA_BYPASS                    : constant := 16#0001#;
   QPDAT_ADDRESS                        : constant := 8#0000#;
   QPDAT_DRIVER_NAME                    : constant := 1;
   QPDAT_DRIVER_DATA                    : constant := 2;
   QPDAT_DATA_TYPE                      : constant := 3;
   QPDAT_COMMENT                        : constant := 4;
   QPDAT_PROC_PARAMS                    : constant := 5;
   QPDAT_SPL_PARAMS                     : constant := 6;
   QPDAT_NET_PARAMS                     : constant := 7;
   QPDAT_DOC_NAME                       : constant := 8;
   QPDAT_QUEUE_NAME                     : constant := 9;
   QPDAT_TOKEN                          : constant := 10;
   QPDAT_JOBID                          : constant := 11;
   CNLEN                                : constant := 15;
   DTLEN                                : constant := 9;
   PDLEN                                : constant := 8;
   QNLEN                                : constant := 12;
   UNLEN                                : constant := 20;
   DRIV_DEVICENAME_SIZE                 : constant := 31;
   DRIV_NAME_SIZE                       : constant := 8;
   FORMNAME_SIZE                        : constant := 31;
   MAXCOMMENTSZ                         : constant := 48;
   PRINTERNAME_SIZE                     : constant := 16#0020#;
   QP_DATATYPE_SIZE                     : constant := 15;
   PRD_STATUS_MASK                      : constant := 16#0003#;
   PRD_DEVSTATUS                        : constant := 16#0FFC#;
   PRD_ACTIVE                           : constant := 8#0000#;
   PRD_PAUSED                           : constant := 1;
   PRD_DELETE                           : constant := 8#0000#;
   PRD_PAUSE                            : constant := 1;
   PRD_CONT                             : constant := 2;
   PRD_RESTART                          : constant := 3;
   PRD_LOGADDR_PARMNUM                  : constant := 3;
   PRD_COMMENT_PARMNUM                  : constant := 7;
   PRD_DRIVERS_PARMNUM                  : constant := 8;
   PRD_TIMEOUT_PARMNUM                  : constant := 10;
   PRJ_NOTIFYNAME_PARMNUM               : constant := 3;
   PRJ_DATATYPE_PARMNUM                 : constant := 4;
   PRJ_PARMS_PARMNUM                    : constant := 5;
   PRJ_POSITION_PARMNUM                 : constant := 6;
   PRJ_JOBFILEINUSE_PARMNUM             : constant := 7;
   PRJ_COMMENT_PARMNUM                  : constant := 11;
   PRJ_DOCUMENT_PARMNUM                 : constant := 12;
   PRJ_STATUSCOMMENT_PARMNUM            : constant := 13;
   PRJ_PRIORITY_PARMNUM                 : constant := 14;
   PRJ_PROCPARMS_PARMNUM                : constant := 16#0010#;
   PRJ_DRIVERDATA_PARMNUM               : constant := 18;
   PRJ_MAXPARMNUM                       : constant := 18;
   PRJ_QSTATUS                          : constant := 16#0003#;
   PRJ_DEVSTATUS                        : constant := 16#0FFC#;
   PRJ_COMPLETE                         : constant := 16#0004#;
   PRJ_INTERV                           : constant := 16#0008#;
   PRJ_ERROR                            : constant := 16#0010#;
   PRJ_DESTOFFLINE                      : constant := 16#0020#;
   PRJ_DESTPAUSED                       : constant := 16#0040#;
   PRJ_NOTIFY                           : constant := 16#0080#;
   PRJ_DESTNOPAPER                      : constant := 16#0100#;
   PRJ_DESTFORMCHG                      : constant := 16#0200#;
   PRJ_DESTCRTCHG                       : constant := 16#0400#;
   PRJ_DESTPENCHG                       : constant := 16#0800#;
   PRJ_JOBFILEINUSE                     : constant := 16#4000#;
   PRJ_DELETED                          : constant := 16#8000#;
   PRJ_QS_QUEUED                        : constant := 8#0000#;
   PRJ_QS_PAUSED                        : constant := 1;
   PRJ_QS_SPOOLING                      : constant := 2;
   PRJ_QS_PRINTING                      : constant := 3;
   PRJ_MAX_PRIORITY                     : constant := 99;
   PRJ_MIN_PRIORITY                     : constant := 1;
   PRJ_NO_PRIORITY                      : constant := 8#0000#;
   PRQ_PRIORITY_PARMNUM                 : constant := 2;
   PRQ_STARTTIME_PARMNUM                : constant := 3;
   PRQ_UNTILTIME_PARMNUM                : constant := 4;
   PRQ_SEPARATOR_PARMNUM                : constant := 5;
   PRQ_PROCESSOR_PARMNUM                : constant := 6;
   PRQ_DESTINATIONS_PARMNUM             : constant := 7;
   PRQ_PARMS_PARMNUM                    : constant := 8;
   PRQ_COMMENT_PARMNUM                  : constant := 9;
   PRQ_TYPE_PARMNUM                     : constant := 10;
   PRQ_PRINTERS_PARMNUM                 : constant := 12;
   PRQ_DRIVERNAME_PARMNUM               : constant := 13;
   PRQ_DRIVERDATA_PARMNUM               : constant := 14;
   PRQ_REMOTE_COMPUTER_PARMNUM          : constant := 15;
   PRQ_REMOTE_QUEUE_PARMNUM             : constant := 16#0010#;
   PRQ_MAXPARMNUM                       : constant := 16#0010#;
   PRQ_MAX_PRIORITY                     : constant := 1;
   PRQ_DEF_PRIORITY                     : constant := 5;
   PRQ_MIN_PRIORITY                     : constant := 9;
   PRQ_NO_PRIORITY                      : constant := 8#0000#;
   PRQ_STATUS_MASK                      : constant := 3;
   PRQ_ACTIVE                           : constant := 8#0000#;
   PRQ_PAUSED                           : constant := 1;
   PRQ_ERROR                            : constant := 2;
   PRQ_PENDING                          : constant := 3;
   PRQ3_PAUSED                          : constant := 16#0001#;
   PRQ3_PENDING                         : constant := 16#0002#;
   PRQ3_TYPE_RAW                        : constant := 16#0001#;
   PRQ3_TYPE_BYPASS                     : constant := 16#0002#;
   PRQ3_TYPE_APPDEFAULT                 : constant := 16#0004#;
   SPL_PR_QUEUE                         : constant := 16#0001#;
   SPL_PR_DIRECT_DEVICE                 : constant := 16#0002#;
   SPL_PR_QUEUED_DEVICE                 : constant := 16#0004#;
   SPL_PR_LOCAL_ONLY                    : constant := 16#0100#;
   CMIC_HIDE_PANEL_ID                   : constant := 16#0000#;
   CMIC_SHOW_PANEL_ID                   : constant := 16#0001#;
   CMIC_TOGGLE_PANEL_ID                 : constant := 16#0002#;
    CTRL_PREVIOUS_ID                    : constant USHORT := 1;
    CTRL_SEARCH_ID                      : constant USHORT := 2;
    CTRL_PRINT_ID                       : constant USHORT := 3;
    CTRL_INDEX_ID                       : constant USHORT := 4;
    CTRL_CONTENTS_ID                    : constant USHORT := 5;
    CTRL_BACK_ID                        : constant USHORT := 6;
    CTRL_FORWARD_ID                     : constant USHORT := 7;
    CTRL_TUTORIAL_ID                    : constant USHORT := 255;
    CTRL_USER_ID_BASE                   : constant USHORT := 257;
   HM_MSG_BASE                          : constant := 16#0220#;
   HM_DISMISS_WINDOW                    : constant := 16#0221#;
   HM_DISPLAY_HELP                      : constant := 16#0222#;
   HM_EXT_HELP                          : constant := 16#0223#;
   HM_GENERAL_HELP                      : constant := 16#0223#;
   HM_SET_ACTIVE_WINDOW                 : constant := 16#0224#;
   HM_LOAD_HELP_TABLE                   : constant := 16#0225#;
   HM_CREATE_HELP_TABLE                 : constant := 16#0226#;
   HM_SET_HELP_WINDOW_TITLE             : constant := 16#0227#;
   HM_SET_SHOW_PANEL_ID                 : constant := 16#0228#;
   HM_REPLACE_HELP_FOR_HELP             : constant := 16#0229#;
   HM_REPLACE_USING_HELP                : constant := 16#0229#;
   HM_HELP_INDEX                        : constant := 16#022A#;
   HM_HELP_CONTENTS                     : constant := 16#022B#;
   HM_KEYS_HELP                         : constant := 16#022C#;
   HM_SET_HELP_LIBRARY_NAME             : constant := 16#022D#;
   HM_ERROR                             : constant := 16#022E#;
   HM_HELPSUBITEM_NOT_FOUND             : constant := 16#022F#;
   HM_QUERY_KEYS_HELP                   : constant := 16#0230#;
   HM_TUTORIAL                          : constant := 16#0231#;
   HM_EXT_HELP_UNDEFINED                : constant := 16#0232#;
   HM_GENERAL_HELP_UNDEFINED            : constant := 16#0232#;
   HM_ACTIONBAR_COMMAND                 : constant := 16#0233#;
   HM_INFORM                            : constant := 16#0234#;
   HM_SET_OBJCOM_WINDOW                 : constant := 16#0238#;
   HM_UPDATE_OBJCOM_WINDOW_CHAIN        : constant := 16#0239#;
   HM_QUERY_DDF_DATA                    : constant := 16#023A#;
   HM_INVALIDATE_DDF_DATA               : constant := 16#023B#;
   HM_QUERY                             : constant := 16#023C#;
   HM_SET_COVERPAGE_SIZE                : constant := 16#023D#;
   HM_NOTIFY                            : constant := 16#0242#;
   HM_SET_USERDATA                      : constant := 16#0243#;
   HM_CONTROL                           : constant := 16#0244#;
   HM_RESOURCEID                        : constant := 8#0000#;
   HM_PANELNAME                         : constant := 1;
   HMERR_NO_FRAME_WND_IN_CHAIN          : constant := 16#1001#;
   HMERR_INVALID_ASSOC_APP_WND          : constant := 16#1002#;
   HMERR_INVALID_ASSOC_HELP_INST        : constant := 16#1003#;
   HMERR_INVALID_DESTROY_HELP_INST      : constant := 16#1004#;
   HMERR_NO_HELP_INST_IN_CHAIN          : constant := 16#1005#;
   HMERR_INVALID_HELP_INSTANCE_HDL      : constant := 16#1006#;
   HMERR_INVALID_QUERY_APP_WND          : constant := 16#1007#;
   HMERR_HELP_INST_CALLED_INVALID       : constant := 16#1008#;
   HMERR_HELPTABLE_UNDEFINE             : constant := 16#1009#;
   HMERR_HELP_INSTANCE_UNDEFINE         : constant := 16#100A#;
   HMERR_HELPITEM_NOT_FOUND             : constant := 16#100B#;
   HMERR_INVALID_HELPSUBITEM_SIZE       : constant := 16#100C#;
   HMERR_HELPSUBITEM_NOT_FOUND          : constant := 16#100D#;
   HMERR_INDEX_NOT_FOUND                : constant := 16#2001#;
   HMERR_CONTENT_NOT_FOUND              : constant := 16#2002#;
   HMERR_OPEN_LIB_FILE                  : constant := 16#2003#;
   HMERR_READ_LIB_FILE                  : constant := 16#2004#;
   HMERR_CLOSE_LIB_FILE                 : constant := 16#2005#;
   HMERR_INVALID_LIB_FILE               : constant := 16#2006#;
   HMERR_NO_MEMORY                      : constant := 16#2007#;
   HMERR_ALLOCATE_SEGMENT               : constant := 16#2008#;
   HMERR_FREE_MEMORY                    : constant := 16#2009#;
   HMERR_PANEL_NOT_FOUND                : constant := 16#2010#;
   HMERR_DATABASE_NOT_OPEN              : constant := 16#2011#;
   HMERR_LOAD_DLL                       : constant := 16#2013#;
   HMPANELTYPE_NUMBER                   : constant := 8#0000#;
   HMPANELTYPE_NAME                     : constant := 1;
   HMQVP_NUMBER                         : constant := 16#0001#;
   HMQVP_NAME                           : constant := 16#0002#;
   HMQVP_GROUP                          : constant := 16#0003#;
   HMQW_COVERPAGE                       : constant := 16#0001#;
   HMQW_INDEX                           : constant := 16#0002#;
   HMQW_TOC                             : constant := 16#0003#;
   HMQW_SEARCH                          : constant := 16#0004#;
   HMQW_VIEWPAGES                       : constant := 16#0005#;
   HMQW_LIBRARY                         : constant := 16#0006#;
   HMQW_VIEWPORT                        : constant := 16#0007#;
   HMQW_OBJCOM_WINDOW                   : constant := 16#0008#;
   HMQW_INSTANCE                        : constant := 16#0009#;
   HMQW_ACTIVEVIEWPORT                  : constant := 16#000A#;
   CONTROL_SELECTED                     : constant := 16#000B#;
   HMQW_GROUP_VIEWPORT                  : constant := 16#00F1#;
   HMQW_RES_VIEWPORT                    : constant := 16#00F2#;
   USERDATA                             : constant := 16#00F3#;
   OPEN_COVERPAGE                       : constant := 16#0001#;
   OPEN_PAGE                            : constant := 16#0002#;
   SWAP_PAGE                            : constant := 16#0003#;
   OPEN_TOC                             : constant := 16#0004#;
   OPEN_INDEX                           : constant := 16#0005#;
   OPEN_HISTORY                         : constant := 16#0006#;
   OPEN_SEARCH_HIT_LIST                 : constant := 16#0007#;
   OPEN_LIBRARY                         : constant := 16#0008#;
   ART_RUNIN                            : constant := 16#0010#;
   ART_LEFT                             : constant := 16#0001#;
   ART_RIGHT                            : constant := 16#0002#;
   ART_CENTER                           : constant := 16#0004#;
   CLR_UNCHANGED                        : constant := -6;
   HMBT_NONE                            : constant := 1;
   HMBT_ALL                             : constant := 2;
   HMBT_FIT                             : constant := 3;
   HMERR_DDF_MEMORY                     : constant := 16#3001#;
   HMERR_DDF_ALIGN_TYPE                 : constant := 16#3002#;
   HMERR_DDF_BACKCOLOR                  : constant := 16#3003#;
   HMERR_DDF_FORECOLOR                  : constant := 16#3004#;
   HMERR_DDF_FONTSTYLE                  : constant := 16#3005#;
   HMERR_DDF_REFTYPE                    : constant := 16#3006#;
   HMERR_DDF_LIST_UNCLOSED              : constant := 16#3007#;
   HMERR_DDF_LIST_UNINITIALIZED         : constant := 16#3008#;
   HMERR_DDF_LIST_BREAKTYPE             : constant := 16#3009#;
   HMERR_DDF_LIST_SPACING               : constant := 16#300A#;
   HMERR_DDF_HINSTANCE                  : constant := 16#300B#;
   HMERR_DDF_EXCEED_MAX_LENGTH          : constant := 16#300C#;
   HMERR_DDF_EXCEED_MAX_INC             : constant := 16#300D#;
   HMERR_DDF_INVALID_DDF                : constant := 16#300E#;
   HMERR_DDF_FORMAT_TYPE                : constant := 16#300F#;
   HMERR_DDF_INVALID_PARM               : constant := 16#3010#;
   HMERR_DDF_INVALID_FONT               : constant := 16#3011#;
   HMERR_DDF_SEVERE                     : constant := 16#3012#;
   HMLS_SINGLELINE                      : constant := 1;
   HMLS_DOUBLELINE                      : constant := 2;
   REFERENCE_BY_ID                      : constant := 8#0000#;
   REFERENCE_BY_RES                     : constant := 1;
   FONTDEFFONT1                         : constant := 16#0047#;
   FONTDEFFONT2                         : constant := 16#0042#;
   FONTDEFFONT3                         : constant := 16#0042#;
   FONTDEFCHAR1                         : constant := 16#0081#;
   FONTDEFCHAR2                         : constant := 16#0081#;
   FONTDEFCHAR3                         : constant := 16#00B8#;
   SPACE_UNDEF                          : constant := 16#8000#;
   FONT_SIGNATURE                       : constant := 16#FFFF_FFFE#;
   FONT_METRICS                         : constant := 16#0001#;
   FONT_DEFINITION                      : constant := 16#0002#;
   FONT_KERNPAIRS                       : constant := 16#0003#;
   FONT_ADDITIONALMETRICS               : constant := 16#0004#;
   FONT_ENDRECORD                       : constant := 16#FFFF_FFFF#;
   QUERY_PUBLIC_FONTS                   : constant := 16#0001#;
   QUERY_PRIVATE_FONTS                  : constant := 16#0002#;
   CDEF_GENERIC                         : constant := 16#0001#;
   CDEF_BOLD                            : constant := 16#0002#;
   CDEF_ITALIC                          : constant := 16#0004#;
   CDEF_UNDERSCORE                      : constant := 16#0008#;
   CDEF_STRIKEOUT                       : constant := 16#0010#;
   CDEF_OUTLINE                         : constant := 16#0020#;
   FORMAT_CGA                           : constant := 16#0001#;
   FORMAT_4BYTE                         : constant := 16#0003#;
   VQF_PUBLIC                           : constant := 16#0001#;
   VQF_PRIVATE                          : constant := 16#0002#;


   -- these are nonstandard constants (not defined in os2.h)
   ENABLE:	constant := OS2.TRUE;
   DISABLE:	constant := OS2.FALSE;


   type STR8 is
      array(integer range 0..7)
      of CHAR;

   type STR16 is
      array(integer range 0..15)
      of CHAR;

   type STR32 is
      array(integer range 0..31)
      of CHAR;

   type STR64 is
      array(integer range 0..63)
      of CHAR;

   type ARRAY_OF_BYTE is
      array(integer range <>)
      of BYTE;

   type ARRAY_OF_HPROGRAM is
      array(integer range <>)
      of HPROGRAM;

   type struct_FATTRS;
   type struct_PANOSE;
   type struct_FONTMETRICS;
   type struct_POINTL;
   type struct_POINTS;
   type struct_RECTL;
   type struct_QMSG;
   type struct_COMMANDMSG;
   type struct_MQINFO;
   type struct_SWP;
   type struct_RGB;
   type struct_RGB2;
   type struct_BITMAPINFOHEADER;
   type struct_BITMAPINFO;
   type struct_BITMAPINFO2;
   type struct_BITMAPINFOHEADER2;
   type struct_BITMAPFILEHEADER;
   type struct_BITMAPARRAYFILEHEADER;
   type struct_BITMAPFILEHEADER2;
   type struct_BITMAPARRAYFILEHEADER2;
   type struct_ICONINFO;
   type struct_FRAMECDATA;
   type struct_QVERSDATA;
   type struct_CLASSINFO;
   type struct_CREATESTRUCT;
   type struct_ACCEL;
   type struct_ACCELTABLE;
   type struct_BTNCDATA;
   type struct_USERBUTTON;
   type struct_CPTEXT;
   type struct_MFP;
   type struct_CONVCONTEXT;
   type struct_DDEINIT;
   type struct_DDESTRUCT;
   type struct_CURSORINFO;
   type struct_DESKTOP;
   type struct_DLGTITEM;
   type struct_DLGTEMPLATE;
   type struct_ENTRYFDATA;
   type struct_ERRINFO;
   type struct_SMHSTRUCT;
   type struct_CHARMSG;
   type struct_MOUSEMSG;
   type struct_MENUITEM;
   type struct_mti;
   type struct_mt;
   type struct_OWNERITEM;
   type struct_WNDPARAMS;
   type struct_POINTERINFO;
   type struct_SBCDATA;
   type struct_PARAM;
   type struct_PRESPARAMS;
   type struct_TRACKINFO;
   type struct_FORMATRECT;
   type struct_MLECTLDATA;
   type struct_MLEOVERFLOW;
   type struct_MLEMARGSTRUCT;
   type struct_SEARCH;
   type struct_SIZEL;
   type struct_RGNRECT;
   type struct_MATRIXLF;
   type struct_ARCPARAMS;
   type struct_SIZEF;
   type struct_POLYGON;
   type struct_POLYSET;
   type struct_GRADIENTL;
   type struct_KERNINGPAIRS;
   type struct_FACENAMEDESC;
   type struct_FFDESCS2;
   type struct_LINEBUNDLE;
   type struct_CHARBUNDLE;
   type struct_MARKERBUNDLE;
   type struct_AREABUNDLE;
   type struct_IMAGEBUNDLE;
   type struct_DRIVDATA;
   type struct_DEVOPENSTRUC;
   type struct_ESCMODE;
   type struct_VIOSIZECOUNT;
   type struct_VIOFONTCELLSIZE;
   type struct_SFACTORS;
   type struct_BANDRECT;
   type struct_HCINFO;
   type struct_PRFPROFILE;
   type struct_HPROGARRAY;
   type struct_PROGTYPE;
   type struct_PROGTITLE;
   type struct_PROGDETAILS;
   type struct_SWCNTRL;
   type struct_SWENTRY;
   type struct_SWBLOCK;
   type struct_FILEDLG;
   type struct_FONTDLG;
   type struct_STYLECHANGE;
   type struct_SLDCDATA;
   type struct_BOOKTEXT;
   type struct_DELETENOTIFY;
   type struct_PAGESELECTNOTIFY;
   type struct_DRAGIMAGE;
   type struct_DRAGINFO;
   type struct_DRAGITEM;
   type struct_DRAGTRANSFER;
   type struct_RENDERFILE;
   type struct_VSCDATA;
   type struct_VSDRAGINIT;
   type struct_VSDRAGINFO;
   type struct_VSTEXT;
   type struct_TREEITEMDESC;
   type struct_FIELDINFO;
   type struct_RECORDCORE;
   type struct_MINIRECORDCORE;
   type struct_CNRINFO;
   type struct_CDATE;
   type struct_CTIME;
   type struct_CNRDRAGINIT;
   type struct_FIELDINFOINSERT;
   type struct_RECORDINSERT;
   type struct_QUERYRECFROMRECT;
   type struct_QUERYRECORDRECT;
   type struct_SEARCHSTRING;
   type struct_CNRDRAGINFO;
   type struct_NOTIFYRECORDEMPHASIS;
   type struct_NOTIFYRECORDENTER;
   type struct_NOTIFYDELTA;
   type struct_NOTIFYSCROLL;
   type struct_CNREDITDATA;
   type struct_OWNERBACKGROUND;
   type struct_CNRDRAWITEMINFO;
   type struct_OBJCLASS;
   type struct_SQPOPENDATA;
   type struct_DRIVPROPS;
   type struct_PRINTERINFO;
   type struct_PRJINFO;
   type struct_PRJINFO2;
   type struct_PRJINFO3;
   type struct_PRDINFO;
   type struct_PRDINFO3;
   type struct_PRQINFO;
   type struct_PRQINFO3;
   type struct_PRQINFO6;
   type struct_PRIDINFO;
   type struct_PRDRIVINFO;
   type struct_PRQPROCINFO;
   type struct_PRPORTINFO;
   type struct_PRPORTINFO1;
   type struct_ACVP;
   type struct_HELPTABLE;
   type struct_HELPINIT;
   type struct_FOCAMETRICS;
   type struct_FONTFILEMETRICS;
   type struct_FONTDEFINITIONHEADER;
   type struct_FONTSIGNATURE;
   type struct_ADDITIONALMETRICS;
   type struct_FOCAFONT;

   type PFATTRS is access all struct_FATTRS;
   type PFONTMETRICS is access all struct_FONTMETRICS;
   type PPOINTL is access all struct_POINTL;
   type PPOINTS is access all struct_POINTS;
   type PRECTL is access all struct_RECTL;
   type PQMSG is access all struct_QMSG;
   type PCMDMSG is access all struct_COMMANDMSG;
   type PMQINFO is access all struct_MQINFO;
   type PSWP is access all struct_SWP;
   type PRGB2 is access all struct_RGB2;
   type PBITMAPINFOHEADER is access all struct_BITMAPINFOHEADER;
   type PBITMAPINFO is access all struct_BITMAPINFO;
   type PBITMAPINFO2 is access all struct_BITMAPINFO2;
   type PBITMAPINFOHEADER2 is access all struct_BITMAPINFOHEADER2;
   type PBITMAPFILEHEADER is access all struct_BITMAPFILEHEADER;
   type PBITMAPARRAYFILEHEADER is access all struct_BITMAPARRAYFILEHEADER;
   type PBITMAPFILEHEADER2 is access all struct_BITMAPFILEHEADER2;
   type PBITMAPARRAYFILEHEADER2 is access all struct_BITMAPARRAYFILEHEADER2;
   type PICONINFO is access all struct_ICONINFO;
   type PFRAMECDATA is access all struct_FRAMECDATA;
   type PQVERSDATA is access all struct_QVERSDATA;
   type PCLASSINFO is access all struct_CLASSINFO;
   type PCREATESTRUCT is access all struct_CREATESTRUCT;
   type PACCEL is access all struct_ACCEL;
   type PACCELTABLE is access all struct_ACCELTABLE;
   type PBTNCDATA is access all struct_BTNCDATA;
   type PUSERBUTTON is access all struct_USERBUTTON;
   type PCPTEXT is access all struct_CPTEXT;
   type PMFP is access all struct_MFP;
   type PCONVCONTEXT is access all struct_CONVCONTEXT;
   type PDDEINIT is access all struct_DDEINIT;
   type PDDESTRUCT is access all struct_DDESTRUCT;
   type PCURSORINFO is access all struct_CURSORINFO;
   type PDESKTOP is access all struct_DESKTOP;
   type PDLGTITEM is access all struct_DLGTITEM;
   type PDLGTEMPLATE is access all struct_DLGTEMPLATE;
   type PENTRYFDATA is access all struct_ENTRYFDATA;
   type PERRINFO is access all struct_ERRINFO;
   type PSMHSTRUCT is access all struct_SMHSTRUCT;
   type PCHRMSG is access all struct_CHARMSG;
   type PMSEMSG is access all struct_MOUSEMSG;
   type PMENUITEM is access all struct_MENUITEM;
   type LPMT is access all struct_mt;
   type POWNERITEM is access all struct_OWNERITEM;
   type PWNDPARAMS is access all struct_WNDPARAMS;
   type PPOINTERINFO is access all struct_POINTERINFO;
   type PSBCDATA is access all struct_SBCDATA;
   type NPPARAM is access all struct_PARAM;
   type PPARAM is access all struct_PARAM;
   type NPPRESPARAMS is access all struct_PRESPARAMS;
   type PPRESPARAMS is access all struct_PRESPARAMS;
   type PTRACKINFO is access all struct_TRACKINFO;
   type PFORMATRECT is access all struct_FORMATRECT;
   type PMLECTLDATA is access all struct_MLECTLDATA;
   type POVERFLOW is access all struct_MLEOVERFLOW;
   type PMARGSTRUCT is access all struct_MLEMARGSTRUCT;
   type PMLE_SEARCHDATA is access all struct_SEARCH;
   type PSIZEL is access all struct_SIZEL;
   type PRGNRECT is access all struct_RGNRECT;
   type PMATRIXLF is access all struct_MATRIXLF;
   type PARCPARAMS is access all struct_ARCPARAMS;
   type PSIZEF is access all struct_SIZEF;
   type PPOLYGON is access all struct_POLYGON;
   type PPOLYSET is access all struct_POLYSET;
   type PGRADIENTL is access all struct_GRADIENTL;
   type PKERNINGPAIRS is access all struct_KERNINGPAIRS;
   type PFACENAMEDESC is access all struct_FACENAMEDESC;
   type PFFDESCS2 is access all struct_FFDESCS2;
   type PLINEBUNDLE is access all struct_LINEBUNDLE;
   type PCHARBUNDLE is access all struct_CHARBUNDLE;
   type PMARKERBUNDLE is access all struct_MARKERBUNDLE;
   type PAREABUNDLE is access all struct_AREABUNDLE;
   type PIMAGEBUNDLE is access all struct_IMAGEBUNDLE;
   type PDRIVDATA is access all struct_DRIVDATA;
   type PDEVOPENSTRUC is access all struct_DEVOPENSTRUC;
   type PESCMODE is access all struct_ESCMODE;
   type PVIOSIZECOUNT is access all struct_VIOSIZECOUNT;
   type PVIOFONTCELLSIZE is access all struct_VIOFONTCELLSIZE;
   type PSFACTORS is access all struct_SFACTORS;
   type PBANDRECT is access all struct_BANDRECT;
   type PHCINFO is access all struct_HCINFO;
   type PPRFPROFILE is access all struct_PRFPROFILE;
   type PHPROGARRAY is access all struct_HPROGARRAY;
   type PPROGTYPE is access all struct_PROGTYPE;
   type PPROGTITLE is access all struct_PROGTITLE;
   type PPROGDETAILS is access all struct_PROGDETAILS;
   type PSWCNTRL is access all struct_SWCNTRL;
   type PSWENTRY is access all struct_SWENTRY;
   type PSWBLOCK is access all struct_SWBLOCK;
   type PFILEDLG is access all struct_FILEDLG;
   type PFONTDLG is access all struct_FONTDLG;
   type PSTYLECHANGE is access all struct_STYLECHANGE;
   type PSLDCDATA is access all struct_SLDCDATA;
   type PBOOKTEXT is access all struct_BOOKTEXT;
   type PDELETENOTIFY is access all struct_DELETENOTIFY;
   type PPAGESELECTNOTIFY is access all struct_PAGESELECTNOTIFY;
   type PDRAGIMAGE is access all struct_DRAGIMAGE;
   type PDRAGINFO is access all struct_DRAGINFO;
   type PDRAGITEM is access all struct_DRAGITEM;
   type PDRAGTRANSFER is access all struct_DRAGTRANSFER;
   type PRENDERFILE is access all struct_RENDERFILE;
   type PVSCDATA is access all struct_VSCDATA;
   type PVSDRAGINIT is access all struct_VSDRAGINIT;
   type PVSDRAGINFO is access all struct_VSDRAGINFO;
   type PVSTEXT is access all struct_VSTEXT;
   type PTREEITEMDESC is access all struct_TREEITEMDESC;
   type pstruct_FIELDINFO is access all struct_FIELDINFO;
   subtype PFIELDINFO is pstruct_FIELDINFO;
   type pstruct_RECORDCORE is access all struct_RECORDCORE;
   subtype PRECORDCORE is pstruct_RECORDCORE;
   type pstruct_MINIRECORDCORE is access all struct_MINIRECORDCORE;
   subtype PMINIRECORDCORE is pstruct_MINIRECORDCORE;
   type PCNRINFO is access all struct_CNRINFO;
   type PCDATE is access all struct_CDATE;
   type PCTIME is access all struct_CTIME;
   type PCNRDRAGINIT is access all struct_CNRDRAGINIT;
   type PFIELDINFOINSERT is access all struct_FIELDINFOINSERT;
   type PRECORDINSERT is access all struct_RECORDINSERT;
   type PQUERYRECFROMRECT is access all struct_QUERYRECFROMRECT;
   type PQUERYRECORDRECT is access all struct_QUERYRECORDRECT;
   type PSEARCHSTRING is access all struct_SEARCHSTRING;
   type PCNRDRAGINFO is access all struct_CNRDRAGINFO;
   type PNOTIFYRECORDEMPHASIS is access all struct_NOTIFYRECORDEMPHASIS;
   type PNOTIFYRECORDENTER is access all struct_NOTIFYRECORDENTER;
   type PNOTIFYDELTA is access all struct_NOTIFYDELTA;
   type PNOTIFYSCROLL is access all struct_NOTIFYSCROLL;
   type PCNREDITDATA is access all struct_CNREDITDATA;
   type POWNERBACKGROUND is access all struct_OWNERBACKGROUND;
   type PCNRDRAWITEMINFO is access all struct_CNRDRAWITEMINFO;
   type pstruct_OBJCLASS is access all struct_OBJCLASS;
   subtype POBJCLASS is pstruct_OBJCLASS;
   type PSQPOPENDATA is access all struct_SQPOPENDATA;
   type PDRIVPROPS is access all struct_DRIVPROPS;
   type PPRINTERINFO is access all struct_PRINTERINFO;
   type PPRJINFO is access all struct_PRJINFO;
   type PPRJINFO2 is access all struct_PRJINFO2;
   type PPRJINFO3 is access all struct_PRJINFO3;
   type PPRDINFO is access all struct_PRDINFO;
   type PPRDINFO3 is access all struct_PRDINFO3;
   type PPRQINFO is access all struct_PRQINFO;
   type PPRQINFO3 is access all struct_PRQINFO3;
   type PPRQINFO6 is access all struct_PRQINFO6;
   type PPRIDINFO is access all struct_PRIDINFO;
   type PPRDRIVINFO is access all struct_PRDRIVINFO;
   type PPRQPROCINFO is access all struct_PRQPROCINFO;
   type PPRPORTINFO is access all struct_PRPORTINFO;
   type PPRPORTINFO1 is access all struct_PRPORTINFO1;
   type PACVP is access all struct_ACVP;
   type PHELPTABLE is access all struct_HELPTABLE;
   type PHELPINIT is access all struct_HELPINIT;
   type PFOCAMETRICS is access all struct_FOCAMETRICS;
   type PFONTFILEMETRICS is access all struct_FONTFILEMETRICS;
   type PFONTDEFINITIONHEADER is access all struct_FONTDEFINITIONHEADER;
   type PFONTSIGNATURE is access all struct_FONTSIGNATURE;
   type PADDITIONALMETRICS is access all struct_ADDITIONALMETRICS;
   type PFOCAFONT is access all struct_FOCAFONT;

   type PSTR8 is access all STR8;
   type PSTR16 is access all STR16;
   type PSTR32 is access all STR32;
   type PSTR64 is access all STR64;
   type PFN is access function return OS2_signed_int;
   type PPFN is access all PFN;

   type struct_FATTRS is
      record
            usRecordLength : USHORT;
            fsSelection    : USHORT;
            lMatch         : LONG;
            szFacename     : STR8;
            idRegistry     : USHORT;
            usCodePage     : USHORT;
            lMaxBaselineExt: LONG;
            lAveCharWidth  : LONG;
            fsType         : USHORT;
            fsFontUse      : USHORT;
      end record;

    pragma Pack(struct_FATTRS);

   subtype FATTRS is struct_FATTRS;

   type struct_PANOSE is
      record
            bFamilyType     : BYTE;
            bSerifStyle     : BYTE;
            bWeight         : BYTE;
            bProportion     : BYTE;
            bContrast       : BYTE;
            bStrokeVariation: BYTE;
            bArmStyle       : BYTE;
            bLetterform     : BYTE;
            bMidline        : BYTE;
            bXHeight        : BYTE;
            fbPassedISO     : BYTE;
            fbFailedISO     : BYTE;
      end record;

    pragma Pack(struct_PANOSE);

   subtype PANOSE is struct_PANOSE;

   type struct_FONTMETRICS is
      record
            szFamilyname       : STR8;
            szFacename         : STR8;
            idRegistry         : USHORT;
            usCodePage         : USHORT;
            lEmHeight          : LONG;
            lXHeight           : LONG;
            lMaxAscender       : LONG;
            lMaxDescender      : LONG;
            lLowerCaseAscent   : LONG;
            lLowerCaseDescent  : LONG;
            lInternalLeading   : LONG;
            lExternalLeading   : LONG;
            lAveCharWidth      : LONG;
            lMaxCharInc        : LONG;
            lEmInc             : LONG;
            lMaxBaselineExt    : LONG;
            sCharSlope         : SHORT;
            sInlineDir         : SHORT;
            sCharRot           : SHORT;
            usWeightClass      : USHORT;
            usWidthClass       : USHORT;
            sXDeviceRes        : SHORT;
            sYDeviceRes        : SHORT;
            sFirstChar         : SHORT;
            sLastChar          : SHORT;
            sDefaultChar       : SHORT;
            sBreakChar         : SHORT;
            sNominalPointSize  : SHORT;
            sMinimumPointSize  : SHORT;
            sMaximumPointSize  : SHORT;
            fsType             : USHORT;
            fsDefn             : USHORT;
            fsSelection        : USHORT;
            fsCapabilities     : USHORT;
            lSubscriptXSize    : LONG;
            lSubscriptYSize    : LONG;
            lSubscriptXOffset  : LONG;
            lSubscriptYOffset  : LONG;
            lSuperscriptXSize  : LONG;
            lSuperscriptYSize  : LONG;
            lSuperscriptXOffset: LONG;
            lSuperscriptYOffset: LONG;
            lUnderscoreSize    : LONG;
            lUnderscorePosition: LONG;
            lStrikeoutSize     : LONG;
            lStrikeoutPosition : LONG;
            sKerningPairs      : SHORT;
            sFamilyClass       : SHORT;
            lMatch             : LONG;
            FamilyNameAtom     : LONG;
            FaceNameAtom       : LONG;
            panose_panose      : PANOSE;
      end record;

    pragma Pack(struct_FONTMETRICS);

   subtype FONTMETRICS is struct_FONTMETRICS;

   type PFNWP is access function (handle : HWND; mess: ULONG;
                                  parm1: MPARAM; parm2: MPARAM) return MRESULT;

   type struct_POINTL is
      record
            x: LONG;
            y: LONG;
      end record;

    pragma Pack(struct_POINTL);

   subtype POINTL is struct_POINTL;

   type struct_POINTS is
      record
            x: SHORT;
            y: SHORT;
      end record;

    pragma Pack(struct_POINTS);

   subtype POINTS is struct_POINTS;

   type struct_RECTL is
      record
            xLeft  : LONG;
            yBottom: LONG;
            xRight : LONG;
            yTop   : LONG;
      end record;

    pragma Pack(struct_RECTL);

   subtype RECTL is struct_RECTL;

   type struct_QMSG is
      record
            hwnd_hwnd    : HWND;
            msg     : ULONG;
            mp1     : MPARAM;
            mp2     : MPARAM;
            time    : ULONG;
            ptl     : POINTL;
            reserved: ULONG;
      end record;

    pragma Pack(struct_QMSG);

   subtype QMSG is struct_QMSG;

   type struct_COMMANDMSG is
      record
            cmd   : USHORT;
            unused: USHORT;
            source: USHORT;
            fMouse: USHORT;
      end record;

    pragma Pack(struct_COMMANDMSG);

   subtype CMDMSG is struct_COMMANDMSG;

   type struct_MQINFO is
      record
            cb       : ULONG;
            pid_pid  : PID;
            tid_tid  : TID;
            cmsgs    : ULONG;
            pReserved: PVOID;
      end record;

    pragma Pack(struct_MQINFO);

   subtype MQINFO is struct_MQINFO;

   type struct_SWP is
      record
            fl              : ULONG;
            cy              : LONG;
            cx              : LONG;
            y               : LONG;
            x               : LONG;
            hwndInsertBehind: HWND;
            hwnd_hwnd           : HWND;
            ulReserved1     : ULONG;
            ulReserved2     : ULONG;
      end record;

    pragma Pack(struct_SWP);

   subtype SWP is struct_SWP;

   type struct_RGB is
      record
            bBlue : BYTE;
            bGreen: BYTE;
            bRed  : BYTE;
      end record;

    pragma Pack(struct_RGB);

   subtype RGB is struct_RGB;

   type struct_RGB2 is
      record
            bBlue    : BYTE;
            bGreen   : BYTE;
            bRed     : BYTE;
            fcOptions: BYTE;
      end record;

    pragma Pack(struct_RGB2);

   subtype RGB2 is struct_RGB2;

   type struct_BITMAPINFOHEADER is
      record
            cbFix    : ULONG;
            cx       : USHORT;
            cy       : USHORT;
            cPlanes  : USHORT;
            cBitCount: USHORT;
      end record;

    pragma Pack(struct_BITMAPINFOHEADER);

   subtype BITMAPINFOHEADER is struct_BITMAPINFOHEADER;

   type ARRAY_OF_RGB is
      array(integer range <>)
      of RGB;

   type struct_BITMAPINFO is
      record
            cbFix    : ULONG;
            cx       : USHORT;
            cy       : USHORT;
            cPlanes  : USHORT;
            cBitCount: USHORT;
            argbColor: ARRAY_OF_RGB(0..0);
      end record;

    pragma Pack(struct_BITMAPINFO);

   subtype BITMAPINFO is struct_BITMAPINFO;

   type ARRAY_OF_RGB2 is
      array(integer range <>)
      of RGB2;

   type struct_BITMAPINFO2 is
      record
            cbFix          : ULONG;
            cx             : ULONG;
            cy             : ULONG;
            cPlanes        : USHORT;
            cBitCount      : USHORT;
            ulCompression  : ULONG;
            cbImage        : ULONG;
            cxResolution   : ULONG;
            cyResolution   : ULONG;
            cclrUsed       : ULONG;
            cclrImportant  : ULONG;
            usUnits        : USHORT;
            usReserved     : USHORT;
            usRecording    : USHORT;
            usRendering    : USHORT;
            cSize1         : ULONG;
            cSize2         : ULONG;
            ulColorEncoding: ULONG;
            ulIdentifier   : ULONG;
            argbColor      : ARRAY_OF_RGB2(0..0);
      end record;

    pragma Pack(struct_BITMAPINFO2);

   subtype BITMAPINFO2 is struct_BITMAPINFO2;

   type struct_BITMAPINFOHEADER2 is
      record
            cbFix          : ULONG;
            cx             : ULONG;
            cy             : ULONG;
            cPlanes        : USHORT;
            cBitCount      : USHORT;
            ulCompression  : ULONG;
            cbImage        : ULONG;
            cxResolution   : ULONG;
            cyResolution   : ULONG;
            cclrUsed       : ULONG;
            cclrImportant  : ULONG;
            usUnits        : USHORT;
            usReserved     : USHORT;
            usRecording    : USHORT;
            usRendering    : USHORT;
            cSize1         : ULONG;
            cSize2         : ULONG;
            ulColorEncoding: ULONG;
            ulIdentifier   : ULONG;
      end record;

    pragma Pack(struct_BITMAPINFOHEADER2);

   subtype BITMAPINFOHEADER2 is struct_BITMAPINFOHEADER2;

   type struct_BITMAPFILEHEADER is
      record
            usType  : USHORT;
            cbSize  : ULONG;
            xHotspot: SHORT;
            yHotspot: SHORT;
            offBits : ULONG;
            bmp     : BITMAPINFOHEADER;
      end record;

    pragma Pack(struct_BITMAPFILEHEADER);

   subtype BITMAPFILEHEADER is struct_BITMAPFILEHEADER;

   type struct_BITMAPARRAYFILEHEADER is
      record
            usType   : USHORT;
            cbSize   : ULONG;
            offNext  : ULONG;
            cxDisplay: USHORT;
            cyDisplay: USHORT;
            bfh      : BITMAPFILEHEADER;
      end record;

    pragma Pack(struct_BITMAPARRAYFILEHEADER);

   subtype BITMAPARRAYFILEHEADER is struct_BITMAPARRAYFILEHEADER;

   type struct_BITMAPFILEHEADER2 is
      record
            usType  : USHORT;
            cbSize  : ULONG;
            xHotspot: SHORT;
            yHotspot: SHORT;
            offBits : ULONG;
            bmp2    : BITMAPINFOHEADER2;
      end record;

    pragma Pack(struct_BITMAPFILEHEADER2);

   subtype BITMAPFILEHEADER2 is struct_BITMAPFILEHEADER2;

   type struct_BITMAPARRAYFILEHEADER2 is
      record
            usType   : USHORT;
            cbSize   : ULONG;
            offNext  : ULONG;
            cxDisplay: USHORT;
            cyDisplay: USHORT;
            bfh2     : BITMAPFILEHEADER2;
      end record;

    pragma Pack(struct_BITMAPARRAYFILEHEADER2);

   subtype BITMAPARRAYFILEHEADER2 is struct_BITMAPARRAYFILEHEADER2;

   type struct_ICONINFO is
      record
            cb         : ULONG;
            fFormat    : ULONG;
            pszFileName: PSZ;
            hmod       : HMODULE;
            resid      : ULONG;
            cbIconData : ULONG;
            pIconData  : PVOID;
      end record;

    pragma Pack(struct_ICONINFO);

   subtype ICONINFO is struct_ICONINFO;

   type struct_FRAMECDATA is
      record
            cb           : USHORT;
            flCreateFlags: ULONG;
            hmodResources: USHORT;
            idResources  : USHORT;
      end record;

    pragma Pack(struct_FRAMECDATA);

   subtype FRAMECDATA is struct_FRAMECDATA;

   type struct_QVERSDATA is
      record
            environment: USHORT;
            version    : USHORT;
      end record;

    pragma Pack(struct_QVERSDATA);

   subtype QVERSDATA is struct_QVERSDATA;

   type struct_CLASSINFO is
      record
            flClassStyle : ULONG;
            pfnWindowProc: PFNWP;
            cbWindowData : ULONG;
      end record;

    pragma Pack(struct_CLASSINFO);

   subtype CLASSINFO is struct_CLASSINFO;

   type struct_CREATESTRUCT is
      record
            pPresParams     : PVOID;
            pCtlData        : PVOID;
            id              : ULONG;
            hwndInsertBehind: HWND;
            hwndOwner       : HWND;
            cy              : LONG;
            cx              : LONG;
            y               : LONG;
            x               : LONG;
            flStyle         : ULONG;
            pszText         : PSZ;
            pszClass        : PSZ;
            hwndParent      : HWND;
      end record;

    pragma Pack(struct_CREATESTRUCT);

   subtype CREATESTRUCT is struct_CREATESTRUCT;

   type struct_ACCEL is
      record
            fs : USHORT;
            key: USHORT;
            cmd: USHORT;
      end record;

    pragma Pack(struct_ACCEL);

   subtype ACCEL is struct_ACCEL;

   type ARRAY_OF_ACCEL is
      array(integer range <>)
      of ACCEL;

   type struct_ACCELTABLE is
      record
            cAccel  : USHORT;
            codepage: USHORT;
            aaccel  : ARRAY_OF_ACCEL(0..0);
      end record;

    pragma Pack(struct_ACCELTABLE);

   subtype ACCELTABLE is struct_ACCELTABLE;

   type struct_BTNCDATA is
      record
            cb           : USHORT;
            fsCheckState : USHORT;
            fsHiliteState: USHORT;
            hImage       : LHANDLE;
      end record;

    pragma Pack(struct_BTNCDATA);

   subtype BTNCDATA is struct_BTNCDATA;

   type struct_USERBUTTON is
      record
            hwnd_hwnd      : HWND;
            hps_hps       : HPS;
            fsState   : ULONG;
            fsStateOld: ULONG;
      end record;

    pragma Pack(struct_USERBUTTON);

   subtype USERBUTTON is struct_USERBUTTON;

   type struct_CPTEXT is
      record
            idCountry  : USHORT;
            usCodepage : USHORT;
            usLangID   : USHORT;
            usSubLangID: USHORT;
            abText     : ARRAY_OF_BYTE(0..0);
      end record;

    pragma Pack(struct_CPTEXT);

   subtype CPTEXT is struct_CPTEXT;

   type struct_MFP is
      record
            sizeBounds: POINTL;
            sizeMM    : POINTL;
            cbLength  : ULONG;
            mapMode   : USHORT;
            reserved  : USHORT;
            abData    : ARRAY_OF_BYTE(0..0);
      end record;

    pragma Pack(struct_MFP);

   subtype MFP is struct_MFP;

   type struct_CONVCONTEXT is
      record
            cb         : ULONG;
            fsContext  : ULONG;
            idCountry  : ULONG;
            usCodepage : ULONG;
            usLangID   : ULONG;
            usSubLangID: ULONG;
      end record;

    pragma Pack(struct_CONVCONTEXT);

   subtype CONVCONTEXT is struct_CONVCONTEXT;

   type struct_DDEINIT is
      record
            cb            : ULONG;
            pszAppName    : PSZ;
            pszTopic      : PSZ;
            offConvContext: ULONG;
      end record;

    pragma Pack(struct_DDEINIT);

   subtype DDEINIT is struct_DDEINIT;

   type struct_DDESTRUCT is
      record
            cbData       : ULONG;
            fsStatus     : USHORT;
            usFormat     : USHORT;
            offszItemName: USHORT;
            offabData    : USHORT;
      end record;

    pragma Pack(struct_DDESTRUCT);

   subtype DDESTRUCT is struct_DDESTRUCT;

   type struct_CURSORINFO is
      record
            hwnd_hwnd   : HWND;
            x      : LONG;
            y      : LONG;
            cx     : LONG;
            cy     : LONG;
            fs     : ULONG;
            rclClip: RECTL;
      end record;

    pragma Pack(struct_CURSORINFO);

   subtype CURSORINFO is struct_CURSORINFO;

   type struct_DESKTOP is
      record
            cbSize    : ULONG;
            hbm       : HBITMAP;
            x         : LONG;
            y         : LONG;
            fl        : ULONG;
            lTileCount: LONG;
            szFile    : STR8;
      end record;

    pragma Pack(struct_DESKTOP);

   subtype DESKTOP is struct_DESKTOP;

   type struct_DLGTITEM is
      record
            fsItemStatus : USHORT;
            cChildren    : USHORT;
            cchClassName : USHORT;
            offClassName : USHORT;
            cchText      : USHORT;
            offText      : USHORT;
            flStyle      : ULONG;
            x            : SHORT;
            y            : SHORT;
            cx           : SHORT;
            cy           : SHORT;
            id           : USHORT;
            offPresParams: USHORT;
            offCtlData   : USHORT;
      end record;

    pragma Pack(struct_DLGTITEM);

   subtype DLGTITEM is struct_DLGTITEM;

   type ARRAY_OF_DLGTITEM is
      array(integer range <>)
      of DLGTITEM;

   type struct_DLGTEMPLATE is
      record
            cbTemplate      : USHORT;
            c_type          : USHORT;
            codepage        : USHORT;
            offadlgti       : USHORT;
            fsTemplateStatus: USHORT;
            iItemFocus      : USHORT;
            coffPresParams  : USHORT;
            adlgti          : ARRAY_OF_DLGTITEM(0..0);
      end record;

    pragma Pack(struct_DLGTEMPLATE);

   subtype DLGTEMPLATE is struct_DLGTEMPLATE;

   type struct_ENTRYFDATA is
      record
            cb          : USHORT;
            cchEditLimit: USHORT;
            ichMinSel   : USHORT;
            ichMaxSel   : USHORT;
      end record;

    pragma Pack(struct_ENTRYFDATA);

   subtype ENTRYFDATA is struct_ENTRYFDATA;

   type struct_ERRINFO is
      record
            cbFixedErrInfo: ULONG;
            idError       : ERRORID;
            cDetailLevel  : ULONG;
            offaoffszMsg  : ULONG;
            offBinaryData : ULONG;
      end record;

    pragma Pack(struct_ERRINFO);

   subtype ERRINFO is struct_ERRINFO;

   type struct_SMHSTRUCT is
      record
            mp2  : MPARAM;
            mp1  : MPARAM;
            msg  : ULONG;
            hwnd_hwnd : HWND;
            model: ULONG;
      end record;

    pragma Pack(struct_SMHSTRUCT);

   subtype SMHSTRUCT is struct_SMHSTRUCT;

   type struct_CHARMSG is
      record
            fs      : USHORT;
            cRepeat : UCHAR;
            scancode: UCHAR;
            chr     : USHORT;
            vkey    : USHORT;
      end record;

    pragma Pack(struct_CHARMSG);

   subtype CHRMSG is struct_CHARMSG;

   type struct_MOUSEMSG is
      record
            x          : SHORT;
            y          : SHORT;
            codeHitTest: USHORT;
            fsInp      : USHORT;
      end record;

    pragma Pack(struct_MOUSEMSG);

   subtype MSEMSG is struct_MOUSEMSG;

   type struct_MENUITEM is
      record
            iPosition  : SHORT;
            afStyle    : USHORT;
            afAttribute: USHORT;
            id         : USHORT;
            hwndSubMenu: HWND;
            hItem      : ULONG;
      end record;

    pragma Pack(struct_MENUITEM);

   subtype MENUITEM is struct_MENUITEM;

   type struct_mti is
      record
            afStyle: USHORT;
            pad    : USHORT;
            idItem : USHORT;
            c      : STR8;
      end record;

    pragma Pack(struct_mti);

   subtype MTI is struct_mti;

   type ARRAY_OF_MTI is
      array(integer range <>)
      of MTI;

   type struct_mt is
      record
            len     : ULONG;
            codepage: USHORT;
            reserved: USHORT;
            cMti    : USHORT;
            rgMti   : ARRAY_OF_MTI(0..0);
      end record;

    pragma Pack(struct_mt);

   subtype MT is struct_mt;

   type struct_OWNERITEM is
      record
            hwnd_hwnd         : HWND;
            hps_hps          : HPS;
            fsState       : ULONG;
            fsAttribute   : ULONG;
            fsStateOld    : ULONG;
            fsAttributeOld: ULONG;
            rclItem       : RECTL;
            idItem        : LONG;
            hItem         : ULONG;
      end record;

    pragma Pack(struct_OWNERITEM);

   subtype OWNERITEM is struct_OWNERITEM;

   type struct_WNDPARAMS is
      record
            fsStatus    : ULONG;
            cchText     : ULONG;
            pszText     : PSZ;
            cbPresParams: ULONG;
            pPresParams : PVOID;
            cbCtlData   : ULONG;
            pCtlData    : PVOID;
      end record;

    pragma Pack(struct_WNDPARAMS);

   subtype WNDPARAMS is struct_WNDPARAMS;

   type struct_POINTERINFO is
      record
            fPointer      : ULONG;
            xHotspot      : LONG;
            yHotspot      : LONG;
            hbmPointer    : HBITMAP;
            hbmColor      : HBITMAP;
            hbmMiniPointer: HBITMAP;
            hbmMiniColor  : HBITMAP;
      end record;

    pragma Pack(struct_POINTERINFO);

   subtype POINTERINFO is struct_POINTERINFO;

   type struct_SBCDATA is
      record
            cb      : USHORT;
            sHilite : USHORT;
            posFirst: SHORT;
            posLast : SHORT;
            posThumb: SHORT;
            cVisible: SHORT;
            cTotal  : SHORT;
      end record;

    pragma Pack(struct_SBCDATA);

   subtype SBCDATA is struct_SBCDATA;

   type struct_PARAM is
      record
            id: ULONG;
            cb: ULONG;
            ab: ARRAY_OF_BYTE(0..0);
      end record;

    pragma Pack(struct_PARAM);

   subtype PARAM is struct_PARAM;

   type ARRAY_OF_PARAM is
      array(integer range <>)
      of PARAM;

   type struct_PRESPARAMS is
      record
            cb    : ULONG;
            aparam: ARRAY_OF_PARAM(0..0);
      end record;

    pragma Pack(struct_PRESPARAMS);

   subtype PRESPARAMS is struct_PRESPARAMS;

   type struct_TRACKINFO is
      record
            cxBorder       : LONG;
            cyBorder       : LONG;
            cxGrid         : LONG;
            cyGrid         : LONG;
            cxKeyboard     : LONG;
            cyKeyboard     : LONG;
            rclTrack       : RECTL;
            rclBoundary    : RECTL;
            ptlMinTrackSize: POINTL;
            ptlMaxTrackSize: POINTL;
            fs             : ULONG;
      end record;

    pragma Pack(struct_TRACKINFO);

   subtype TRACKINFO is struct_TRACKINFO;

   type struct_FORMATRECT is
      record
            cxFormat: LONG;
            cyFormat: LONG;
      end record;

    pragma Pack(struct_FORMATRECT);

   subtype MLEFORMATRECT is struct_FORMATRECT;

   type struct_MLECTLDATA is
      record
            cbCtlData    : USHORT;
            afIEFormat   : USHORT;
            cchText      : ULONG;
            iptAnchor    : IPT;
            iptCursor    : IPT;
            cxFormat     : LONG;
            cyFormat     : LONG;
            afFormatFlags: ULONG;
      end record;

    pragma Pack(struct_MLECTLDATA);

   subtype MLECTLDATA is struct_MLECTLDATA;

   type struct_MLEOVERFLOW is
      record
            afErrInd   : ULONG;
            nBytesOver : LONG;
            pixHorzOver: LONG;
            pixVertOver: LONG;
      end record;

    pragma Pack(struct_MLEOVERFLOW);

   subtype MLEOVERFLOW is struct_MLEOVERFLOW;

   type struct_MLEMARGSTRUCT is
      record
            afMargins: USHORT;
            usMouMsg : USHORT;
            iptNear  : IPT;
      end record;

    pragma Pack(struct_MLEMARGSTRUCT);

   subtype MLEMARGSTRUCT is struct_MLEMARGSTRUCT;

   type struct_SEARCH is
      record
            cb        : USHORT;
            pchFind   : PCHAR;
            pchReplace: PCHAR;
            cchFind   : SHORT;
            cchReplace: SHORT;
            iptStart  : IPT;
            iptStop   : IPT;
            cchFound  : USHORT;
      end record;

    pragma Pack(struct_SEARCH);

   subtype MLE_SEARCHDATA is struct_SEARCH;

   type struct_SIZEL is
      record
            cx: LONG;
            cy: LONG;
      end record;

    pragma Pack(struct_SIZEL);

   subtype SIZEL is struct_SIZEL;

   type struct_RGNRECT is
      record
            ircStart   : ULONG;
            crc        : ULONG;
            crcReturned: ULONG;
            ulDirection: ULONG;
      end record;

    pragma Pack(struct_RGNRECT);

   subtype RGNRECT is struct_RGNRECT;

   type struct_MATRIXLF is
      record
            fxM11: FIXED;
            fxM12: FIXED;
            lM13 : LONG;
            fxM21: FIXED;
            fxM22: FIXED;
            lM23 : LONG;
            lM31 : LONG;
            lM32 : LONG;
            lM33 : LONG;
      end record;

    pragma Pack(struct_MATRIXLF);

   subtype MATRIXLF is struct_MATRIXLF;

   type struct_ARCPARAMS is
      record
            lP: LONG;
            lQ: LONG;
            lR: LONG;
            lS: LONG;
      end record;

    pragma Pack(struct_ARCPARAMS);

   subtype ARCPARAMS is struct_ARCPARAMS;

   type struct_SIZEF is
      record
            cx: FIXED;
            cy: FIXED;
      end record;

    pragma Pack(struct_SIZEF);

   subtype SIZEF is struct_SIZEF;

   type struct_POLYGON is
      record
            ulPoints: ULONG;
            aPointl : PPOINTL;
      end record;

    pragma Pack(struct_POLYGON);

   subtype POLYGON is struct_POLYGON;

   type ARRAY_OF_POLYGON is
      array(integer range <>)
      of POLYGON;

   type struct_POLYSET is
      record
            ulPolys : ULONG;
            aPolygon: ARRAY_OF_POLYGON(0..0);
      end record;

    pragma Pack(struct_POLYSET);

   subtype POLYSET is struct_POLYSET;

   type struct_GRADIENTL is
      record
            x: LONG;
            y: LONG;
      end record;

    pragma Pack(struct_GRADIENTL);

   subtype GRADIENTL is struct_GRADIENTL;

   type struct_KERNINGPAIRS is
      record
            sFirstChar    : SHORT;
            sSecondChar   : SHORT;
            lKerningAmount: LONG;
      end record;

    pragma Pack(struct_KERNINGPAIRS);

   subtype KERNINGPAIRS is struct_KERNINGPAIRS;

   type struct_FACENAMEDESC is
      record
            usSize       : USHORT;
            usWeightClass: USHORT;
            usWidthClass : USHORT;
            usReserved   : USHORT;
            flOptions    : ULONG;
      end record;

    pragma Pack(struct_FACENAMEDESC);

   subtype FACENAMEDESC is struct_FACENAMEDESC;

   type MATRIX_OF_CHAR is
      array(integer range 0..31)
      of STR8;

   type FFDESCS is
      array(integer range 0..31)
      of STR8;

   type PFFDESCS is access all FFDESCS;

   type struct_FFDESCS2 is
      record
            cbLength        : ULONG;
            cbFacenameOffset: ULONG;
            abFamilyName    : ARRAY_OF_BYTE(0..0);
      end record;

    pragma Pack(struct_FFDESCS2);

   subtype FFDESCS2 is struct_FFDESCS2;

   type struct_LINEBUNDLE is
      record
            lColor       : LONG;
            lBackColor   : LONG;
            usMixMode    : USHORT;
            usBackMixMode: USHORT;
            fxWidth      : FIXED;
            lGeomWidth   : LONG;
            usType       : USHORT;
            usEnd        : USHORT;
            usJoin       : USHORT;
            usReserved   : USHORT;
      end record;

    pragma Pack(struct_LINEBUNDLE);

   subtype LINEBUNDLE is struct_LINEBUNDLE;

   type struct_CHARBUNDLE is
      record
            lColor       : LONG;
            lBackColor   : LONG;
            usMixMode    : USHORT;
            usBackMixMode: USHORT;
            usSet        : USHORT;
            usPrecision  : USHORT;
            sizfxCell    : SIZEF;
            ptlAngle     : POINTL;
            ptlShear     : POINTL;
            usDirection  : USHORT;
            usTextAlign  : USHORT;
            fxExtra      : FIXED;
            fxBreakExtra : FIXED;
      end record;

    pragma Pack(struct_CHARBUNDLE);

   subtype CHARBUNDLE is struct_CHARBUNDLE;

   type struct_MARKERBUNDLE is
      record
            lColor       : LONG;
            lBackColor   : LONG;
            usMixMode    : USHORT;
            usBackMixMode: USHORT;
            usSet        : USHORT;
            usSymbol     : USHORT;
            sizfxCell    : SIZEF;
      end record;

    pragma Pack(struct_MARKERBUNDLE);

   subtype MARKERBUNDLE is struct_MARKERBUNDLE;

   type struct_AREABUNDLE is
      record
            lColor       : LONG;
            lBackColor   : LONG;
            usMixMode    : USHORT;
            usBackMixMode: USHORT;
            usSet        : USHORT;
            usSymbol     : USHORT;
            ptlRefPoint  : POINTL;
      end record;

    pragma Pack(struct_AREABUNDLE);

   subtype AREABUNDLE is struct_AREABUNDLE;

   type struct_IMAGEBUNDLE is
      record
            lColor       : LONG;
            lBackColor   : LONG;
            usMixMode    : USHORT;
            usBackMixMode: USHORT;
      end record;

    pragma Pack(struct_IMAGEBUNDLE);

   subtype IMAGEBUNDLE is struct_IMAGEBUNDLE;


   type struct_DRIVDATA is
      record
            cb           : LONG;
            lVersion     : LONG;
            szDeviceName : STR8;
            abGeneralData: STR8;
      end record;

    pragma Pack(struct_DRIVDATA);

   subtype DRIVDATA is struct_DRIVDATA;

   type struct_DEVOPENSTRUC is
      record
            pszLogAddress     : PSZ;
            pszDriverName     : PSZ;
            pdriv             : PDRIVDATA;
            pszDataType       : PSZ;
            pszComment        : PSZ;
            pszQueueProcName  : PSZ;
            pszQueueProcParams: PSZ;
            pszSpoolerParams  : PSZ;
            pszNetworkParams  : PSZ;
      end record;

    pragma Pack(struct_DEVOPENSTRUC);

   subtype DEVOPENSTRUC is struct_DEVOPENSTRUC;

   type struct_ESCMODE is
      record
            mode    : ULONG;
            modedata: ARRAY_OF_BYTE(0..0);
      end record;

    pragma Pack(struct_ESCMODE);

   subtype ESCMODE is struct_ESCMODE;

   type struct_VIOSIZECOUNT is
      record
            maxcount: LONG;
            count   : LONG;
      end record;

    pragma Pack(struct_VIOSIZECOUNT);

   subtype VIOSIZECOUNT is struct_VIOSIZECOUNT;

   type struct_VIOFONTCELLSIZE is
      record
            cx: LONG;
            cy: LONG;
      end record;

    pragma Pack(struct_VIOFONTCELLSIZE);

   subtype VIOFONTCELLSIZE is struct_VIOFONTCELLSIZE;

   type struct_SFACTORS is
      record
            x: LONG;
            y: LONG;
      end record;

    pragma Pack(struct_SFACTORS);

   subtype SFACTORS is struct_SFACTORS;

   type struct_BANDRECT is
      record
            xleft  : LONG;
            ybottom: LONG;
            xright : LONG;
            ytop   : LONG;
      end record;

    pragma Pack(struct_BANDRECT);

   subtype BANDRECT is struct_BANDRECT;

   type struct_HCINFO is
      record
            szFormname  : STR8;
            cx          : LONG;
            cy          : LONG;
            xLeftClip   : LONG;
            yBottomClip : LONG;
            xRightClip  : LONG;
            yTopClip    : LONG;
            xPels       : LONG;
            yPels       : LONG;
            flAttributes: LONG;
      end record;

    pragma Pack(struct_HCINFO);

   subtype HCINFO is struct_HCINFO;

   type struct_PRFPROFILE is
      record
            cchUserName: ULONG;
            pszUserName: PSZ;
            cchSysName : ULONG;
            pszSysName : PSZ;
      end record;

    pragma Pack(struct_PRFPROFILE);

   subtype PRFPROFILE is struct_PRFPROFILE;

   type struct_HPROGARRAY is
      record
            ahprog: ARRAY_OF_HPROGRAM(0..0);
      end record;

    pragma Pack(struct_HPROGARRAY);

   subtype HPROGARRAY is struct_HPROGARRAY;

   type struct_PROGTYPE is
      record
            progc    : PROGCATEGORY;
            fbVisible: ULONG;
      end record;

    pragma Pack(struct_PROGTYPE);

   subtype PROGTYPE is struct_PROGTYPE;

   type struct_PROGTITLE is
      record
            hprog   : HPROGRAM;
            progt   : PROGTYPE;
            pszTitle: PSZ;
      end record;

    pragma Pack(struct_PROGTITLE);

   subtype PROGTITLE is struct_PROGTITLE;

   type struct_PROGDETAILS is
      record
            Length        : ULONG;
            progt         : PROGTYPE;
            pszTitle      : PSZ;
            pszExecutable : PSZ;
            pszParameters : PSZ;
            pszStartupDir : PSZ;
            pszIcon       : PSZ;
            pszEnvironment: PSZ;
            swpInitial    : SWP;
      end record;

    pragma Pack(struct_PROGDETAILS);

   subtype PROGDETAILS is struct_PROGDETAILS;

   type struct_SWCNTRL is
      record
            hwnd_hwnd        : HWND;
            hwndIcon     : HWND;
            hprog        : HPROGRAM;
            idProcess    : PID;
            idSession    : ULONG;
            uchVisibility: ULONG;
            fbJump       : ULONG;
            szSwtitle    : STR8;
            bProgType    : ULONG;
      end record;

    pragma Pack(struct_SWCNTRL);

   subtype SWCNTRL is struct_SWCNTRL;

   type struct_SWENTRY is
      record
            hswitch_hswitch: HSWITCH;
            swctl  : SWCNTRL;
      end record;

    pragma Pack(struct_SWENTRY);

   subtype SWENTRY is struct_SWENTRY;

   type ARRAY_OF_SWENTRY is
      array(integer range <>)
      of SWENTRY;

   type struct_SWBLOCK is
      record
            cswentry: ULONG;
            aswentry: ARRAY_OF_SWENTRY(0..0);
      end record;

    pragma Pack(struct_SWBLOCK);

   subtype SWBLOCK is struct_SWBLOCK;

   type ARRAY_OF_PSZ is
      array(integer range 0..0)
      of PSZ;

   type APSZ is
      array(integer range 0..0)
      of PSZ;

   type PAPSZ is access all APSZ;

   type struct_FILEDLG is
      record
            cbSize         : ULONG;
            fl             : ULONG;
            ulUser         : ULONG;
            lReturn        : LONG;
            lSRC           : LONG;
            pszTitle       : PSZ;
            pszOKButton    : PSZ;
            pfnDlgProc     : PFNWP;
            pszIType       : PSZ;
            papszITypeList : PAPSZ;
            pszIDrive      : PSZ;
            papszIDriveList: PAPSZ;
            hMod           : HMODULE;
            szFullFile     : STR8;
            papszFQFilename: PAPSZ;
            ulFQFCount     : ULONG;
            usDlgId        : USHORT;
            x              : SHORT;
            y              : SHORT;
            sEAType        : SHORT;
      end record;

    pragma Pack(struct_FILEDLG);

   subtype FILEDLG is struct_FILEDLG;

   type struct_FONTDLG is
      record
            cbSize           : ULONG;
            hpsScreen        : HPS;
            hpsPrinter       : HPS;
            pszTitle         : PSZ;
            pszPreview       : PSZ;
            pszPtSizeList    : PSZ;
            pfnDlgProc       : PFNWP;
            pszFamilyname    : PSZ;
            fxPointSize      : FIXED;
            fl               : ULONG;
            flFlags          : ULONG;
            flType           : ULONG;
            flTypeMask       : ULONG;
            flStyle          : ULONG;
            flStyleMask      : ULONG;
            clrFore          : LONG;
            clrBack          : LONG;
            ulUser           : ULONG;
            lReturn          : LONG;
            lSRC             : LONG;
            lEmHeight        : LONG;
            lXHeight         : LONG;
            lExternalLeading : LONG;
            hMod             : HMODULE;
            fAttrs_fAttrs    : FATTRS;
            sNominalPointSize: SHORT;
            usWeight         : USHORT;
            usWidth          : USHORT;
            x                : SHORT;
            y                : SHORT;
            usDlgId          : USHORT;
            usFamilyBufLen   : USHORT;
            usReserved       : USHORT;
      end record;

    pragma Pack(struct_FONTDLG);

   subtype FONTDLG is struct_FONTDLG;

   type struct_STYLECHANGE is
      record
            usWeight      : USHORT;
            usWeightOld   : USHORT;
            usWidth       : USHORT;
            usWidthOld    : USHORT;
            flType        : ULONG;
            flTypeOld     : ULONG;
            flTypeMask    : ULONG;
            flTypeMaskOld : ULONG;
            flStyle       : ULONG;
            flStyleOld    : ULONG;
            flStyleMask   : ULONG;
            flStyleMaskOld: ULONG;
      end record;

    pragma Pack(struct_STYLECHANGE);

   subtype STYLECHANGE is struct_STYLECHANGE;

   type struct_SLDCDATA is
      record
            cbSize            : ULONG;
            usScale1Increments: USHORT;
            usScale1Spacing   : USHORT;
            usScale2Increments: USHORT;
            usScale2Spacing   : USHORT;
      end record;

    pragma Pack(struct_SLDCDATA);

   subtype SLDCDATA is struct_SLDCDATA;

   type struct_BOOKTEXT is
      record
            pString: PSZ;
            textLen: ULONG;
      end record;

    pragma Pack(struct_BOOKTEXT);

   subtype BOOKTEXT is struct_BOOKTEXT;

   type struct_DELETENOTIFY is
      record
            hwndBook     : HWND;
            hwndPage     : HWND;
            ulAppPageData: ULONG;
            hbmTab       : HBITMAP;
      end record;

    pragma Pack(struct_DELETENOTIFY);

   subtype DELETENOTIFY is struct_DELETENOTIFY;

   type struct_PAGESELECTNOTIFY is
      record
            hwndBook   : HWND;
            ulPageIdCur: ULONG;
            ulPageIdNew: ULONG;
      end record;

    pragma Pack(struct_PAGESELECTNOTIFY);

   subtype PAGESELECTNOTIFY is struct_PAGESELECTNOTIFY;

   type struct_DRAGIMAGE is
      record
            cb         : USHORT;
            cptl       : USHORT;
            hImage     : LHANDLE;
            sizlStretch: SIZEL;
            fl         : ULONG;
            cxOffset   : SHORT;
            cyOffset   : SHORT;
      end record;

    pragma Pack(struct_DRAGIMAGE);

   subtype DRAGIMAGE is struct_DRAGIMAGE;

   type struct_DRAGINFO is
      record
            cbDraginfo : ULONG;
            cbDragitem : USHORT;
            usOperation: USHORT;
            hwndSource : HWND;
            xDrop      : SHORT;
            yDrop      : SHORT;
            cditem     : USHORT;
            usReserved : USHORT;
      end record;

    pragma Pack(struct_DRAGINFO);

   subtype DRAGINFO is struct_DRAGINFO;

   type struct_DRAGITEM is
      record
            hwndItem         : HWND;
            ulItemID         : ULONG;
            hstrType         : HSTR;
            hstrRMF          : HSTR;
            hstrContainerName: HSTR;
            hstrSourceName   : HSTR;
            hstrTargetName   : HSTR;
            cxOffset         : SHORT;
            cyOffset         : SHORT;
            fsControl        : USHORT;
            fsSupportedOps   : USHORT;
      end record;

    pragma Pack(struct_DRAGITEM);

   subtype DRAGITEM is struct_DRAGITEM;

   type struct_DRAGTRANSFER is
      record
            cb              : ULONG;
            hwndClient      : HWND;
            pditem          : PDRAGITEM;
            hstrSelectedRMF : HSTR;
            hstrRenderToName: HSTR;
            ulTargetInfo    : ULONG;
            usOperation     : USHORT;
            fsReply         : USHORT;
      end record;

    pragma Pack(struct_DRAGTRANSFER);

   subtype DRAGTRANSFER is struct_DRAGTRANSFER;

   type struct_RENDERFILE is
      record
            hwndDragFiles: HWND;
            hstrSource   : HSTR;
            hstrTarget   : HSTR;
            fMove        : USHORT;
            usRsvd       : USHORT;
      end record;

    pragma Pack(struct_RENDERFILE);

   subtype RENDERFILE is struct_RENDERFILE;

   type struct_VSCDATA is
      record
            cbSize       : ULONG;
            usRowCount   : USHORT;
            usColumnCount: USHORT;
      end record;

    pragma Pack(struct_VSCDATA);

   subtype VSCDATA is struct_VSCDATA;

   type struct_VSDRAGINIT is
      record
            hwnd_hwnd   : HWND;
            x       : LONG;
            y       : LONG;
            cx      : LONG;
            cy      : LONG;
            usRow   : USHORT;
            usColumn: USHORT;
      end record;

    pragma Pack(struct_VSDRAGINIT);

   subtype VSDRAGINIT is struct_VSDRAGINIT;

   type struct_VSDRAGINFO is
      record
            pDragInfo_pDragInfo: PDRAGINFO;
            usRow    : USHORT;
            usColumn : USHORT;
      end record;

    pragma Pack(struct_VSDRAGINFO);

   subtype VSDRAGINFO is struct_VSDRAGINFO;

   type struct_VSTEXT is
      record
            pszItemText: PSZ;
            ulBufLen   : ULONG;
      end record;

    pragma Pack(struct_VSTEXT);

   subtype VSTEXT is struct_VSTEXT;

   type struct_TREEITEMDESC is
      record
            hbmExpanded  : HBITMAP;
            hbmCollapsed : HBITMAP;
            hptrExpanded : HPOINTER;
            hptrCollapsed: HPOINTER;
      end record;

    pragma Pack(struct_TREEITEMDESC);

   subtype TREEITEMDESC is struct_TREEITEMDESC;

   type struct_FIELDINFO is
      record
            cb            : ULONG;
            flData        : ULONG;
            flTitle       : ULONG;
            pTitleData    : PVOID;
            offStruct     : ULONG;
            pUserData     : PVOID;
            pNextFieldInfo: pstruct_FIELDINFO;
            cxWidth       : ULONG;
      end record;

    pragma Pack(struct_FIELDINFO);

   subtype FIELDINFO is struct_FIELDINFO;

   type struct_RECORDCORE is
      record
            cb             : ULONG;
            flRecordAttr   : ULONG;
            ptlIcon        : POINTL;
            preccNextRecord: pstruct_RECORDCORE;
            pszIcon        : PSZ;
            hptrIcon       : HPOINTER;
            hptrMiniIcon   : HPOINTER;
            hbmBitmap      : HBITMAP;
            hbmMiniBitmap  : HBITMAP;
            ptid_pTreeItemDesc  : PTREEITEMDESC;
            pszText        : PSZ;
            pszName        : PSZ;
            pszTree        : PSZ;
      end record;

    pragma Pack(struct_RECORDCORE);

   subtype RECORDCORE is struct_RECORDCORE;

   type struct_MINIRECORDCORE is
      record
            cb             : ULONG;
            flRecordAttr   : ULONG;
            ptlIcon        : POINTL;
            preccNextRecord: pstruct_MINIRECORDCORE;
            pszIcon        : PSZ;
            hptrIcon       : HPOINTER;
      end record;

    pragma Pack(struct_MINIRECORDCORE);

   subtype MINIRECORDCORE is struct_MINIRECORDCORE;

   type struct_CNRINFO is
      record
            cb                : ULONG;
            pSortRecord       : PVOID;
            pFieldInfoLast    : PFIELDINFO;
            pFieldInfoObject  : PFIELDINFO;
            pszCnrTitle       : PSZ;
            flWindowAttr      : ULONG;
            ptlOrigin         : POINTL;
            cDelta            : ULONG;
            cRecords          : ULONG;
            slBitmapOrIcon    : SIZEL;
            slTreeBitmapOrIcon: SIZEL;
            hbmExpanded       : HBITMAP;
            hbmCollapsed      : HBITMAP;
            hptrExpanded      : HPOINTER;
            hptrCollapsed     : HPOINTER;
            cyLineSpacing     : LONG;
            cxTreeIndent      : LONG;
            cxTreeLine        : LONG;
            cFields           : ULONG;
            xVertSplitbar     : LONG;
      end record;

    pragma Pack(struct_CNRINFO);

   subtype CNRINFO is struct_CNRINFO;

   type struct_CDATE is
      record
            day  : UCHAR;
            month: UCHAR;
            year : USHORT;
      end record;

    pragma Pack(struct_CDATE);

   subtype CDATE is struct_CDATE;

   type struct_CTIME is
      record
            hours     : UCHAR;
            minutes   : UCHAR;
            seconds   : UCHAR;
            ucReserved: UCHAR;
      end record;

    pragma Pack(struct_CTIME);

   subtype CTIME is struct_CTIME;

   type struct_CNRDRAGINIT is
      record
            hwndCnr: HWND;
            pRecord: PRECORDCORE;
            x      : LONG;
            y      : LONG;
            cx     : LONG;
            cy     : LONG;
      end record;

    pragma Pack(struct_CNRDRAGINIT);

   subtype CNRDRAGINIT is struct_CNRDRAGINIT;

   type struct_FIELDINFOINSERT is
      record
            cb                  : ULONG;
            pFieldInfoOrder     : PFIELDINFO;
            fInvalidateFieldInfo: ULONG;
            cFieldInfoInsert    : ULONG;
      end record;

    pragma Pack(struct_FIELDINFOINSERT);

   subtype FIELDINFOINSERT is struct_FIELDINFOINSERT;

   type struct_RECORDINSERT is
      record
            cb               : ULONG;
            pRecordOrder     : PRECORDCORE;
            pRecordParent    : PRECORDCORE;
            fInvalidateRecord: ULONG;
            zOrder           : ULONG;
            cRecordsInsert   : ULONG;
      end record;

    pragma Pack(struct_RECORDINSERT);

   subtype RECORDINSERT is struct_RECORDINSERT;

   type struct_QUERYRECFROMRECT is
      record
            cb      : ULONG;
            rect    : RECTL;
            fsSearch: ULONG;
      end record;

    pragma Pack(struct_QUERYRECFROMRECT);

   subtype QUERYRECFROMRECT is struct_QUERYRECFROMRECT;

   type struct_QUERYRECORDRECT is
      record
            cb               : ULONG;
            pRecord          : PRECORDCORE;
            fRightSplitWindow: ULONG;
            fsExtent         : ULONG;
      end record;

    pragma Pack(struct_QUERYRECORDRECT);

   subtype QUERYRECORDRECT is struct_QUERYRECORDRECT;

   type struct_SEARCHSTRING is
      record
            cb             : ULONG;
            pszSearch      : PSZ;
            fsPrefix       : ULONG;
            fsCaseSensitive: ULONG;
            usView         : ULONG;
      end record;

    pragma Pack(struct_SEARCHSTRING);

   subtype SEARCHSTRING is struct_SEARCHSTRING;

   type struct_CNRDRAGINFO is
      record
            pDragInfo_pDragInfo: PDRAGINFO;
            pRecord  : PRECORDCORE;
      end record;

    pragma Pack(struct_CNRDRAGINFO);

   subtype CNRDRAGINFO is struct_CNRDRAGINFO;

   type struct_NOTIFYRECORDEMPHASIS is
      record
            hwndCnr      : HWND;
            pRecord      : PRECORDCORE;
            fEmphasisMask: ULONG;
      end record;

    pragma Pack(struct_NOTIFYRECORDEMPHASIS);

   subtype NOTIFYRECORDEMPHASIS is struct_NOTIFYRECORDEMPHASIS;

   type struct_NOTIFYRECORDENTER is
      record
            hwndCnr: HWND;
            fKey   : ULONG;
            pRecord: PRECORDCORE;
      end record;

    pragma Pack(struct_NOTIFYRECORDENTER);

   subtype NOTIFYRECORDENTER is struct_NOTIFYRECORDENTER;

   type struct_NOTIFYDELTA is
      record
            hwndCnr: HWND;
            fDelta : ULONG;
      end record;

    pragma Pack(struct_NOTIFYDELTA);

   subtype NOTIFYDELTA is struct_NOTIFYDELTA;

   type struct_NOTIFYSCROLL is
      record
            hwndCnr   : HWND;
            lScrollInc: LONG;
            fScroll   : ULONG;
      end record;

    pragma Pack(struct_NOTIFYSCROLL);

   subtype NOTIFYSCROLL is struct_NOTIFYSCROLL;

   type struct_CNREDITDATA is
      record
            cb        : ULONG;
            hwndCnr   : HWND;
            pRecord   : PRECORDCORE;
            pFieldInfo_pFieldInfo: PFIELDINFO;
            ppszText  : PPSZ;
            cbText    : ULONG;
            id        : ULONG;
      end record;

    pragma Pack(struct_CNREDITDATA);

   subtype CNREDITDATA is struct_CNREDITDATA;

   type struct_OWNERBACKGROUND is
      record
            hwnd_hwnd        : HWND;
            hps_hps         : HPS;
            rclBackground: RECTL;
            idWindow     : LONG;
      end record;

    pragma Pack(struct_OWNERBACKGROUND);

   subtype OWNERBACKGROUND is struct_OWNERBACKGROUND;

   type struct_CNRDRAWITEMINFO is
      record
            pRecord   : PRECORDCORE;
            pFieldInfo_pFieldInfo: PFIELDINFO;
      end record;

    pragma Pack(struct_CNRDRAWITEMINFO);

   subtype CNRDRAWITEMINFO is struct_CNRDRAWITEMINFO;

   type struct_OBJCLASS is
      record
            pNext       : pstruct_OBJCLASS;
            pszClassName: PSZ;
            pszModName  : PSZ;
      end record;

    pragma Pack(struct_OBJCLASS);

   subtype OBJCLASS is struct_OBJCLASS;

   type struct_SQPOPENDATA is
      record
            pszLogAddress   : PSZ;
            pszDriverName   : PSZ;
            pdriv           : PDRIVDATA;
            pszDataType     : PSZ;
            pszComment      : PSZ;
            pszProcParams   : PSZ;
            pszSpoolParams  : PSZ;
            pszNetworkParams: PSZ;
            pszDocName      : PSZ;
            pszQueueName    : PSZ;
            pszToken        : PSZ;
            idJobId         : USHORT;
      end record;

    pragma Pack(struct_SQPOPENDATA);

   subtype SQPOPENDATA is struct_SQPOPENDATA;

   type struct_DRIVPROPS is
      record
            pszKeyName: PSZ;
            cbBuf     : ULONG;
            pBuf      : PVOID;
      end record;

    pragma Pack(struct_DRIVPROPS);

   subtype DRIVPROPS is struct_DRIVPROPS;

   type struct_PRINTERINFO is
      record
            flType                 : ULONG;
            pszComputerName        : PSZ;
            pszPrintDestinationName: PSZ;
            pszDescription         : PSZ;
            pszLocalName           : PSZ;
      end record;

    pragma Pack(struct_PRINTERINFO);

   subtype PRINTERINFO is struct_PRINTERINFO;

   type struct_PRJINFO is
      record
            uJobId      : USHORT;
            szUserName  : STR8;
            pad_1       : CHAR;
            szNotifyName: STR8;
            szDataType  : STR8;
            pszParms    : PSZ;
            uPosition   : USHORT;
            fsStatus    : USHORT;
            pszStatus   : PSZ;
            ulSubmitted : ULONG;
            ulSize      : ULONG;
            pszComment  : PSZ;
      end record;

    pragma Pack(struct_PRJINFO);

   subtype PRJINFO is struct_PRJINFO;

   type struct_PRJINFO2 is
      record
            uJobId     : USHORT;
            uPriority  : USHORT;
            pszUserName: PSZ;
            uPosition  : USHORT;
            fsStatus   : USHORT;
            ulSubmitted: ULONG;
            ulSize     : ULONG;
            pszComment : PSZ;
            pszDocument: PSZ;
      end record;

    pragma Pack(struct_PRJINFO2);

   subtype PRJINFO2 is struct_PRJINFO2;

   type struct_PRJINFO3 is
      record
            uJobId        : USHORT;
            uPriority     : USHORT;
            pszUserName   : PSZ;
            uPosition     : USHORT;
            fsStatus      : USHORT;
            ulSubmitted   : ULONG;
            ulSize        : ULONG;
            pszComment    : PSZ;
            pszDocument   : PSZ;
            pszNotifyName : PSZ;
            pszDataType   : PSZ;
            pszParms      : PSZ;
            pszStatus     : PSZ;
            pszQueue      : PSZ;
            pszQProcName  : PSZ;
            pszQProcParms : PSZ;
            pszDriverName : PSZ;
            pDriverData   : PDRIVDATA;
            pszPrinterName: PSZ;
      end record;

    pragma Pack(struct_PRJINFO3);

   subtype PRJINFO3 is struct_PRJINFO3;

   type struct_PRDINFO is
      record
            szName    : STR8;
            szUserName: STR8;
            uJobId    : USHORT;
            fsStatus  : USHORT;
            pszStatus : PSZ;
            time      : USHORT;
      end record;

    pragma Pack(struct_PRDINFO);

   subtype PRDINFO is struct_PRDINFO;

   type struct_PRDINFO3 is
      record
            pszPrinterName: PSZ;
            pszUserName   : PSZ;
            pszLogAddr    : PSZ;
            uJobId        : USHORT;
            fsStatus      : USHORT;
            pszStatus     : PSZ;
            pszComment    : PSZ;
            pszDrivers    : PSZ;
            time          : USHORT;
            usTimeOut     : USHORT;
      end record;

    pragma Pack(struct_PRDINFO3);

   subtype PRDINFO3 is struct_PRDINFO3;

   type struct_PRQINFO is
      record
            szName         : STR8;
            pad_1          : CHAR;
            uPriority      : USHORT;
            uStartTime     : USHORT;
            uUntilTime     : USHORT;
            pszSepFile     : PSZ;
            pszPrProc      : PSZ;
            pszDestinations: PSZ;
            pszParms       : PSZ;
            pszComment     : PSZ;
            fsStatus       : USHORT;
            cJobs          : USHORT;
      end record;

    pragma Pack(struct_PRQINFO);

   subtype PRQINFO is struct_PRQINFO;

   type struct_PRQINFO3 is
      record
            pszName      : PSZ;
            uPriority    : USHORT;
            uStartTime   : USHORT;
            uUntilTime   : USHORT;
            fsType       : USHORT;
            pszSepFile   : PSZ;
            pszPrProc    : PSZ;
            pszParms     : PSZ;
            pszComment   : PSZ;
            fsStatus     : USHORT;
            cJobs        : USHORT;
            pszPrinters  : PSZ;
            pszDriverName: PSZ;
            pDriverData  : PDRIVDATA;
      end record;

    pragma Pack(struct_PRQINFO3);

   subtype PRQINFO3 is struct_PRQINFO3;

   type struct_PRQINFO6 is
      record
            pszName              : PSZ;
            uPriority            : USHORT;
            uStartTime           : USHORT;
            uUntilTime           : USHORT;
            fsType               : USHORT;
            pszSepFile           : PSZ;
            pszPrProc            : PSZ;
            pszParms             : PSZ;
            pszComment           : PSZ;
            fsStatus             : USHORT;
            cJobs                : USHORT;
            pszPrinters          : PSZ;
            pszDriverName        : PSZ;
            pDriverData          : PDRIVDATA;
            pszRemoteComputerName: PSZ;
            pszRemoteQueueName   : PSZ;
      end record;

    pragma Pack(struct_PRQINFO6);

   subtype PRQINFO6 is struct_PRQINFO6;

   type struct_PRIDINFO is
      record
            uJobId        : USHORT;
            szComputerName: STR8;
            szQueueName   : STR8;
            pad_1         : CHAR;
      end record;

    pragma Pack(struct_PRIDINFO);

   subtype PRIDINFO is struct_PRIDINFO;

   type struct_PRDRIVINFO is
      record
            szDrivName: STR8;
      end record;

    pragma Pack(struct_PRDRIVINFO);

   subtype PRDRIVINFO is struct_PRDRIVINFO;

   type struct_PRQPROCINFO is
      record
            szQProcName: STR8;
      end record;

    pragma Pack(struct_PRQPROCINFO);

   subtype PRQPROCINFO is struct_PRQPROCINFO;

   type struct_PRPORTINFO is
      record
            szPortName: STR8;
      end record;

    pragma Pack(struct_PRPORTINFO);

   subtype PRPORTINFO is struct_PRPORTINFO;

   type struct_PRPORTINFO1 is
      record
            pszPortName          : PSZ;
            pszPortDriverName    : PSZ;
            pszPortDriverPathName: PSZ;
      end record;

    pragma Pack(struct_PRPORTINFO1);

   subtype PRPORTINFO1 is struct_PRPORTINFO1;

   type struct_ACVP is
      record
            cb        : ULONG;
            hAB_hab   : HAB;
            hmq_hmq   : HMQ;
            ObjectID  : ULONG;
            hWndParent: HWND;
            hWndOwner : HWND;
            hWndACVP  : HWND;
      end record;

    pragma Pack(struct_ACVP);

   subtype ACVP is struct_ACVP;

   type struct_HELPTABLE is
      record
            idAppWindow     : USHORT;
            phstHelpSubTable: PHELPSUBTABLE;
            idExtPanel      : USHORT;
      end record;

    pragma Pack(struct_HELPTABLE);

   subtype HELPTABLE is struct_HELPTABLE;

   type struct_HELPINIT is
      record
            cb                      : ULONG;
            ulReturnCode            : ULONG;
            pszTutorialName         : PSZ;
            phtHelpTable            : PHELPTABLE;
            hmodHelpTableModule     : HMODULE;
            hmodAccelActionBarModule: HMODULE;
            idAccelTable            : ULONG;
            idActionBar             : ULONG;
            pszHelpWindowTitle      : PSZ;
            fShowPanelId            : ULONG;
            pszHelpLibraryName      : PSZ;
      end record;

    pragma Pack(struct_HELPINIT);

   subtype HELPINIT is struct_HELPINIT;

   type struct_FOCAMETRICS is
      record
            ulIdentity         : ULONG;
            ulSize             : ULONG;
            szFamilyname       : STR8;
            szFacename         : STR8;
            usRegistryId       : SHORT;
            usCodePage         : SHORT;
            yEmHeight          : SHORT;
            yXHeight           : SHORT;
            yMaxAscender       : SHORT;
            yMaxDescender      : SHORT;
            yLowerCaseAscent   : SHORT;
            yLowerCaseDescent  : SHORT;
            yInternalLeading   : SHORT;
            yExternalLeading   : SHORT;
            xAveCharWidth      : SHORT;
            xMaxCharInc        : SHORT;
            xEmInc             : SHORT;
            yMaxBaselineExt    : SHORT;
            sCharSlope         : SHORT;
            sInlineDir         : SHORT;
            sCharRot           : SHORT;
            usWeightClass      : USHORT;
            usWidthClass       : USHORT;
            xDeviceRes         : SHORT;
            yDeviceRes         : SHORT;
            usFirstChar        : SHORT;
            usLastChar         : SHORT;
            usDefaultChar      : SHORT;
            usBreakChar        : SHORT;
            usNominalPointSize : SHORT;
            usMinimumPointSize : SHORT;
            usMaximumPointSize : SHORT;
            fsTypeFlags        : SHORT;
            fsDefn             : SHORT;
            fsSelectionFlags   : SHORT;
            fsCapabilities     : SHORT;
            ySubscriptXSize    : SHORT;
            ySubscriptYSize    : SHORT;
            ySubscriptXOffset  : SHORT;
            ySubscriptYOffset  : SHORT;
            ySuperscriptXSize  : SHORT;
            ySuperscriptYSize  : SHORT;
            ySuperscriptXOffset: SHORT;
            ySuperscriptYOffset: SHORT;
            yUnderscoreSize    : SHORT;
            yUnderscorePosition: SHORT;
            yStrikeoutSize     : SHORT;
            yStrikeoutPosition : SHORT;
            usKerningPairs     : SHORT;
            sFamilyClass       : SHORT;
            pszDeviceNameOffset: PSZ;
      end record;

    pragma Pack(struct_FOCAMETRICS);

   subtype FOCAMETRICS is struct_FOCAMETRICS;

   type struct_FONTFILEMETRICS is
      record
            ulIdentity         : ULONG;
            ulSize             : ULONG;
            szFamilyname       : STR8;
            szFacename         : STR8;
            usRegistryId       : SHORT;
            usCodePage         : SHORT;
            yEmHeight          : SHORT;
            yXHeight           : SHORT;
            yMaxAscender       : SHORT;
            yMaxDescender      : SHORT;
            yLowerCaseAscent   : SHORT;
            yLowerCaseDescent  : SHORT;
            yInternalLeading   : SHORT;
            yExternalLeading   : SHORT;
            xAveCharWidth      : SHORT;
            xMaxCharInc        : SHORT;
            xEmInc             : SHORT;
            yMaxBaselineExt    : SHORT;
            sCharSlope         : SHORT;
            sInlineDir         : SHORT;
            sCharRot           : SHORT;
            usWeightClass      : USHORT;
            usWidthClass       : USHORT;
            xDeviceRes         : SHORT;
            yDeviceRes         : SHORT;
            usFirstChar        : SHORT;
            usLastChar         : SHORT;
            usDefaultChar      : SHORT;
            usBreakChar        : SHORT;
            usNominalPointSize : SHORT;
            usMinimumPointSize : SHORT;
            usMaximumPointSize : SHORT;
            fsTypeFlags        : SHORT;
            fsDefn             : SHORT;
            fsSelectionFlags   : SHORT;
            fsCapabilities     : SHORT;
            ySubscriptXSize    : SHORT;
            ySubscriptYSize    : SHORT;
            ySubscriptXOffset  : SHORT;
            ySubscriptYOffset  : SHORT;
            ySuperscriptXSize  : SHORT;
            ySuperscriptYSize  : SHORT;
            ySuperscriptXOffset: SHORT;
            ySuperscriptYOffset: SHORT;
            yUnderscoreSize    : SHORT;
            yUnderscorePosition: SHORT;
            yStrikeoutSize     : SHORT;
            yStrikeoutPosition : SHORT;
            usKerningPairs     : SHORT;
            sFamilyClass       : SHORT;
            ulReserved         : ULONG;
            panose_panose      : PANOSE;
      end record;

    pragma Pack(struct_FONTFILEMETRICS);

   subtype FONTFILEMETRICS is struct_FONTFILEMETRICS;

   type struct_FONTDEFINITIONHEADER is
      record
            ulIdentity     : ULONG;
            ulSize         : ULONG;
            fsFontdef      : SHORT;
            fsChardef      : SHORT;
            usCellSize     : SHORT;
            xCellWidth     : SHORT;
            yCellHeight    : SHORT;
            xCellIncrement : SHORT;
            xCellA         : SHORT;
            xCellB         : SHORT;
            xCellC         : SHORT;
            pCellBaseOffset: SHORT;
      end record;

    pragma Pack(struct_FONTDEFINITIONHEADER);

   subtype FONTDEFINITIONHEADER is struct_FONTDEFINITIONHEADER;

   type struct_FONTSIGNATURE is
      record
            ulIdentity  : ULONG;
            ulSize      : ULONG;
            achSignature: STR8;
      end record;

    pragma Pack(struct_FONTSIGNATURE);

   subtype FONTSIGNATURE is struct_FONTSIGNATURE;

   type struct_ADDITIONALMETRICS is
      record
            ulIdentity: ULONG;
            ulSize    : ULONG;
            panose_panose    : PANOSE;
      end record;

    pragma Pack(struct_ADDITIONALMETRICS);

   subtype ADDITIONALMETRICS is struct_ADDITIONALMETRICS;

   type struct_FOCAFONT is
      record
            fsSignature  : FONTSIGNATURE;
            fmMetrics    : FOCAMETRICS;
            fdDefinitions: FONTDEFINITIONHEADER;
      end record;

    pragma Pack(struct_FOCAFONT);

   subtype FOCAFONT is struct_FOCAFONT;


   --------------------- MACRO FUNCTIONS -----------------------------

   -- type conversions

    function PVOIDFROMMP is
       new Unchecked_Conversion(Source => MPARAM, Target => PVOID);

    NULL_PVOID: constant PVOID := System.Null_Address;

    function HWNDFROMMP is
       new Unchecked_Conversion(Source => MPARAM, Target => HWND);

    function LONGFROMMP is
       new Unchecked_Conversion(Source => MPARAM, Target => LONG);

    function CHAR1FROMMP(mp: MPARAM) return CHAR;
    function CHAR2FROMMP(mp: MPARAM) return CHAR;
    function CHAR3FROMMP(mp: MPARAM) return CHAR;
    function CHAR4FROMMP(mp: MPARAM) return CHAR;
    function SHORT1FROMMP(mp: MPARAM) return SHORT;
    function SHORT2FROMMP(mp: MPARAM) return SHORT;

    function MPFROMP is
       new Unchecked_Conversion(Source => System.Address, Target => MPARAM);
   
    function MPFROMP is
       new Unchecked_Conversion(Source => C.Strings.chars_ptr, Target => MPARAM);


    function MPFROMHWND is
       new Unchecked_Conversion(Source => HWND, Target => MPARAM);

    function MPFROMLONG is
       new Unchecked_Conversion(Source => LONG, Target => MPARAM);

    function MPFROMSHORT(s: SHORT) return MPARAM;
    function MPFROMCHAR(c: CHAR) return MPARAM;

    function MPFROM2SHORT(s1: SHORT; s2: SHORT) return MPARAM;

    function MRFROMP is 
       new Unchecked_Conversion(Source => PVOID, Target => MRESULT);

    function MRFROMSHORT(s: SHORT) return MRESULT;
    function MRFROM2SHORT(s1: SHORT; s2: SHORT) return MRESULT;
  
    function PVOIDFROMMR is
       new Unchecked_Conversion(Source => MRESULT, Target => PVOID);

    function SHORT1FROMMR(mr: MRESULT) return SHORT;
    function SHORT2FROMMR(mr: MRESULT) return SHORT;
    function LONGFROMMR is
       new Unchecked_Conversion(Source => MRESULT, Target => LONG);


    -- controls (general)
    
    function WinEnableControl(hwndDlg: HWND;
                              id:      ULONG;
                              fEnable: BOOL) return BOOL;

    function WinIsControlEnabled(hwndDlg: HWND;
                                 id:      ULONG) return BOOL;

    -- buttons/checkboxes

    function WinCheckButton(hwndDlg:      HWND;
                            id:           ULONG;
                            usCheckState: USHORT) return USHORT;

    function WinQueryButtonCheckstate(hwndDlg: HWND;
                                      id:      ULONG) return USHORT;
                               

    -- listbox controls
    function WinDeleteLboxItem(hwndLbox: HWND;
                               index:    LONG) return LONG;

    function WinInsertLboxItem(hwndLbox: HWND;
                               index:    LONG;
                               psz_psz:  PSZ) return LONG;

    function WinQueryLboxCount(hwndLbox: HWND) return LONG;

    function WinQueryLboxItemText(hwndLbox: HWND;
                                  index:    LONG;
                                  psz_psz:  PSZ;
                                  cchMax:   SHORT) return LONG;

    function WinQueryLboxItemTextLength(hwndLbox: HWND;
                                        index:    LONG) return LONG;
 
    function WinQueryLboxSelectedItem(hwndLbox: HWND) return LONG;

    function WinSetLboxItemText(hwndLbox: HWND;
                                index:    LONG;
                                psz_psz:  PSZ) return BOOL;


    -- menu windows

    function WinCheckMenuItem(hwndMenu: HWND;
                              id:       ULONG;
                              fcheck:   BOOL) return BOOL;

    function WinEnableMenuItem(hwndMenu: HWND;
                               id:       ULONG;
                               fEnable:  BOOL) return BOOL;

    function WinIsMenuItemChecked(hwndMenu: HWND;
                                  id:       ULONG) return BOOL;

    function WinIsMenuItemEnabled(hwndMenu: HWND;
                                  id:       ULONG) return BOOL;
    
    function WinIsMenuItemValid(hwndMenu: HWND;
                                id:       ULONG) return BOOL;

    function WinSetMenuItemText(hwndMenu: HWND;
                                id:       ULONG;
                                psz_psz:  PSZ) return BOOL;


   ---------------------------- normal functions --------------------

   function WinCancelShutdown(hmq_hmq          : HMQ;
                              fCancelAlways: BOOL)
                                             return BOOL;

   function WinCreateMsgQueue(hab_hab : HAB;
                              cmsg: LONG)
                                    return HMQ;

   function WinDestroyMsgQueue(hmq_hmq: HMQ) return BOOL;

   function WinDispatchMsg(hab_hab  : HAB;
                           pqmsg_pqmsg: PQMSG)
                                  return MRESULT;

   function WinGetMsg(hab_hab           : HAB;
                      pqmsg_pqmsg         : PQMSG;
                      hwndFilter    : HWND;
                      msgFilterFirst: ULONG;
                      msgFilterLast : ULONG)
                                      return BOOL;

   function WinPeekMsg(hab_hab           : HAB;
                       pqmsg_pqmsg         : PQMSG;
                       hwndFilter    : HWND;
                       msgFilterFirst: ULONG;
                       msgFilterLast : ULONG;
                       fl            : ULONG)
                                       return BOOL;

   function WinPostMsg(hwnd_hwnd: HWND;
                       msg : ULONG;
                       mp1 : MPARAM;
                       mp2 : MPARAM)
                             return BOOL;

   function WinQueryQueueInfo(hmq_hmq   : HMQ;
                              pmqi  : PMQINFO;
                              cbCopy: ULONG)
                                      return BOOL;

   function WinRegisterUserDatatype(hab_hab     : HAB;
                                    datatype: LONG;
                                    count   : LONG;
                                    types   : PLONG)
                                              return BOOL;

   function WinRegisterUserMsg(hab_hab      : HAB;
                               msgid    : ULONG;
                               datatype1: LONG;
                               dir1     : LONG;
                               datatype2: LONG;
                               dir2     : LONG;
                               datatyper: LONG)
                                          return BOOL;

   function WinSendMsg(hwnd_hwnd: HWND;
                       msg : ULONG;
                       mp1 : MPARAM;
                       mp2 : MPARAM)
                             return MRESULT;

   function WinSetMsgMode(hab_hab      : HAB;
                          classname: PCSZ;
                          control  : LONG)
                                     return BOOL;

   function WinSetSynchroMode(hab_hab : HAB;
                              mode: LONG)
                                    return BOOL;

   function WinCreateWindow(hwndParent      : HWND;
                            pszClass        : PCSZ;
                            pszName         : PCSZ;
                            flStyle         : ULONG;
                            x               : LONG;
                            y               : LONG;
                            cx              : LONG;
                            cy              : LONG;
                            hwndOwner       : HWND;
                            hwndInsertBehind: HWND;
                            id              : ULONG;
                            pCtlData        : PVOID;
                            pPresParams     : PVOID)
                                              return HWND;

   function WinDrawBitmap(hpsDst : HPS;
                          hbm    : HBITMAP;
                          pwrcSrc: PRECTL;
                          pptlDst: PPOINTL;
                          clrFore: LONG;
                          clrBack: LONG;
                          fl     : ULONG)
                                   return BOOL;

   function WinDrawBorder(hps_hps   : HPS;
                          prcl   : PRECTL;
                          cx     : LONG;
                          cy     : LONG;
                          clrFore: LONG;
                          clrBack: LONG;
                          flCmd  : ULONG)
                                   return BOOL;

   function WinDrawText(hps_hps    : HPS;
                        cchText : LONG;
                        lpchText: PCCH;
                        prcl    : PRECTL;
                        clrFore : LONG;
                        clrBack : LONG;
                        flCmd   : ULONG)
                                  return LONG;

   function WinEnableWindow(hwnd_hwnd  : HWND;
                            fEnable: BOOL)
                                     return BOOL;

   function WinEnableWindowUpdate(hwnd_hwnd  : HWND;
                                  fEnable: BOOL)
                                           return BOOL;

   function WinInvalidateRect(hwnd_hwnd           : HWND;
                              prcl            : PRECTL;
                              fIncludeChildren: BOOL)
                                                return BOOL;

   function WinInvalidateRegion(hwnd_hwnd           : HWND;
                                hrgn_hrgn            : HRGN;
                                fIncludeChildren: BOOL)
                                                  return BOOL;

   function WinInvertRect(hps_hps: HPS;
                          prcl: PRECTL)
                                return BOOL;

   function WinIsChild(hwnd_hwnd     : HWND;
                       hwndParent: HWND)
                                   return BOOL;

   function WinIsWindow(hab_hab : HAB;
                        hwnd_hwnd: HWND)
                              return BOOL;

   function WinIsWindowEnabled(hwnd_hwnd: HWND) return BOOL;

   function WinIsWindowVisible(hwnd_hwnd: HWND) return BOOL;

   function WinLoadMessage(hab_hab      : HAB;
                           hmod     : HMODULE;
                           id       : ULONG;
                           cchMax   : LONG;
                           pchBuffer: PSZ)
                                      return LONG;

   function WinLoadString(hab_hab      : HAB;
                          hmod     : HMODULE;
                          id       : ULONG;
                          cchMax   : LONG;
                          pchBuffer: PSZ)
                                     return LONG;

   function WinMultWindowFromIDs(hwndParent: HWND;
                                 prghwnd_hwnd  : PHWND;
                                 idFirst   : ULONG;
                                 idLast    : ULONG)
                                             return LONG;

   function WinQueryDesktopWindow(hab_hab: HAB;
                                  hdc_hdc: HDC)
                                       return HWND;

   function WinQueryObjectWindow(hwndDesktop: HWND) return HWND;

   function WinQueryPointer(hwndDesktop: HWND) return HPOINTER;

   function WinQueryWindow(hwnd_hwnd: HWND;
                           cmd : LONG)
                                 return HWND;

   function WinQueryWindowPos(hwnd_hwnd: HWND;
                              pswp_pswp: PSWP)
                                    return BOOL;

   function WinQueryWindowProcess(hwnd_hwnd: HWND;
                                  ppid_ppid: PPID;
                                  ptid_ptid: PTID)
                                        return BOOL;

   function WinQueryWindowText(hwnd_hwnd       : HWND;
                               cchBufferMax: LONG;
                               pchBuffer   : PCH)
                                             return LONG;

   function WinQueryWindowTextLength(hwnd_hwnd: HWND) return LONG;

   function WinSetMultWindowPos(hab_hab : HAB;
                                pswp_pswp: PSWP;
                                cswp: ULONG)
                                      return BOOL;

   function WinSetOwner(hwnd_hwnd       : HWND;
                        hwndNewOwner: HWND)
                                      return BOOL;

   function WinSetParent(hwnd_hwnd        : HWND;
                         hwndNewParent: HWND;
                         fRedraw      : BOOL)
                                        return BOOL;

   function WinSetWindowPos(hwnd_hwnd           : HWND;
                            hwndInsertBehind: HWND;
                            x               : LONG;
                            y               : LONG;
                            cx              : LONG;
                            cy              : LONG;
                            fl              : ULONG)
                                              return BOOL;

   function WinSetWindowText(hwnd_hwnd  : HWND;
                             pszText: PCSZ)
                                      return BOOL;

   function WinUpdateWindow(hwnd_hwnd: HWND) return BOOL;

   function WinWindowFromID(hwndParent: HWND;
                            id        : ULONG)
                                        return HWND;

   function WinCreateStdWindow(hwndParent    : HWND;
                               flStyle       : ULONG;
                               pflCreateFlags: PULONG;
                               pszClientClass: PCSZ;
                               pszTitle      : PCSZ;
                               styleClient   : ULONG;
                               hmod          : HMODULE;
                               idResources   : ULONG;
                               phwndClient   : PHWND)
                                               return HWND;

   function WinCalcFrameRect(hwndFrame: HWND;
                             prcl     : PRECTL;
                             fClient  : BOOL)
                                        return BOOL;

   function WinCreateFrameControls(hwndFrame: HWND;
                                   pfcdata  : PFRAMECDATA;
                                   pszTitle : PCSZ)
                                              return BOOL;

   function WinFlashWindow(hwndFrame: HWND;
                           fFlash   : BOOL)
                                      return BOOL;

   function WinGetMaxPosition(hwnd_hwnd: HWND;
                              pswp_pswp: PSWP)
                                    return BOOL;

   function WinGetMinPosition(hwnd_hwnd: HWND;
                              pswp_pswp: PSWP;
                              pptl: PPOINTL)
                                    return BOOL;

   function WinSaveWindowPos(hsvwp: HSAVEWP;
                             pswp_pswp : PSWP;
                             cswp : ULONG)
                                    return BOOL;

   function WinBeginPaint(hwnd_hwnd    : HWND;
                          hps_hps     : HPS;
                          prclPaint: PRECTL)
                                     return HPS;

   function WinDefWindowProc(hwnd_hwnd: HWND;
                             msg : ULONG;
                             mp1 : MPARAM;
                             mp2 : MPARAM)
                                   return MRESULT;

   function WinDestroyWindow(hwnd_hwnd: HWND) return BOOL;

   function WinEndPaint(hps_hps: HPS) return BOOL;

   function WinFillRect(hps_hps  : HPS;
                        prcl  : PRECTL;
                        lColor: LONG)
                                return BOOL;

   function WinGetClipPS(hwnd_hwnd   : HWND;
                         hwndClip: HWND;
                         fl      : ULONG)
                                   return HPS;

   function WinGetPS(hwnd_hwnd: HWND) return HPS;

   function WinInitialize(fsOptions: ULONG) return HAB;

   function WinIsWindowShowing(hwnd_hwnd: HWND) return BOOL;

   function WinOpenWindowDC(hwnd_hwnd: HWND) return HDC;

   function WinQueryAnchorBlock(hwnd_hwnd: HWND) return HAB;

   function WinQueryVersion(hab_hab: HAB) return ULONG;

   function WinQueryWindowRect(hwnd_hwnd   : HWND;
                               prclDest: PRECTL)
                                         return BOOL;

   function WinRegisterClass(hab_hab         : HAB;
                             pszClassName: PCSZ;
                             pfnWndProc  : PFNWP;
                             flStyle     : ULONG;
                             cbWindowData: ULONG)
                                           return BOOL;

   function WinReleasePS(hps_hps: HPS) return BOOL;

   function WinScrollWindow(hwnd_hwnd     : HWND;
                            dx        : LONG;
                            dy        : LONG;
                            prclScroll: PRECTL;
                            prclClip  : PRECTL;
                            hrgnUpdate: HRGN;
                            prclUpdate: PRECTL;
                            rgfsw     : ULONG)
                                        return LONG;

   function WinSetActiveWindow(hwndDesktop: HWND;
                               hwnd_hwnd      : HWND)
                                            return BOOL;

   function WinShowWindow(hwnd_hwnd: HWND;
                          fShow: BOOL)
                                 return BOOL;

   function WinTerminate(hab_hab: HAB) return BOOL;

   function WinBeginEnumWindows(hwnd_hwnd: HWND) return HENUM;

   function WinEndEnumWindows(henum_henum: HENUM) return BOOL;

   function WinExcludeUpdateRegion(hps_hps: HPS;
                                   hwnd_hwnd: HWND)
                                         return LONG;

   function WinGetNextWindow(henum_henum: HENUM) return HWND;

   function WinGetScreenPS(hwndDesktop: HWND) return HPS;

   function WinIsThreadActive(hab_hab: HAB) return BOOL;

   function WinLockVisRegions(hwndDesktop: HWND;
                              fLock      : BOOL)
                                           return BOOL;

   function WinLockWindowUpdate(hwndDesktop   : HWND;
                                hwndLockUpdate: HWND)
                                                return BOOL;

   function WinMapWindowPoints(hwndFrom: HWND;
                               hwndTo  : HWND;
                               prgptl  : PPOINTL;
                               cwpt    : LONG)
                                         return BOOL;

   function WinQueryActiveWindow(hwndDesktop: HWND) return HWND;

   function WinQueryClassInfo(hab_hab         : HAB;
                              pszClassName: PCSZ;
                              pClassInfo_pClassInfo  : PCLASSINFO)
                                            return BOOL;

   function WinQueryClassName(hwnd_hwnd : HWND;
                              cchMax: LONG;
                              pch_pch   : PCH)
                                      return LONG;

   function WinQueryUpdateRect(hwnd_hwnd: HWND;
                               prcl: PRECTL)
                                     return BOOL;

   function WinQueryUpdateRegion(hwnd_hwnd: HWND;
                                 hrgn_hrgn: HRGN)
                                       return LONG;

   function WinQuerySysModalWindow(hwndDesktop: HWND) return HWND;

   function WinQueryWindowDC(hwnd_hwnd: HWND) return HDC;

   function WinQueryWindowPtr(hwnd_hwnd: HWND;
                              index: LONG)
                                     return PVOID;

   function WinQueryWindowULong(hwnd_hwnd: HWND;
                                index: LONG)
                                       return ULONG;

   function WinQueryWindowUShort(hwnd_hwnd: HWND;
                                 index: LONG)
                                        return USHORT;

   function WinSetSysModalWindow(hwndDesktop: HWND;
                                 hwnd_hwnd      : HWND)
                                              return BOOL;

   function WinSetWindowBits(hwnd_hwnd : HWND;
                             index : LONG;
                             flData: ULONG;
                             flMask: ULONG)
                                     return BOOL;

   function WinSetWindowPtr(hwnd_hwnd: HWND;
                            index: LONG;
                            p    : PVOID)
                                   return BOOL;

   function WinSetWindowULong(hwnd_hwnd: HWND;
                              index: LONG;
                              ul   : ULONG)
                                     return BOOL;

   function WinSetWindowUShort(hwnd_hwnd: HWND;
                               index: LONG;
                               us   : USHORT)
                                      return BOOL;

   function WinSubclassWindow(hwnd_hwnd: HWND;
                              pfnwp_pfnwp: PFNWP)
                                     return PFNWP;

   function WinValidateRect(hwnd_hwnd           : HWND;
                            prcl            : PRECTL;
                            fIncludeChildren: BOOL)
                                              return BOOL;

   function WinValidateRegion(hwnd_hwnd           : HWND;
                              hrgn_hrgn            : HRGN;
                              fIncludeChildren: BOOL)
                                                return BOOL;

   function WinWindowFromDC(hdc_hdc: HDC) return HWND;

   function WinWindowFromPoint(hwnd_hwnd    : HWND;
                               pptl     : PPOINTL;
                               fChildren: BOOL)
                                          return HWND;

   function WinCopyAccelTable(haccel_haccel     : HACCEL;
                              pAccelTable_pAccelTable: PACCELTABLE;
                              cbCopyMax  : ULONG)
                                           return ULONG;

   function WinCreateAccelTable(hab_hab        : HAB;
                                pAccelTable_pAccelTable: PACCELTABLE)
                                             return HACCEL;

   function WinDestroyAccelTable(haccel_haccel: HACCEL) return BOOL;

   function WinLoadAccelTable(hab_hab         : HAB;
                              hmod        : HMODULE;
                              idAccelTable: ULONG)
                                            return HACCEL;

   function WinQueryAccelTable(hab_hab      : HAB;
                               hwndFrame: HWND)
                                          return HACCEL;

   function WinSetAccelTable(hab_hab      : HAB;
                             haccel_haccel   : HACCEL;
                             hwndFrame: HWND)
                                        return BOOL;

   function WinTranslateAccel(hab_hab   : HAB;
                              hwnd_hwnd : HWND;
                              haccel_haccel: HACCEL;
                              pqmsg_pqmsg : PQMSG)
                                      return BOOL;

   function WinAddAtom(hAtomTbl_hAtomTbl   : HATOMTBL;
                       pszAtomName: PCSZ)
                                    return ATOM;

   function WinCreateAtomTable(cbInitial: ULONG;
                               cBuckets : ULONG)
                                          return HATOMTBL;

   function WinDeleteAtom(hAtomTbl_hAtomTbl: HATOMTBL;
                          atom_atom    : ATOM)
                                    return ATOM;

   function WinDestroyAtomTable(hAtomTbl_hAtomTbl: HATOMTBL) return HATOMTBL;

   function WinFindAtom(hAtomTbl_hAtomTbl   : HATOMTBL;
                        pszAtomName: PCSZ)
                                     return ATOM;

   function WinQueryAtomLength(hAtomTbl_hAtomTbl: HATOMTBL;
                               atom_atom    : ATOM)
                                         return ULONG;

   function WinQueryAtomName(hAtomTbl_hAtomTbl    : HATOMTBL;
                             atom_atom        : ATOM;
                             pchBuffer   : PSZ;
                             cchBufferMax: ULONG)
                                           return ULONG;

   function WinQueryAtomUsage(hAtomTbl_hAtomTbl: HATOMTBL;
                              atom_atom    : ATOM)
                                        return ULONG;

   function WinQuerySystemAtomTable return HATOMTBL;

   function WinCloseClipbrd(hab_hab: HAB) return BOOL;

   function WinEmptyClipbrd(hab_hab: HAB) return BOOL;

   function WinEnumClipbrdFmts(hab_hab: HAB;
                               fmt: ULONG)
                                    return ULONG;

   function WinOpenClipbrd(hab_hab: HAB) return BOOL;

   function WinQueryClipbrdData(hab_hab: HAB;
                                fmt: ULONG)
                                     return ULONG;

   function WinQueryClipbrdFmtInfo(hab_hab        : HAB;
                                   fmt        : ULONG;
                                   prgfFmtInfo: PULONG)
                                                return BOOL;

   function WinQueryClipbrdOwner(hab_hab: HAB) return HWND;

   function WinQueryClipbrdViewer(hab_hab: HAB) return HWND;

   function WinSetClipbrdData(hab_hab       : HAB;
                              ulData    : ULONG;
                              fmt       : ULONG;
                              rgfFmtInfo: ULONG)
                                          return BOOL;

   function WinSetClipbrdOwner(hab_hab : HAB;
                               hwnd_hwnd: HWND)
                                     return BOOL;

   function WinSetClipbrdViewer(hab_hab              : HAB;
                                hwndNewClipViewer: HWND)
                                                   return BOOL;

   function WinDdeInitiate(hwndClient  : HWND;
                           pszAppName  : PCSZ;
                           pszTopicName: PCSZ;
                           pcctxt      : PCONVCONTEXT)
                                         return BOOL;

   function WinDdePostMsg(hwndTo   : HWND;
                          hwndFrom : HWND;
                          wm       : ULONG;
                          pddest   : PDDESTRUCT;
                          flOptions: ULONG)
                                     return BOOL;

   function WinDdeRespond(hwndClient  : HWND;
                          hwndServer  : HWND;
                          pszAppName  : PCSZ;
                          pszTopicName: PCSZ;
                          pcctxt      : PCONVCONTEXT)
                                        return MRESULT;

   function WinCompareStrings(hab_hab     : HAB;
                              idcp    : ULONG;
                              idcc    : ULONG;
                              psz1    : PCSZ;
                              psz2    : PCSZ;
                              reserved: ULONG)
                                        return ULONG;

   function WinCpTranslateChar(hab_hab  : HAB;
                               cpSrc: ULONG;
                               chSrc: UCHAR;
                               cpDst: ULONG)
                                      return UCHAR;

   function WinCpTranslateString(hab_hab       : HAB;
                                 cpSrc     : ULONG;
                                 pszSrc    : PCSZ;
                                 cpDst     : ULONG;
                                 cchDestMax: ULONG;
                                 pchDest   : PSZ)
                                             return BOOL;

   function WinNextChar(hab_hab : HAB;
                        idcp: ULONG;
                        idcc: ULONG;
                        psz_psz : PCSZ)
                              return PSZ;

   function WinPrevChar(hab_hab     : HAB;
                        idcp    : ULONG;
                        idcc    : ULONG;
                        pszStart: PCSZ;
                        psz_psz     : PCSZ)
                                  return PSZ;

   function WinQueryCp(hmq_hmq: HMQ) return ULONG;

   function WinQueryCpList(hab_hab   : HAB;
                           ccpMax: ULONG;
                           prgcp : PULONG)
                                   return ULONG;

   function WinSetCp(hmq_hmq       : HMQ;
                     idCodePage: ULONG)
                                 return BOOL;

   function WinUpper(hab_hab : HAB;
                     idcp: ULONG;
                     idcc: ULONG;
                     psz_psz : PSZ)
                           return ULONG;

   function WinUpperChar(hab_hab : HAB;
                         idcp: ULONG;
                         idcc: ULONG;
                         c   : ULONG)
                               return ULONG;

   function WinCreateCursor(hwnd_hwnd   : HWND;
                            x       : LONG;
                            y       : LONG;
                            cx      : LONG;
                            cy      : LONG;
                            fs      : ULONG;
                            prclClip: PRECTL)
                                      return BOOL;

   function WinDestroyCursor(hwnd_hwnd: HWND) return BOOL;

   function WinShowCursor(hwnd_hwnd: HWND;
                          fShow: BOOL)
                                 return BOOL;

   function WinQueryCursorInfo(hwndDesktop: HWND;
                               pCursorInfo_pCursorInfo: PCURSORINFO)
                                            return BOOL;

   function WinQueryDesktopBkgnd(hwndDesktop: HWND;
                                 pdsk       : PDESKTOP)
                                              return BOOL;

   function WinSetDesktopBkgnd(hwndDesktop: HWND;
                               pdskNew    : PDESKTOP)
                                            return HBITMAP;

   function WinAlarm(hwndDesktop: HWND;
                     rgfType    : ULONG)
                                  return BOOL;

   function WinDefDlgProc(hwndDlg: HWND;
                          msg    : ULONG;
                          mp1    : MPARAM;
                          mp2    : MPARAM)
                                   return MRESULT;

   function WinDismissDlg(hwndDlg : HWND;
                          usResult: ULONG)
                                    return BOOL;

   function WinDlgBox(hwndParent   : HWND;
                      hwndOwner    : HWND;
                      pfnDlgProc   : PFNWP;
                      hmod         : HMODULE;
                      idDlg        : ULONG;
                      pCreateParams: PVOID)
                                     return ULONG;

   function WinGetDlgMsg(hwndDlg: HWND;
                         pqmsg_pqmsg  : PQMSG)
                                  return BOOL;

   function WinLoadDlg(hwndParent   : HWND;
                       hwndOwner    : HWND;
                       pfnDlgProc   : PFNWP;
                       hmod         : HMODULE;
                       idDlg        : ULONG;
                       pCreateParams: PVOID)
                                      return HWND;

   function WinMessageBox(hwndParent: HWND;
                          hwndOwner : HWND;
                          pszText   : PCSZ;
                          pszCaption: PCSZ;
                          idWindow  : ULONG;
                          flStyle   : ULONG)
                                      return ULONG;

   function WinQueryDlgItemShort(hwndDlg: HWND;
                                 idItem : ULONG;
                                 pResult: PSHORT;
                                 fSigned: BOOL)
                                          return BOOL;

   function WinQueryDlgItemText(hwndDlg     : HWND;
                                idItem      : ULONG;
                                cchBufferMax: LONG;
                                pchBuffer   : PSZ)
                                              return ULONG;

   function WinQueryDlgItemTextLength(hwndDlg: HWND;
                                      idItem : ULONG)
                                               return LONG;

   function WinSetDlgItemShort(hwndDlg: HWND;
                               idItem : ULONG;
                               usValue: USHORT;
                               fSigned: BOOL)
                                        return BOOL;

   function WinSetDlgItemText(hwndDlg: HWND;
                              idItem : ULONG;
                              pszText: PCSZ)
                                       return BOOL;

   function WinCreateDlg(hwndParent   : HWND;
                         hwndOwner    : HWND;
                         pfnDlgProc   : PFNWP;
                         pdlgt        : PDLGTEMPLATE;
                         pCreateParams: PVOID)
                                        return HWND;

   function WinEnumDlgItem(hwndDlg: HWND;
                           hwnd_hwnd  : HWND;
                           code   : ULONG)
                                    return HWND;

   function WinMapDlgPoints(hwndDlg          : HWND;
                            prgwptl          : PPOINTL;
                            cwpt             : ULONG;
                            fCalcWindowCoords: BOOL)
                                               return BOOL;

   function WinProcessDlg(hwndDlg: HWND) return ULONG;

   function WinSendDlgItemMsg(hwndDlg: HWND;
                              idItem : ULONG;
                              msg    : ULONG;
                              mp1    : MPARAM;
                              mp2    : MPARAM)
                                       return MRESULT;

   function WinSubstituteStrings(hwnd_hwnd    : HWND;
                                 pszSrc   : PCSZ;
                                 cchDstMax: LONG;
                                 pszDst   : PSZ)
                                            return LONG;

   function WinGetLastError(hab_hab: HAB) return ERRORID;

   function WinFreeErrorInfo(perrinfo_perrinfo: PERRINFO) return BOOL;

   function WinGetErrorInfo(hab_hab: HAB) return PERRINFO;

   function WinCallMsgFilter(hab_hab  : HAB;
                             pqmsg_pqmsg: PQMSG;
                             msgf : ULONG)
                                    return BOOL;

   function WinReleaseHook(hab_hab    : HAB;
                           hmq_hmq    : HMQ;
                           iHook  : LONG;
                           pfnHook: PFN;
                           hmod   : HMODULE)
                                    return BOOL;

   function WinSetHook(hab_hab    : HAB;
                       hmq_hmq    : HMQ;
                       iHook  : LONG;
                       pfnHook: PFN;
                       hmod   : HMODULE)
                                return BOOL;

   function WinFocusChange(hwndDesktop  : HWND;
                           hwndSetFocus : HWND;
                           flFocusChange: ULONG)
                                          return BOOL;

   function WinLockupSystem(hab_hab: HAB) return BOOL;

   function WinSetFocus(hwndDesktop : HWND;
                        hwndSetFocus: HWND)
                                      return BOOL;

   function WinUnlockSystem(hab_hab        : HAB;
                            pszPassword: PCSZ)
                                         return BOOL;

   function WinCheckInput(hab_hab: HAB) return BOOL;

   function WinEnablePhysInput(hwndDesktop: HWND;
                               fEnable    : BOOL)
                                            return BOOL;

   function WinGetKeyState(hwndDesktop: HWND;
                           vkey       : LONG)
                                        return LONG;

   function WinGetPhysKeyState(hwndDesktop: HWND;
                               sc         : LONG)
                                            return LONG;

   function WinIsPhysInputEnabled(hwndDesktop: HWND) return BOOL;

   function WinQueryCapture(hwndDesktop: HWND) return HWND;

   function WinQueryFocus(hwndDesktop: HWND) return HWND;

   function WinQueryVisibleRegion(hwnd_hwnd: HWND;
                                  hrgn_hrgn: HRGN)
                                        return ULONG;

   function WinSetCapture(hwndDesktop: HWND;
                          hwnd_hwnd      : HWND)
                                       return BOOL;

   function WinSetKeyboardStateTable(hwndDesktop   : HWND;
                                     pKeyStateTable: PBYTE;
                                     fSet          : BOOL)
                                                     return BOOL;

   function WinSetVisibleRegionNotify(hwnd_hwnd  : HWND;
                                      fEnable: BOOL)
                                               return BOOL;

   function WinDeleteLibrary(hab_hab      : HAB;
                             libhandle: HLIB)
                                        return BOOL;

   function WinDeleteProcedure(hab_hab    : HAB;
                               wndproc: PFNWP)
                                        return BOOL;

   function WinLoadLibrary(hab_hab    : HAB;
                           libname: PCSZ)
                                    return HLIB;

   function WinLoadProcedure(hab_hab      : HAB;
                             libhandle: HLIB;
                             procname : PSZ)
                                        return PFNWP;

   function WinCreateMenu(hwndParent: HWND;
                          lpmt      : CPVOID)
                                      return HWND;

   function WinLoadMenu(hwndFrame: HWND;
                        hmod     : HMODULE;
                        idMenu   : ULONG)
                                   return HWND;

   function WinPopupMenu(hwndParent: HWND;
                         hwndOwner : HWND;
                         hwndMenu  : HWND;
                         x         : LONG;
                         y         : LONG;
                         idItem    : LONG;
                         fs        : ULONG)
                                     return BOOL;

   function WinBroadcastMsg(hwnd_hwnd: HWND;
                            msg : ULONG;
                            mp1 : MPARAM;
                            mp2 : MPARAM;
                            rgf : ULONG)
                                  return BOOL;

   function WinInSendMsg(hab_hab: HAB) return BOOL;

   function WinPostQueueMsg(hmq_hmq: HMQ;
                            msg: ULONG;
                            mp1: MPARAM;
                            mp2: MPARAM)
                                 return BOOL;

   function WinQueryMsgPos(hab_hab : HAB;
                           pptl: PPOINTL)
                                 return BOOL;

   function WinQueryMsgTime(hab_hab: HAB) return ULONG;

   function WinQueryQueueStatus(hwndDesktop: HWND) return ULONG;

   function WinRequestMutexSem(hmtx_hmtx     : HMTX;
                               ulTimeout: ULONG)
                                          return ULONG;

   function WinSetClassMsgInterest(hab_hab         : HAB;
                                   pszClassName: PCSZ;
                                   msg_class   : ULONG;
                                   control     : LONG)
                                                 return BOOL;

   function WinSetMsgInterest(hwnd_hwnd    : HWND;
                              msg_class: ULONG;
                              control  : LONG)
                                         return BOOL;

   function WinWaitEventSem(hev_hev      : HEV;
                            ulTimeout: ULONG)
                                       return ULONG;

   function WinWaitMsg(hab_hab     : HAB;
                       msgFirst: ULONG;
                       msgLast : ULONG)
                                 return BOOL;

   function WinWaitMuxWaitSem(hmux_hmux     : HMUX;
                              ulTimeout: ULONG;
                              pulUser  : PULONG)
                                         return ULONG;

   function WinRealizePalette(hwnd_hwnd: HWND;
                              hps_hps : HPS;
                              pcclr: PULONG)
                                     return LONG;

   function WinCreatePointer(hwndDesktop: HWND;
                             hbmPointer : HBITMAP;
                             fPointer   : BOOL;
                             xHotspot   : LONG;
                             yHotspot   : LONG)
                                          return HPOINTER;

   function WinCreatePointerIndirect(hwndDesktop: HWND;
                                     pptri      : PPOINTERINFO)
                                                  return HPOINTER;

   function WinDestroyPointer(hptr: HPOINTER) return BOOL;

   function WinDrawPointer(hps_hps: HPS;
                           x   : LONG;
                           y   : LONG;
                           hptr: HPOINTER;
                           fs  : ULONG)
                                 return BOOL;

   function WinGetSysBitmap(hwndDesktop: HWND;
                            ibm        : ULONG)
                                         return HBITMAP;

   function WinLoadPointer(hwndDesktop: HWND;
                           hmod       : HMODULE;
                           idres      : ULONG)
                                        return HPOINTER;

   function WinLockPointerUpdate(hwndDesktop   : HWND;
                                 hptrNew       : HPOINTER;
                                 ulTimeInterval: ULONG)
                                                 return BOOL;

   function WinQueryPointerPos(hwndDesktop: HWND;
                               pptl       : PPOINTL)
                                            return BOOL;

   function WinQueryPointerInfo(hptr        : HPOINTER;
                                pPointerInfo_pPointerInfo: PPOINTERINFO)
                                              return BOOL;

   function WinQuerySysPointer(hwndDesktop: HWND;
                               lId        : LONG;
                               fCopy      : BOOL)
                                            return HPOINTER;

   function WinQuerySysPointerData(hwndDesktop: HWND;
                                   ulId       : ULONG;
                                   pIconInfo_pIconInfo  : PICONINFO)
                                                return BOOL;

   function WinSetPointer(hwndDesktop: HWND;
                          hptrNew    : HPOINTER)
                                       return BOOL;

   function WinSetPointerOwner(hptr    : HPOINTER;
                               pid_pid     : PID;
                               fDestroy: BOOL)
                                         return BOOL;

   function WinSetPointerPos(hwndDesktop: HWND;
                             x          : LONG;
                             y          : LONG)
                                          return BOOL;

   function WinSetSysPointerData(hwndDesktop: HWND;
                                 ulId       : ULONG;
                                 pIconInfo_pIconInfo  : PICONINFO)
                                              return BOOL;

   function WinShowPointer(hwndDesktop: HWND;
                           fShow      : BOOL)
                                        return BOOL;

   function WinCopyRect(hab_hab    : HAB;
                        prclDst: PRECTL;
                        prclSrc: PRECTL)
                                 return BOOL;

   function WinEqualRect(hab_hab  : HAB;
                         prcl1: PRECTL;
                         prcl2: PRECTL)
                                return BOOL;

   function WinInflateRect(hab_hab : HAB;
                           prcl: PRECTL;
                           cx  : LONG;
                           cy  : LONG)
                                 return BOOL;

   function WinIntersectRect(hab_hab     : HAB;
                             prclDst : PRECTL;
                             prclSrc1: PRECTL;
                             prclSrc2: PRECTL)
                                       return BOOL;

   function WinIsRectEmpty(hab_hab : HAB;
                           prcl: PRECTL)
                                 return BOOL;

   function WinMakePoints(hab_hab : HAB;
                          pwpt: PPOINTL;
                          cwpt: ULONG)
                                return BOOL;

   function WinMakeRect(hab_hab : HAB;
                        pwrc: PRECTL)
                              return BOOL;

   function WinOffsetRect(hab_hab : HAB;
                          prcl: PRECTL;
                          cx  : LONG;
                          cy  : LONG)
                                return BOOL;

   function WinPtInRect(hab_hab : HAB;
                        prcl: PRECTL;
                        pptl: PPOINTL)
                              return BOOL;

   function WinSetRect(hab_hab    : HAB;
                       prcl   : PRECTL;
                       xLeft  : LONG;
                       yBottom: LONG;
                       xRight : LONG;
                       yTop   : LONG)
                                return BOOL;

   function WinSetRectEmpty(hab_hab : HAB;
                            prcl: PRECTL)
                                  return BOOL;

   function WinSubtractRect(hab_hab     : HAB;
                            prclDst : PRECTL;
                            prclSrc1: PRECTL;
                            prclSrc2: PRECTL)
                                      return BOOL;

   function WinUnionRect(hab_hab     : HAB;
                         prclDst : PRECTL;
                         prclSrc1: PRECTL;
                         prclSrc2: PRECTL)
                                   return BOOL;

   function WinQueryPresParam(hwnd_hwnd: HWND;
                              id1  : ULONG;
                              id2  : ULONG;
                              pulId: PULONG;
                              cbBuf: ULONG;
                              pbBuf: PVOID;
                              fs   : ULONG)
                                     return ULONG;

   function WinQuerySysColor(hwndDesktop: HWND;
                             clr        : LONG;
                             lReserved  : LONG)
                                          return LONG;

   function WinQuerySysValue(hwndDesktop: HWND;
                             iSysValue  : LONG)
                                          return LONG;

   function WinRemovePresParam(hwnd_hwnd: HWND;
                               id  : ULONG)
                                     return BOOL;

   function WinSetPresParam(hwnd_hwnd  : HWND;
                            id     : ULONG;
                            cbParam: ULONG;
                            pbParam: PVOID)
                                     return BOOL;

   function WinSetSysColors(hwndDesktop: HWND;
                            flOptions  : ULONG;
                            flFormat   : ULONG;
                            clrFirst   : LONG;
                            cclr       : ULONG;
                            pclr       : PLONG)
                                         return BOOL;

   function WinSetSysValue(hwndDesktop: HWND;
                           iSysValue  : LONG;
                           lValue     : LONG)
                                        return BOOL;

   function WinQueryClassThunkProc(pszClassname: PCSZ) return PFN;

   function WinQueryWindowModel(hwnd_hwnd: HWND) return LONG;

   function WinQueryWindowThunkProc(hwnd_hwnd: HWND) return PFN;

   function WinSetClassThunkProc(pszClassname: PCSZ;
                                 pfnThunkProc: PFN)
                                               return BOOL;

   function WinSetWindowThunkProc(hwnd_hwnd       : HWND;
                                  pfnThunkProc: PFN)
                                                return BOOL;

   function WinGetCurrentTime(hab_hab: HAB) return ULONG;

   function WinStartTimer(hab_hab      : HAB;
                          hwnd_hwnd    : HWND;
                          idTimer  : ULONG;
                          dtTimeout: ULONG)
                                     return ULONG;

   function WinStopTimer(hab_hab    : HAB;
                         hwnd_hwnd  : HWND;
                         idTimer: ULONG)
                                  return BOOL;

   function WinShowTrackRect(hwnd_hwnd: HWND;
                             fShow: BOOL)
                                    return BOOL;

   function WinTrackRect(hwnd_hwnd: HWND;
                         hps_hps: HPS;
                         pti : PTRACKINFO)
                               return BOOL;

   function GpiAnimatePalette(hpal_hpal    : HPAL;
                              ulFormat: ULONG;
                              ulStart : ULONG;
                              ulCount : ULONG;
                              aulTable: PULONG)
                                        return LONG;

   function GpiAssociate(hps_hps: HPS;
                         hdc_hdc: HDC)
                              return BOOL;

   function GpiBeginArea(hps_hps     : HPS;
                         flOptions: ULONG)
                                    return BOOL;

   function GpiBeginElement(hps_hps   : HPS;
                            lType  : LONG;
                            pszDesc: PCSZ)
                                     return BOOL;

   function GpiBeginPath(hps_hps : HPS;
                         lPath: LONG)
                                return BOOL;

   function GpiBitBlt(hpsTarget : HPS;
                      hpsSource : HPS;
                      lCount    : LONG;
                      aptlPoints: PPOINTL;
                      lRop      : LONG;
                      flOptions : ULONG)
                                  return LONG;

   function GpiBox(hps_hps     : HPS;
                   lControl : LONG;
                   pptlPoint: PPOINTL;
                   lHRound  : LONG;
                   lVRound  : LONG)
                              return LONG;

   function GpiCallSegmentMatrix(hps_hps       : HPS;
                                 lSegment   : LONG;
                                 lCount     : LONG;
                                 pmatlfArray: PMATRIXLF;
                                 lOptions   : LONG)
                                              return LONG;

   function GpiCharString(hps_hps     : HPS;
                          lCount   : LONG;
                          pchString: PCCH)
                                     return LONG;

   function GpiCharStringAt(hps_hps     : HPS;
                            pptlPoint: PPOINTL;
                            lCount   : LONG;
                            pchString: PCCH)
                                       return LONG;

   function GpiCharStringPos(hps_hps     : HPS;
                             prclRect : PRECTL;
                             flOptions: ULONG;
                             lCount   : LONG;
                             pchString: PCCH;
                             alAdx    : PLONG)
                                        return LONG;

   function GpiCharStringPosAt(hps_hps     : HPS;
                               pptlStart: PPOINTL;
                               prclRect : PRECTL;
                               flOptions: ULONG;
                               lCount   : LONG;
                               pchString: PCCH;
                               alAdx    : PLONG)
                                          return LONG;

   function GpiCloseFigure(hps_hps: HPS) return BOOL;

   function GpiCloseSegment(hps_hps: HPS) return BOOL;

   function GpiCombineRegion(hps_hps    : HPS;
                             hrgnDest: HRGN;
                             hrgnSrc1: HRGN;
                             hrgnSrc2: HRGN;
                             lMode   : LONG)
                                       return LONG;

   function GpiComment(hps_hps   : HPS;
                       lLength: LONG;
                       pbData : PBYTE)
                                return BOOL;

   function GpiConvert(hps_hps      : HPS;
                       lSrc      : LONG;
                       lTarg     : LONG;
                       lCount    : LONG;
                       aptlPoints: PPOINTL)
                                   return BOOL;

   function GpiConvertWithMatrix(hps_hps       : HPS;
                                 lCountp    : LONG;
                                 aptlPoints : PPOINTL;
                                 lCount     : LONG;
                                 pmatlfArray: PMATRIXLF)
                                              return BOOL;

   function GpiCopyMetaFile(hmf_hmf: HMF) return HMF;

   function GpiCorrelateChain(hps_hps     : HPS;
                              lType    : LONG;
                              pptlPick : PPOINTL;
                              lMaxHits : LONG;
                              lMaxDepth: LONG;
                              pl2      : PLONG)
                                         return LONG;

   function GpiCorrelateFrom(hps_hps         : HPS;
                             lFirstSegment: LONG;
                             lLastSegment : LONG;
                             lType        : LONG;
                             pptlPick     : PPOINTL;
                             lMaxHits     : LONG;
                             lMaxDepth    : LONG;
                             plSegTag     : PLONG)
                                            return LONG;

   function GpiCorrelateSegment(hps_hps     : HPS;
                                lSegment : LONG;
                                lType    : LONG;
                                pptlPick : PPOINTL;
                                lMaxHits : LONG;
                                lMaxDepth: LONG;
                                alSegTag : PLONG)
                                           return LONG;

   function GpiCreateBitmap(hps_hps         : HPS;
                            pbmpNew      : PBITMAPINFOHEADER2;
                            flOptions    : ULONG;
                            pbInitData   : PBYTE;
                            pbmiInfoTable: PBITMAPINFO2)
                                           return HBITMAP;

   function GpiCreateLogColorTable(hps_hps     : HPS;
                                   flOptions: ULONG;
                                   lFormat  : LONG;
                                   lStart   : LONG;
                                   lCount   : LONG;
                                   alTable  : PLONG)
                                              return BOOL;

   function GpiCreateLogFont(hps_hps     : HPS;
                             pName    : PSTR8;
                             lLcid    : LONG;
                             pfatAttrs: PFATTRS)
                                        return LONG;

   function GpiCreatePalette(hab_hab      : HAB;
                             flOptions: ULONG;
                             ulFormat : ULONG;
                             ulCount  : ULONG;
                             aulTable : PULONG)
                                        return HPAL;

   function GpiCreatePS(hab_hab      : HAB;
                        hdc_hdc      : HDC;
                        psizlSize: PSIZEL;
                        flOptions: ULONG)
                                   return HPS;

   function GpiCreateRegion(hps_hps          : HPS;
                            lCount        : LONG;
                            arclRectangles: PRECTL)
                                            return HRGN;

   function GpiDeleteBitmap(hbm: HBITMAP) return BOOL;

   function GpiDeleteElement(hps_hps: HPS) return BOOL;

   function GpiDeleteElementRange(hps_hps         : HPS;
                                  lFirstElement: LONG;
                                  lLastElement : LONG)
                                                 return BOOL;

   function GpiDeleteElementsBetweenLabels(hps_hps       : HPS;
                                           lFirstLabel: LONG;
                                           lLastLabel : LONG)
                                                        return BOOL;

   function GpiDeleteMetaFile(hmf_hmf: HMF) return BOOL;

   function GpiDeletePalette(hpal_hpal: HPAL) return BOOL;

   function GpiDeleteSegment(hps_hps  : HPS;
                             lSegid: LONG)
                                     return BOOL;

   function GpiDeleteSegments(hps_hps         : HPS;
                              lFirstSegment: LONG;
                              lLastSegment : LONG)
                                             return BOOL;

   function GpiDeleteSetId(hps_hps : HPS;
                           lLcid: LONG)
                                  return BOOL;

   function GpiDestroyPS(hps_hps: HPS) return BOOL;

   function GpiDestroyRegion(hps_hps: HPS;
                             hrgn_hrgn: HRGN)
                                   return BOOL;

   function GpiDrawBits(hps_hps         : HPS;
                        pBits        : system.address;
                        pbmiInfoTable: PBITMAPINFO2;
                        lCount       : LONG;
                        aptlPoints   : PPOINTL;
                        lRop         : LONG;
                        flOptions    : ULONG)
                                       return LONG;

   function GpiDrawChain(hps_hps: HPS) return BOOL;

   function GpiDrawDynamics(hps_hps: HPS) return BOOL;

   function GpiDrawFrom(hps_hps         : HPS;
                        lFirstSegment: LONG;
                        lLastSegment : LONG)
                                       return BOOL;

   function GpiDrawSegment(hps_hps    : HPS;
                           lSegment: LONG)
                                     return BOOL;

   function GpiElement(hps_hps   : HPS;
                       lType  : LONG;
                       pszDesc: PCSZ;
                       lLength: LONG;
                       pbData : PBYTE)
                                return LONG;

   function GpiEndArea(hps_hps: HPS) return LONG;

   function GpiEndElement(hps_hps: HPS) return BOOL;

   function GpiEndPath(hps_hps: HPS) return BOOL;

   function GpiEqualRegion(hps_hps    : HPS;
                           hrgnSrc1: HRGN;
                           hrgnSrc2: HRGN)
                                     return LONG;

   function GpiErase(hps_hps: HPS) return BOOL;

   function GpiErrorSegmentData(hps_hps     : HPS;
                                plSegment: PLONG;
                                plContext: PLONG)
                                           return LONG;

   function GpiExcludeClipRectangle(hps_hps         : HPS;
                                    prclRectangle: PRECTL)
                                                   return LONG;

   function GpiFillPath(hps_hps    : HPS;
                        lPath   : LONG;
                        lOptions: LONG)
                                  return LONG;

   function GpiFloodFill(hps_hps    : HPS;
                         lOptions: LONG;
                         lColor  : LONG)
                                   return LONG;

   function GpiFrameRegion(hps_hps     : HPS;
                           hrgn_hrgn     : HRGN;
                           thickness: PSIZEL)
                                      return LONG;

   function GpiFullArc(hps_hps        : HPS;
                       lControl    : LONG;
                       fxMultiplier: FIXED)
                                     return LONG;

   function GpiGetData(hps_hps    : HPS;
                       lSegid  : LONG;
                       plOffset: PLONG;
                       lFormat : LONG;
                       lLength : LONG;
                       pbData  : PBYTE)
                                 return LONG;

   function GpiImage(hps_hps          : HPS;
                     lFormat       : LONG;
                     psizlImageSize: PSIZEL;
                     lLength       : LONG;
                     pbData        : PBYTE)
                                     return LONG;

   function GpiIntersectClipRectangle(hps_hps         : HPS;
                                      prclRectangle: PRECTL)
                                                     return LONG;

   function GpiLabel(hps_hps  : HPS;
                     lLabel: LONG)
                             return BOOL;

   function GpiLine(hps_hps        : HPS;
                    pptlEndPoint: PPOINTL)
                                  return LONG;

   function GpiLoadBitmap(hps_hps    : HPS;
                          Resource: HMODULE;
                          idBitmap: ULONG;
                          lWidth  : LONG;
                          lHeight : LONG)
                                    return HBITMAP;

   function GpiLoadFonts(hab_hab        : HAB;
                         pszFilename: PCSZ)
                                      return BOOL;

   function GpiLoadMetaFile(hab_hab        : HAB;
                            pszFilename: PCSZ)
                                         return HMF;

   function GpiLoadPublicFonts(hab_hab        : HAB;
                               pszFileName: PCSZ)
                                            return BOOL;

   function GpiMarker(hps_hps     : HPS;
                      pptlPoint: PPOINTL)
                                 return LONG;

   function GpiModifyPath(hps_hps : HPS;
                          lPath: LONG;
                          lMode: LONG)
                                 return BOOL;

   function GpiMove(hps_hps     : HPS;
                    pptlPoint: PPOINTL)
                               return BOOL;

   function GpiOffsetClipRegion(hps_hps     : HPS;
                                pptlPoint: PPOINTL)
                                           return LONG;

   function GpiOffsetElementPointer(hps_hps   : HPS;
                                    loffset: LONG)
                                             return BOOL;

   function GpiOffsetRegion(hps_hps      : HPS;
                            hrgn_hrgn      : HRGN;
                            pptlOffset: PPOINTL)
                                        return BOOL;

   function GpiOpenSegment(hps_hps    : HPS;
                           lSegment: LONG)
                                     return BOOL;

   function GpiOutlinePath(hps_hps    : HPS;
                           lPath   : LONG;
                           lOptions: LONG)
                                     return LONG;

   function GpiPaintRegion(hps_hps: HPS;
                           hrgn_hrgn: HRGN)
                                 return LONG;

   function GpiPartialArc(hps_hps        : HPS;
                          pptlCenter  : PPOINTL;
                          fxMultiplier: FIXED;
                          fxStartAngle: FIXED;
                          fxSweepAngle: FIXED)
                                        return LONG;

   function GpiPathToRegion(GpiH    : HPS;
                            lPath   : LONG;
                            lOptions: LONG)
                                      return HRGN;

   function GpiPlayMetaFile(hps_hps      : HPS;
                            hmf_hmf       : HMF;
                            lCount1   : LONG;
                            alOptarray: PLONG;
                            plSegCount: PLONG;
                            lCount2   : LONG;
                            pszDesc   : PSZ)
                                        return LONG;

   function GpiPointArc(hps_hps : HPS;
                        pptl2: PPOINTL)
                               return LONG;

   function GpiPolyFillet(hps_hps      : HPS;
                          lCount    : LONG;
                          aptlPoints: PPOINTL)
                                      return LONG;

   function GpiPolyFilletSharp(hps_hps      : HPS;
                               lCount    : LONG;
                               aptlPoints: PPOINTL;
                               afxPoints : PFIXED)
                                           return LONG;

   function GpiPolygons(hps_hps     : HPS;
                        ulCount  : ULONG;
                        paplgn   : PPOLYGON;
                        flOptions: ULONG;
                        flModel  : ULONG)
                                   return LONG;

   function GpiPolyLine(hps_hps      : HPS;
                        lCount    : LONG;
                        aptlPoints: PPOINTL)
                                    return LONG;

   function GpiPolyLineDisjoint(hps_hps      : HPS;
                                lCount    : LONG;
                                aptlPoints: PPOINTL)
                                            return LONG;

   function GpiPolyMarker(hps_hps      : HPS;
                          lCount    : LONG;
                          aptlPoints: PPOINTL)
                                      return LONG;

   function GpiPolySpline(hps_hps      : HPS;
                          lCount    : LONG;
                          aptlPoints: PPOINTL)
                                      return LONG;

   function GpiPop(hps_hps  : HPS;
                   lCount: LONG)
                           return BOOL;

   function GpiPtInRegion(hps_hps     : HPS;
                          hrgn_hrgn     : HRGN;
                          pptlPoint: PPOINTL)
                                     return LONG;

   function GpiPtVisible(hps_hps     : HPS;
                         pptlPoint: PPOINTL)
                                    return LONG;

   function GpiPutData(hps_hps   : HPS;
                       lFormat: LONG;
                       plCount: PLONG;
                       pbData : PBYTE)
                                return LONG;

   function GpiQueryArcParams(hps_hps          : HPS;
                              parcpArcParams: PARCPARAMS)
                                              return BOOL;

   function GpiQueryAttrMode(hps_hps: HPS) return LONG;

   function GpiQueryAttrs(hps_hps      : HPS;
                          lPrimType : LONG;
                          flAttrMask: ULONG;
                          ppbunAttrs: PBUNDLE)
                                      return LONG;

   function GpiQueryBackColor(hps_hps: HPS) return LONG;

   function GpiQueryBackMix(hps_hps: HPS) return LONG;

   function GpiQueryBitmapBits(hps_hps         : HPS;
                               lScanStart   : LONG;
                               lScans       : LONG;
                               pbBuffer     : PBYTE;
                               pbmiInfoTable: PBITMAPINFO2)
                                              return LONG;

   function GpiQueryBitmapDimension(hbm                 : HBITMAP;
                                    psizlBitmapDimension: PSIZEL)
                                                          return BOOL;

   function GpiQueryBitmapHandle(hps_hps : HPS;
                                 lLcid: LONG)
                                        return HBITMAP;

   function GpiQueryBitmapInfoHeader(hbm     : HBITMAP;
                                     pbmpData: PBITMAPINFOHEADER2)
                                               return BOOL;

   function GpiQueryBitmapParameters(hbm     : HBITMAP;
                                     pbmpData: PBITMAPINFOHEADER)
                                               return BOOL;

   function GpiQueryBoundaryData(hps_hps        : HPS;
                                 prclBoundary: PRECTL)
                                               return BOOL;

   function GpiQueryCharAngle(hps_hps       : HPS;
                              pgradlAngle: PGRADIENTL)
                                           return BOOL;

   function GpiQueryCharBox(hps_hps      : HPS;
                            psizfxSize: PSIZEF)
                                        return BOOL;

   function GpiQueryCharBreakExtra(hps_hps      : HPS;
                                   BreakExtra: PFIXED)
                                               return BOOL;

   function GpiQueryCharDirection(hps_hps: HPS) return LONG;

   function GpiQueryCharExtra(hps_hps : HPS;
                              Extra: PFIXED)
                                     return BOOL;

   function GpiQueryCharMode(hps_hps: HPS) return LONG;

   function GpiQueryCharSet(hps_hps: HPS) return LONG;

   function GpiQueryCharShear(hps_hps     : HPS;
                              pptlShear: PPOINTL)
                                         return BOOL;

   function GpiQueryCharStringPos(hps_hps         : HPS;
                                  flOptions    : ULONG;
                                  lCount       : LONG;
                                  pchString    : PCCH;
                                  alXincrements: PLONG;
                                  aptlPositions: PPOINTL)
                                                 return BOOL;

   function GpiQueryCharStringPosAt(hps_hps         : HPS;
                                    pptlStart    : PPOINTL;
                                    flOptions    : ULONG;
                                    lCount       : LONG;
                                    pchString    : PCCH;
                                    alXincrements: PLONG;
                                    aptlPositions: PPOINTL)
                                                   return BOOL;

   function GpiQueryClipBox(hps_hps     : HPS;
                            prclBound: PRECTL)
                                       return LONG;

   function GpiQueryClipRegion(hps_hps: HPS) return HRGN;

   function GpiQueryColor(hps_hps: HPS) return LONG;

   function GpiQueryColorData(hps_hps   : HPS;
                              lCount : LONG;
                              alArray: PLONG)
                                       return BOOL;

   function GpiQueryColorIndex(hps_hps     : HPS;
                               flOptions: ULONG;
                               lRgbColor: LONG)
                                          return LONG;

   function GpiQueryCp(hps_hps: HPS) return ULONG;

   function GpiQueryCurrentPosition(hps_hps     : HPS;
                                    pptlPoint: PPOINTL)
                                               return BOOL;

   function GpiQueryDefArcParams(hps_hps          : HPS;
                                 parcpArcParams: PARCPARAMS)
                                                 return BOOL;

   function GpiQueryDefAttrs(hps_hps      : HPS;
                             lPrimType : LONG;
                             flAttrMask: ULONG;
                             ppbunAttrs: PBUNDLE)
                                         return BOOL;

   function GpiQueryDefCharBox(hps_hps     : HPS;
                               psizlSize: PSIZEL)
                                          return BOOL;

   function GpiQueryDefTag(hps_hps : HPS;
                           plTag: PLONG)
                                  return BOOL;

   function GpiQueryDefViewingLimits(hps_hps      : HPS;
                                     prclLimits: PRECTL)
                                                 return BOOL;

   function GpiQueryDefaultViewMatrix(hps_hps       : HPS;
                                      lCount     : LONG;
                                      pmatlfArray: PMATRIXLF)
                                                   return BOOL;

   function GpiQueryDevice(hps_hps: HPS) return HDC;

   function GpiQueryDeviceBitmapFormats(hps_hps   : HPS;
                                        lCount : LONG;
                                        alArray: PLONG)
                                                 return BOOL;

   function GpiQueryDrawControl(hps_hps    : HPS;
                                lControl: LONG)
                                          return LONG;

   function GpiQueryDrawingMode(hps_hps: HPS) return LONG;

   function GpiQueryEditMode(hps_hps: HPS) return LONG;

   function GpiQueryElement(hps_hps      : HPS;
                            lOff      : LONG;
                            lMaxLength: LONG;
                            pbData    : PBYTE)
                                        return LONG;

   function GpiQueryElementPointer(hps_hps: HPS) return LONG;

   function GpiQueryElementType(hps_hps   : HPS;
                                plType : PLONG;
                                lLength: LONG;
                                pszData: PSZ)
                                         return LONG;

   function GpiQueryFaceString(PS              : HPS;
                               FamilyName      : PCSZ;
                               attrs           : PFACENAMEDESC;
                               length          : LONG;
                               CompoundFaceName: PSZ)
                                                 return ULONG;

   function GpiQueryFontAction(anchor : HAB;
                               options: ULONG)
                                        return ULONG;

   function GpiQueryFontFileDescriptions(hab_hab          : HAB;
                                         pszFilename  : PCSZ;
                                         plCount      : PLONG;
                                         affdescsNames: PFFDESCS)
                                                        return LONG;

   function GpiQueryFontMetrics(hps_hps          : HPS;
                                lMetricsLength: LONG;
                                pfmMetrics    : PFONTMETRICS)
                                                return BOOL;

   function GpiQueryFonts(hps_hps          : HPS;
                          flOptions     : ULONG;
                          pszFacename   : PCSZ;
                          plReqFonts    : PLONG;
                          lMetricsLength: LONG;
                          afmMetrics    : PFONTMETRICS)
                                          return LONG;

   function GpiQueryFullFontFileDescs(hab_hab              : HAB;
                                      pszFilename      : PCSZ;
                                      plCount          : PLONG;
                                      pNames           : PVOID;
                                      plNamesBuffLength: PLONG)
                                                         return LONG;

   function GpiQueryGraphicsField(hps_hps     : HPS;
                                  prclField: PRECTL)
                                             return BOOL;

   function GpiQueryInitialSegmentAttrs(hps_hps      : HPS;
                                        lAttribute: LONG)
                                                    return LONG;

   function GpiQueryKerningPairs(hps_hps      : HPS;
                                 lCount    : LONG;
                                 akrnprData: PKERNINGPAIRS)
                                             return LONG;

   function GpiQueryLineEnd(hps_hps: HPS) return LONG;

   function GpiQueryLineJoin(hps_hps: HPS) return LONG;

   function GpiQueryLineType(hps_hps: HPS) return LONG;

   function GpiQueryLineWidth(hps_hps: HPS) return FIXED;

   function GpiQueryLineWidthGeom(hps_hps: HPS) return LONG;

   function GpiQueryLogColorTable(hps_hps     : HPS;
                                  flOptions: ULONG;
                                  lStart   : LONG;
                                  lCount   : LONG;
                                  alArray  : PLONG)
                                             return LONG;

   function GpiQueryLogicalFont(PS    : HPS;
                                lcid  : LONG;
                                name  : PSTR8;
                                attrs : PFATTRS;
                                length: LONG)
                                        return BOOL;

   function GpiQueryMarker(hps_hps: HPS) return LONG;

   function GpiQueryMarkerBox(hps_hps      : HPS;
                              psizfxSize: PSIZEF)
                                          return BOOL;

   function GpiQueryMarkerSet(hps_hps: HPS) return LONG;

   function GpiQueryMetaFileBits(hmf_hmf    : HMF;
                                 lOffset: LONG;
                                 lLength: LONG;
                                 pbData : PBYTE)
                                          return BOOL;

   function GpiQueryMetaFileLength(hmf_hmf: HMF) return LONG;

   function GpiQueryMix(hps_hps: HPS) return LONG;

   function GpiQueryModelTransformMatrix(hps_hps       : HPS;
                                         lCount     : LONG;
                                         pmatlfArray: PMATRIXLF)
                                                      return BOOL;

   function GpiQueryNearestColor(hps_hps     : HPS;
                                 flOptions: ULONG;
                                 lRgbIn   : LONG)
                                            return LONG;

   function GpiQueryNumberSetIds(hps_hps: HPS) return LONG;

   function GpiQueryPageViewport(hps_hps        : HPS;
                                 prclViewport: PRECTL)
                                               return BOOL;

   function GpiQueryPalette(hps_hps: HPS) return HPAL;

   function GpiQueryPaletteInfo(hpal_hpal     : HPAL;
                                hps_hps     : HPS;
                                flOptions: ULONG;
                                ulStart  : ULONG;
                                ulCount  : ULONG;
                                aulArray : PULONG)
                                           return LONG;

   function GpiQueryPS(hps_hps     : HPS;
                       psizlSize: PSIZEL)
                                  return ULONG;

   function GpiQueryPattern(hps_hps: HPS) return LONG;

   function GpiQueryPatternRefPoint(hps_hps        : HPS;
                                    pptlRefPoint: PPOINTL)
                                                  return BOOL;

   function GpiQueryPatternSet(hps_hps: HPS) return LONG;

   function GpiQueryPel(hps_hps     : HPS;
                        pptlPoint: PPOINTL)
                                   return LONG;

   function GpiQueryPickAperturePosition(hps_hps     : HPS;
                                         pptlPoint: PPOINTL)
                                                    return BOOL;

   function GpiQueryPickApertureSize(hps_hps     : HPS;
                                     psizlSize: PSIZEL)
                                                return BOOL;

   function GpiQueryRealColors(hps_hps     : HPS;
                               flOptions: ULONG;
                               lStart   : LONG;
                               lCount   : LONG;
                               alColors : PLONG)
                                          return LONG;

   function GpiQueryRegionBox(hps_hps     : HPS;
                              hrgn_hrgn     : HRGN;
                              prclBound: PRECTL)
                                         return LONG;

   function GpiQueryRegionRects(hps_hps         : HPS;
                                hrgn_hrgn         : HRGN;
                                prclBound    : PRECTL;
                                prgnrcControl: PRGNRECT;
                                prclRect     : PRECTL)
                                               return BOOL;

   function GpiQueryRGBColor(hps_hps       : HPS;
                             flOptions  : ULONG;
                             lColorIndex: LONG)
                                          return LONG;

   function GpiQuerySegmentAttrs(hps_hps      : HPS;
                                 lSegid    : LONG;
                                 lAttribute: LONG)
                                             return LONG;

   function GpiQuerySegmentNames(hps_hps       : HPS;
                                 lFirstSegid: LONG;
                                 lLastSegid : LONG;
                                 lMax       : LONG;
                                 alSegids   : PLONG)
                                              return LONG;

   function GpiQuerySegmentPriority(hps_hps     : HPS;
                                    lRefSegid: LONG;
                                    lOrder   : LONG)
                                               return LONG;

   function GpiQuerySegmentTransformMatrix(hps_hps       : HPS;
                                           lSegid     : LONG;
                                           lCount     : LONG;
                                           pmatlfArray: PMATRIXLF)
                                                        return BOOL;

   function GpiQuerySetIds(hps_hps   : HPS;
                           lCount : LONG;
                           alTypes: PLONG;
                           aNames : PSTR8;
                           allcids: PLONG)
                                    return BOOL;

   function GpiQueryStopDraw(hps_hps: HPS) return LONG;

   function GpiQueryTag(hps_hps : HPS;
                        plTag: PLONG)
                               return BOOL;

   function GpiQueryTextAlignment(hps_hps   : HPS;
                                  plHoriz: PLONG;
                                  plVert : PLONG)
                                           return BOOL;

   function GpiQueryTextBox(hps_hps      : HPS;
                            lCount1   : LONG;
                            pchString : PCH;
                            lCount2   : LONG;
                            aptlPoints: PPOINTL)
                                        return BOOL;

   function GpiQueryViewingLimits(hps_hps      : HPS;
                                  prclLimits: PRECTL)
                                              return BOOL;

   function GpiQueryViewingTransformMatrix(hps_hps       : HPS;
                                           lCount     : LONG;
                                           pmatlfArray: PMATRIXLF)
                                                        return BOOL;

   function GpiQueryWidthTable(hps_hps      : HPS;
                               lFirstChar: LONG;
                               lCount    : LONG;
                               alData    : PLONG)
                                           return BOOL;

   function GpiRectInRegion(hps_hps    : HPS;
                            hrgn_hrgn    : HRGN;
                            prclRect: PRECTL)
                                      return LONG;

   function GpiRectVisible(hps_hps         : HPS;
                           prclRectangle: PRECTL)
                                          return LONG;

   function GpiRemoveDynamics(hps_hps       : HPS;
                              lFirstSegid: LONG;
                              lLastSegid : LONG)
                                           return BOOL;

   function GpiResetBoundaryData(hps_hps: HPS) return BOOL;

   function GpiResetPS(hps_hps     : HPS;
                       flOptions: ULONG)
                                  return BOOL;

   function GpiRestorePS(hps_hps : HPS;
                         lPSid: LONG)
                                return BOOL;

   function GpiRotate(hps_hps       : HPS;
                      pmatlfArray: PMATRIXLF;
                      lOptions   : LONG;
                      fxAngle    : FIXED;
                      pptlCenter : PPOINTL)
                                   return BOOL;

   function GpiSaveMetaFile(hmf_hmf        : HMF;
                            pszFilename: PCSZ)
                                         return BOOL;

   function GpiSavePS(hps_hps: HPS) return LONG;

   function GpiScale(hps_hps        : HPS;
                     pmfatlfArray: PMATRIXLF;
                     lOptions    : LONG;
                     afxScale    : PFIXED;
                     pptlCenter  : PPOINTL)
                                   return BOOL;

   function GpiSelectPalette(hps_hps: HPS;
                             hpal_hpal: HPAL)
                                   return HPAL;

   function GpiSetArcParams(hps_hps          : HPS;
                            parcpArcParams: PARCPARAMS)
                                            return BOOL;

   function GpiSetAttrMode(hps_hps : HPS;
                           lMode: LONG)
                                  return BOOL;

   function GpiSetAttrs(hps_hps      : HPS;
                        lPrimType : LONG;
                        flAttrMask: ULONG;
                        flDefMask : ULONG;
                        ppbunAttrs: system.address)
                                    return BOOL;

   function GpiSetBackColor(hps_hps  : HPS;
                            lColor: LONG)
                                    return BOOL;

   function GpiSetBackMix(hps_hps    : HPS;
                          lMixMode: LONG)
                                    return BOOL;

   function GpiSetBitmap(hps_hps: HPS;
                         hbm: HBITMAP)
                              return HBITMAP;

   function GpiSetBitmapBits(hps_hps         : HPS;
                             lScanStart   : LONG;
                             lScans       : LONG;
                             pbBuffer     : PBYTE;
                             pbmiInfoTable: PBITMAPINFO2)
                                            return LONG;

   function GpiSetBitmapDimension(hbm                 : HBITMAP;
                                  psizlBitmapDimension: PSIZEL)
                                                        return BOOL;

   function GpiSetBitmapId(hps_hps : HPS;
                           hbm  : HBITMAP;
                           lLcid: LONG)
                                  return BOOL;

   function GpiSetCharAngle(hps_hps       : HPS;
                            pgradlAngle: PGRADIENTL)
                                         return BOOL;

   function GpiSetCharBox(hps_hps     : HPS;
                          psizfxBox: PSIZEF)
                                     return BOOL;

   function GpiSetCharBreakExtra(hps_hps      : HPS;
                                 BreakExtra: FIXED)
                                             return BOOL;

   function GpiSetCharDirection(hps_hps      : HPS;
                                lDirection: LONG)
                                            return BOOL;

   function GpiSetCharExtra(hps_hps : HPS;
                            Extra: FIXED)
                                   return BOOL;

   function GpiSetCharMode(hps_hps : HPS;
                           lMode: LONG)
                                  return BOOL;

   function GpiSetCharSet(hps_hps : HPS;
                          llcid: LONG)
                                 return BOOL;

   function GpiSetCharShear(hps_hps     : HPS;
                            pptlAngle: PPOINTL)
                                       return BOOL;

   function GpiSetClipPath(hps_hps    : HPS;
                           lPath   : LONG;
                           lOptions: LONG)
                                     return BOOL;

   function GpiSetClipRegion(hps_hps    : HPS;
                             hrgn_hrgn    : HRGN;
                             phrgnOld: PHRGN)
                                       return LONG;

   function GpiSetColor(hps_hps  : HPS;
                        lColor: LONG)
                                return BOOL;

   function GpiSetCp(hps_hps      : HPS;
                     ulCodePage: ULONG)
                                 return BOOL;

   function GpiSetCurrentPosition(hps_hps     : HPS;
                                  pptlPoint: PPOINTL)
                                             return BOOL;

   function GpiSetDefArcParams(hps_hps          : HPS;
                               parcpArcParams: PARCPARAMS)
                                               return BOOL;

   function GpiSetDefAttrs(hps_hps      : HPS;
                           lPrimType : LONG;
                           flAttrMask: ULONG;
                           ppbunAttrs: system.address)
                                       return BOOL;

   function GpiSetDefaultViewMatrix(hps_hps       : HPS;
                                    lCount     : LONG;
                                    pmatlfarray: PMATRIXLF;
                                    lOptions   : LONG)
                                                 return BOOL;

   function GpiSetDefTag(hps_hps: HPS;
                         lTag: LONG)
                               return BOOL;

   function GpiSetDefViewingLimits(hps_hps      : HPS;
                                   prclLimits: PRECTL)
                                               return BOOL;

   function GpiSetDrawControl(hps_hps    : HPS;
                              lControl: LONG;
                              lValue  : LONG)
                                        return BOOL;

   function GpiSetDrawingMode(hps_hps : HPS;
                              lMode: LONG)
                                     return BOOL;

   function GpiSetEditMode(hps_hps : HPS;
                           lMode: LONG)
                                  return BOOL;

   function GpiSetElementPointer(hps_hps    : HPS;
                                 lElement: LONG)
                                           return BOOL;

   function GpiSetElementPointerAtLabel(hps_hps  : HPS;
                                        lLabel: LONG)
                                                return BOOL;

   function GpiSetGraphicsField(hps_hps     : HPS;
                                prclField: PRECTL)
                                           return BOOL;

   function GpiSetInitialSegmentAttrs(hps_hps      : HPS;
                                      lAttribute: LONG;
                                      lValue    : LONG)
                                                  return BOOL;

   function GpiSetLineEnd(hps_hps    : HPS;
                          lLineEnd: LONG)
                                    return BOOL;

   function GpiSetLineJoin(hps_hps     : HPS;
                           lLineJoin: LONG)
                                      return BOOL;

   function GpiSetLineType(hps_hps     : HPS;
                           lLineType: LONG)
                                      return BOOL;

   function GpiSetLineWidth(hps_hps       : HPS;
                            fxLineWidth: FIXED)
                                         return BOOL;

   function GpiSetLineWidthGeom(hps_hps      : HPS;
                                lLineWidth: LONG)
                                            return BOOL;

   function GpiSetMarker(hps_hps   : HPS;
                         lSymbol: LONG)
                                  return BOOL;

   function GpiSetMarkerBox(hps_hps      : HPS;
                            psizfxSize: PSIZEF)
                                        return BOOL;

   function GpiSetMarkerSet(hps_hps: HPS;
                            lSet: LONG)
                                  return BOOL;

   function GpiSetMetaFileBits(hmf_hmf     : HMF;
                               lOffset : LONG;
                               lLength : LONG;
                               pbBuffer: PBYTE)
                                         return BOOL;

   function GpiSetMix(hps_hps    : HPS;
                      lMixMode: LONG)
                                return BOOL;

   function GpiSetModelTransformMatrix(hps_hps       : HPS;
                                       lCount     : LONG;
                                       pmatlfArray: PMATRIXLF;
                                       lOptions   : LONG)
                                                    return BOOL;

   function GpiSetPageViewport(hps_hps        : HPS;
                               prclViewport: PRECTL)
                                             return BOOL;

   function GpiSetPaletteEntries(hpal_hpal    : HPAL;
                                 ulFormat: ULONG;
                                 ulStart : ULONG;
                                 ulCount : ULONG;
                                 aulTable: PULONG)
                                           return BOOL;

   function GpiSetPattern(hps_hps          : HPS;
                          lPatternSymbol: LONG)
                                          return BOOL;

   function GpiSetPatternRefPoint(hps_hps        : HPS;
                                  pptlRefPoint: PPOINTL)
                                                return BOOL;

   function GpiSetPatternSet(hps_hps: HPS;
                             lSet: LONG)
                                   return BOOL;

   function GpiSetPel(hps_hps     : HPS;
                      pptlPoint: PPOINTL)
                                 return LONG;

   function GpiSetPickAperturePosition(hps_hps    : HPS;
                                       pptlPick: PPOINTL)
                                                 return BOOL;

   function GpiSetPickApertureSize(hps_hps     : HPS;
                                   lOptions : LONG;
                                   psizlSize: PSIZEL)
                                              return BOOL;

   function GpiSetPS(hps_hps     : HPS;
                     psizlsize: PSIZEL;
                     flOptions: ULONG)
                                return BOOL;

   function GpiSetRegion(hps_hps          : HPS;
                         hrgn_hrgn          : HRGN;
                         lcount        : LONG;
                         arclRectangles: PRECTL)
                                         return BOOL;

   function GpiSetSegmentAttrs(hps_hps      : HPS;
                               lSegid    : LONG;
                               lAttribute: LONG;
                               lValue    : LONG)
                                           return BOOL;

   function GpiSetSegmentPriority(hps_hps     : HPS;
                                  lSegid   : LONG;
                                  lRefSegid: LONG;
                                  lOrder   : LONG)
                                             return BOOL;

   function GpiSetSegmentTransformMatrix(hps_hps       : HPS;
                                         lSegid     : LONG;
                                         lCount     : LONG;
                                         pmatlfarray: PMATRIXLF;
                                         lOptions   : LONG)
                                                      return BOOL;

   function GpiSetStopDraw(hps_hps  : HPS;
                           lValue: LONG)
                                   return BOOL;

   function GpiSetTag(hps_hps: HPS;
                      lTag: LONG)
                            return BOOL;

   function GpiSetTextAlignment(hps_hps  : HPS;
                                lHoriz: LONG;
                                lVert : LONG)
                                        return BOOL;

   function GpiSetViewingLimits(hps_hps      : HPS;
                                prclLimits: PRECTL)
                                            return BOOL;

   function GpiSetViewingTransformMatrix(hps_hps       : HPS;
                                         lCount     : LONG;
                                         pmatlfArray: PMATRIXLF;
                                         lOptions   : LONG)
                                                      return BOOL;

   function GpiStrokePath(hps_hps     : HPS;
                          lPath    : LONG;
                          flOptions: ULONG)
                                     return LONG;

   function GpiTranslate(hps_hps           : HPS;
                         pmatlfArray    : PMATRIXLF;
                         lOptions       : LONG;
                         pptlTranslation: PPOINTL)
                                          return BOOL;

   function GpiUnloadFonts(hab_hab        : HAB;
                           pszFilename: PCSZ)
                                        return BOOL;

   function GpiUnloadPublicFonts(hab_hab        : HAB;
                                 pszFilename: PCSZ)
                                              return BOOL;

   function GpiWCBitBlt(hpsTarget : HPS;
                        hbmSource : HBITMAP;
                        lCount    : LONG;
                        aptlPoints: PPOINTL;
                        lRop      : LONG;
                        flOptions : ULONG)
                                    return LONG;

   function DevCloseDC(hdc_hdc: HDC) return HMF;

   function DevEscape(hdc_hdc       : HDC;
                      lCode     : LONG;
                      lInCount  : LONG;
                      pbInData  : PBYTE;
                      plOutCount: PLONG;
                      pbOutData : PBYTE)
                                  return LONG;

   function DevOpenDC(hab_hab     : HAB;
                      lType   : LONG;
                      pszToken: PCSZ;
                      lCount  : LONG;
                      pdopData: PDEVOPENDATA;
                      hdcComp : HDC)
                                return HDC;

   function DevPostDeviceModes(hab_hab            : HAB;
                               pdrivDriverData: PDRIVDATA;
                               pszDriverName  : PCSZ;
                               pszDeviceName  : PCSZ;
                               pszName        : PCSZ;
                               flOptions      : ULONG)
                                                return LONG;

   function DevQueryCaps(hdc_hdc    : HDC;
                         lStart : LONG;
                         lCount : LONG;
                         alArray: PLONG)
                                  return BOOL;

   function DevQueryDeviceNames(hab_hab          : HAB;
                                pszDriverName: PCSZ;
                                pldn         : PLONG;
                                aDeviceName  : PSTR32;
                                aDeviceDesc  : PSTR64;
                                pldt         : PLONG;
                                aDataType    : PSTR16)
                                               return BOOL;

   function DevQueryHardcopyCaps(hdc_hdc       : HDC;
                                 lStartForm: LONG;
                                 lForms    : LONG;
                                 phciHcInfo: PHCINFO)
                                             return LONG;

   function PrfAddProgram(hini_hini      : HINI;
                          pDetails  : PPROGDETAILS;
                          hprogGroup: HPROGRAM)
                                      return HPROGRAM;

   function PrfChangeProgram(hini_hini    : HINI;
                             hprog   : HPROGRAM;
                             pDetails: PPROGDETAILS)
                                       return BOOL;

   function PrfCreateGroup(hini_hini        : HINI;
                           pszTitle    : PCSZ;
                           chVisibility: UCHAR)
                                         return HPROGRAM;

   function PrfDestroyGroup(hini_hini      : HINI;
                            hprogGroup: HPROGRAM)
                                        return BOOL;

   function PrfQueryProgramCategory(hini_hini  : HINI;
                                    pszExe: PCSZ)
                                            return PROGCATEGORY;

   function PrfQueryProgramHandle(hini_hini        : HINI;
                                  pszExe      : PCSZ;
                                  phprogArray_phprogArray : PHPROGARRAY;
                                  cchBufferMax: ULONG;
                                  pulCount    : PULONG)
                                                return ULONG;

   function PrfQueryProgramTitles(hini_hini          : HINI;
                                  hprogGroup    : HPROGRAM;
                                  pTitles       : PPROGTITLE;
                                  ulBufferLength: ULONG;
                                  pulCount      : PULONG)
                                                  return ULONG;

   function PrfQueryDefinition(hini_hini          : HINI;
                               hprog         : HPROGRAM;
                               pDetails      : PPROGDETAILS;
                               ulBufferLength: ULONG)
                                               return ULONG;

   function PrfRemoveProgram(hini_hini : HINI;
                             hprog: HPROGRAM)
                                    return BOOL;

   function WinStartApp(hwndNotify: HWND;
                        pDetails  : PPROGDETAILS;
                        pszParams : PCSZ;
                        Reserved  : PVOID;
                        fbOptions : ULONG)
                                    return HAPP;

   function WinTerminateApp(happ_happ: HAPP) return BOOL;

   function WinAddSwitchEntry(pswctl: PSWCNTRL) return HSWITCH;

   function WinRemoveSwitchEntry(hsw: HSWITCH) return ULONG;

   function WinChangeSwitchEntry(hsw   : HSWITCH;
                                 pswctl: PSWCNTRL)
                                         return ULONG;

   function WinCreateSwitchEntry(hab_hab   : HAB;
                                 pswctl: PSWCNTRL)
                                         return HSWITCH;

   function WinQuerySessionTitle(hab_hab       : HAB;
                                 usSession : ULONG;
                                 pszTitle  : PSZ;
                                 usTitlelen: ULONG)
                                             return ULONG;

   function WinQuerySwitchEntry(hsw   : HSWITCH;
                                pswctl: PSWCNTRL)
                                        return ULONG;

   function WinQuerySwitchHandle(hwnd_hwnd: HWND;
                                 pid_pid : PID)
                                       return HSWITCH;

   function WinQuerySwitchList(hab_hab         : HAB;
                               pswblk      : PSWBLOCK;
                               usDataLength: ULONG)
                                             return ULONG;

   function WinQueryTaskSizePos(hab_hab          : HAB;
                                usScreenGroup: ULONG;
                                pswp_pswp         : PSWP)
                                               return ULONG;

   function WinQueryTaskTitle(usSession : ULONG;
                              pszTitle  : PSZ;
                              usTitlelen: ULONG)
                                          return ULONG;

   function WinSwitchToProgram(hsw: HSWITCH) return ULONG;

   function PrfCloseProfile(hini_hini: HINI) return BOOL;

   function PrfOpenProfile(hab_hab        : HAB;
                           pszFileName: PCSZ)
                                        return HINI;

   function PrfQueryProfile(hab_hab        : HAB;
                            pPrfProfile_pPrfProfile: PPRFPROFILE)
                                         return BOOL;

   function PrfQueryProfileData(hini_hini           : HINI;
                                pszApp         : PCSZ;
                                pszKey         : PCSZ;
                                pBuffer        : PVOID;
                                pulBufferLength: PULONG)
                                                 return BOOL;

   function PrfQueryProfileInt(hini_hini    : HINI;
                               pszApp  : PCSZ;
                               pszKey  : PCSZ;
                               sDefault: LONG)
                                         return LONG;

   function PrfQueryProfileSize(hini_hini     : HINI;
                                pszApp   : PCSZ;
                                pszKey   : PCSZ;
                                pulReqLen: PULONG)
                                           return BOOL;

   function PrfQueryProfileString(hini_hini          : HINI;
                                  pszApp        : PCSZ;
                                  pszKey        : PCSZ;
                                  pszDefault    : PCSZ;
                                  pBuffer       : PVOID;
                                  ulBufferLength: ULONG)
                                                  return ULONG;

   function PrfReset(hab_hab        : HAB;
                     pPrfProfile_pPrfProfile: PPRFPROFILE)
                                  return BOOL;

   function PrfWriteProfileData(hini_hini        : HINI;
                                pszApp      : PCSZ;
                                pszKey      : PCSZ;
                                pData       : CPVOID;
                                ulDataLength: ULONG)
                                              return BOOL;

   function PrfWriteProfileString(hini_hini   : HINI;
                                  pszApp : PCSZ;
                                  pszKey : PCSZ;
                                  pszData: PCSZ)
                                           return BOOL;

   function WinDefFileDlgProc(hwnd_hwnd: HWND;
                              msg : ULONG;
                              mp1 : MPARAM;
                              mp2 : MPARAM)
                                    return MRESULT;

   function WinFileDlg(hwndP: HWND;
                       hwndO: HWND;
                       pfild: PFILEDLG)
                              return HWND;

   function WinFreeFileDlgList(papszFQFilename: PAPSZ) return BOOL;

   function WinFontDlg(hwndP: HWND;
                       hwndO: HWND;
                       pfntd: PFONTDLG)
                              return HWND;

   function WinDefFontDlgProc(hwnd_hwnd: HWND;
                              msg : ULONG;
                              mp1 : MPARAM;
                              mp2 : MPARAM)
                                    return MRESULT;

   function DrgAcceptDroppedFiles(hwnd_hwnd      : HWND;
                                  pszPath    : PCSZ;
                                  pszTypes   : PCSZ;
                                  ulDefaultOp: ULONG;
                                  ulReserved : ULONG)
                                               return BOOL;

   function DrgAccessDraginfo(pdinfo: PDRAGINFO) return BOOL;

   function DrgAddStrHandle(psz: PCSZ) return HSTR;

   function DrgAllocDraginfo(cDitem: ULONG) return PDRAGINFO;

   function DrgAllocDragtransfer(cdxfer: ULONG) return PDRAGTRANSFER;

   function DrgDeleteDraginfoStrHandles(pdinfo: PDRAGINFO) return BOOL;

   function DrgDeleteStrHandle(hstr_hstr: HSTR) return BOOL;

   function DrgDrag(hwndSource : HWND;
                    pdinfo     : PDRAGINFO;
                    pdimg      : PDRAGIMAGE;
                    cdimg      : ULONG;
                    vkTerminate: LONG;
                    pReserved  : PVOID)
                                 return HWND;

   function DrgDragFiles(hwnd_hwnd        : HWND;
                         apszFiles    : PPSZ;
                         apszTypes    : PPSZ;
                         apszTargets  : PPSZ;
                         cFiles       : ULONG;
                         hptrDrag     : HPOINTER;
                         vkTerm       : ULONG;
                         fSourceRender: BOOL;
                         ulReserved   : ULONG)
                                        return BOOL;

   function DrgFreeDraginfo(pdinfo: PDRAGINFO) return BOOL;

   function DrgFreeDragtransfer(pdxfer: PDRAGTRANSFER) return BOOL;

   function DrgGetPS(hwnd_hwnd: HWND) return HPS;

   function DrgPostTransferMsg(hwnd_hwnd     : HWND;
                               msg       : ULONG;
                               pdxfer    : PDRAGTRANSFER;
                               fl        : ULONG;
                               ulReserved: ULONG;
                               fRetry    : BOOL)
                                           return BOOL;

   function DrgPushDraginfo(pdinfo  : PDRAGINFO;
                            hwndDest: HWND)
                                      return BOOL;

   function DrgQueryDragitem(pdinfo  : PDRAGINFO;
                             cbBuffer: ULONG;
                             pditem  : PDRAGITEM;
                             iItem   : ULONG)
                                       return BOOL;

   function DrgQueryDragitemCount(pdinfo: PDRAGINFO) return ULONG;

   function DrgQueryDragitemPtr(pdinfo : PDRAGINFO;
                                ulIndex: ULONG)
                                         return PDRAGITEM;

   function DrgQueryNativeRMF(pditem  : PDRAGITEM;
                              cbBuffer: ULONG;
                              pBuffer : PCHAR)
                                        return BOOL;

   function DrgQueryNativeRMFLen(pditem: PDRAGITEM) return ULONG;

   function DrgQueryStrName(hstr_hstr   : HSTR;
                            cbBuffer: ULONG;
                            pBuffer : PSZ)
                                      return ULONG;

   function DrgQueryStrNameLen(hstr_hstr: HSTR) return ULONG;

   function DrgQueryTrueType(pditem  : PDRAGITEM;
                             cbBuffer: ULONG;
                             pBuffer : PSZ)
                                       return BOOL;

   function DrgQueryTrueTypeLen(pditem: PDRAGITEM) return ULONG;

   function DrgReleasePS(hps_hps: HPS) return BOOL;

   function DrgSendTransferMsg(hwnd_hwnd: HWND;
                               msg : ULONG;
                               mp1 : MPARAM;
                               mp2 : MPARAM)
                                     return MRESULT;

   function DrgSetDragImage(pdinfo   : PDRAGINFO;
                            pdimg    : PDRAGIMAGE;
                            cdimg    : ULONG;
                            pReserved: PVOID)
                                       return BOOL;

   function DrgSetDragitem(pdinfo  : PDRAGINFO;
                           pditem  : PDRAGITEM;
                           cbBuffer: ULONG;
                           iItem   : ULONG)
                                     return BOOL;

   function DrgSetDragPointer(pdinfo: PDRAGINFO;
                              hptr  : HPOINTER)
                                      return BOOL;

   function DrgVerifyNativeRMF(pditem: PDRAGITEM;
                               pszRMF: PCSZ)
                                       return BOOL;

   function DrgVerifyRMF(pditem : PDRAGITEM;
                         pszMech: PCSZ;
                         pszFmt : PCSZ)
                                  return BOOL;

   function DrgVerifyTrueType(pditem : PDRAGITEM;
                              pszType: PCSZ)
                                       return BOOL;

   function DrgVerifyType(pditem : PDRAGITEM;
                          pszType: PCSZ)
                                   return BOOL;

   function DrgVerifyTypeSet(pditem  : PDRAGITEM;
                             pszType : PCSZ;
                             cbMatch : ULONG;
                             pszMatch: PSZ)
                                       return BOOL;

   function WinCreateObject(pszClassName  : PCSZ;
                            pszTitle      : PCSZ;
                            pszSetupString: PCSZ;
                            pszLocation   : PCSZ;
                            ulFlags       : ULONG)
                                            return HOBJECT;

   function WinDeregisterObjectClass(pszClassName: PCSZ) return BOOL;

   function WinDestroyObject(hObject_hObject: HOBJECT) return BOOL;

   function WinEnumObjectClasses(pObjClass_pObjClass: POBJCLASS;
                                 pulSize  : PULONG)
                                            return BOOL;

   function WinQueryObject(pszObjectID: PCSZ) return HOBJECT;

   function WinRegisterObjectClass(pszClassName: PCSZ;
                                   pszModName  : PCSZ)
                                                 return BOOL;

   function WinReplaceObjectClass(pszOldClassName: PCSZ;
                                  pszNewClassName: PCSZ;
                                  fReplace       : BOOL)
                                                   return BOOL;

   function WinSetObjectData(hObject_hObject       : HOBJECT;
                             pszSetupString: PCSZ)
                                             return BOOL;

   function WinFreeFileIcon(hptr: HPOINTER) return BOOL;

   function WinLoadFileIcon(pszFileName: PCSZ;
                            fPrivate   : BOOL)
                                         return HPOINTER;

   function WinRestoreWindowPos(pszAppName: PCSZ;
                                pszKeyName: PCSZ;
                                hwnd_hwnd     : HWND)
                                            return BOOL;

   function WinSetFileIcon(pszFileName: PCSZ;
                           pIconInfo_pIconInfo  : PICONINFO)
                                        return BOOL;

   function WinShutdownSystem(hab_hab: HAB;
                              hmq_hmq: HMQ)
                                   return BOOL;

   function WinStoreWindowPos(pszAppName: PCSZ;
                              pszKeyName: PCSZ;
                              hwnd_hwnd     : HWND)
                                          return BOOL;

   function SplStdClose(hdc_hdc: HDC) return BOOL;

   function SplStdDelete(hMetaFile: HSTD) return BOOL;

   function SplStdGetBits(hMetaFile: HSTD;
                          offData  : LONG;
                          cbData   : LONG;
                          pchData  : PCH)
                                     return BOOL;

   function SplStdOpen(hdc_hdc: HDC) return BOOL;

   function SplStdQueryLength(hMetaFile: HSTD) return LONG;

   function SplStdStart(hdc_hdc: HDC) return BOOL;

   function SplStdStop(hdc_hdc: HDC) return HSTD;

   function SplControlDevice(pszComputerName: PSZ;
                             pszPortName    : PSZ;
                             ulControl      : ULONG)
                                              return SPLERR;

   function SplCopyJob(pszSrcComputerName: PSZ;
                       pszSrcQueueName   : PSZ;
                       ulSrcJob          : ULONG;
                       pszTrgComputerName: PSZ;
                       pszTrgQueueName   : PSZ;
                       pulTrgJob         : PULONG)
                                           return SPLERR;

   function SplCreateDevice(pszComputerName: PSZ;
                            ulLevel        : ULONG;
                            pBuf           : PVOID;
                            cbBuf          : ULONG)
                                             return SPLERR;

   function SplCreateQueue(pszComputerName: PSZ;
                           ulLevel        : ULONG;
                           pBuf           : PVOID;
                           cbBuf          : ULONG)
                                            return SPLERR;

   function SplDeleteDevice(pszComputerName   : PSZ;
                            pszPrintDeviceName: PSZ)
                                                return SPLERR;

   function SplDeleteJob(pszComputerName: PSZ;
                         pszQueueName   : PSZ;
                         ulJob          : ULONG)
                                          return SPLERR;

   function SplDeleteQueue(pszComputerName: PSZ;
                           pszQueueName   : PSZ)
                                            return SPLERR;

   function SplEnumDevice(pszComputerName: PSZ;
                          ulLevel        : ULONG;
                          pBuf           : PVOID;
                          cbBuf          : ULONG;
                          pcReturned     : PULONG;
                          pcTotal        : PULONG;
                          pcbNeeded      : PULONG;
                          pReserved      : PVOID)
                                           return SPLERR;

   function SplEnumDriver(pszComputerName: PSZ;
                          ulLevel        : ULONG;
                          pBuf           : PVOID;
                          cbBuf          : ULONG;
                          pcReturned     : PULONG;
                          pcTotal        : PULONG;
                          pcbNeeded      : PULONG;
                          pReserved      : PVOID)
                                           return SPLERR;

   function SplEnumJob(pszComputerName: PSZ;
                       pszQueueName   : PSZ;
                       ulLevel        : ULONG;
                       pBuf           : PVOID;
                       cbBuf          : ULONG;
                       pcReturned     : PULONG;
                       pcTotal        : PULONG;
                       pcbNeeded      : PULONG;
                       pReserved      : PVOID)
                                        return SPLERR;

   function SplEnumPort(pszComputerName: PSZ;
                        ulLevel        : ULONG;
                        pBuf           : PVOID;
                        cbBuf          : ULONG;
                        pcReturned     : PULONG;
                        pcTotal        : PULONG;
                        pcbNeeded      : PULONG;
                        pReserved      : PVOID)
                                         return SPLERR;

   function SplEnumPrinter(pszComputerName: PSZ;
                           uLevel         : ULONG;
                           flType         : ULONG;
                           pBuf           : PVOID;
                           cbbuf          : ULONG;
                           pcReturned     : PULONG;
                           pcTotal        : PULONG;
                           pcbNeeded      : PULONG;
                           pReserved      : PVOID)
                                            return SPLERR;

   function SplEnumQueue(pszComputerName: PSZ;
                         ulLevel        : ULONG;
                         pBuf           : PVOID;
                         cbBuf          : ULONG;
                         pcReturned     : PULONG;
                         pcTotal        : PULONG;
                         pcbNeeded      : PULONG;
                         pReserved      : PVOID)
                                          return SPLERR;

   function SplEnumQueueProcessor(pszComputerName: PSZ;
                                  ulLevel        : ULONG;
                                  pBuf           : PVOID;
                                  cbBuf          : ULONG;
                                  pcReturned     : PULONG;
                                  pcTotal        : PULONG;
                                  pcbNeeded      : PULONG;
                                  pReserved      : PVOID)
                                                   return SPLERR;

   function SplHoldJob(pszComputerName: PSZ;
                       pszQueueName   : PSZ;
                       ulJob          : ULONG)
                                        return SPLERR;

   function SplHoldQueue(pszComputerName: PSZ;
                         pszQueueName   : PSZ)
                                          return SPLERR;

   function SplPurgeQueue(pszComputerName: PSZ;
                          pszQueueName   : PSZ)
                                           return SPLERR;

   function SplQueryDevice(pszComputerName   : PSZ;
                           pszPrintDeviceName: PSZ;
                           ulLevel           : ULONG;
                           pBuf              : PVOID;
                           cbBuf             : ULONG;
                           pcbNeeded         : PULONG)
                                               return SPLERR;

   function SplQueryJob(pszComputerName: PSZ;
                        pszQueueName   : PSZ;
                        ulJob          : ULONG;
                        ulLevel        : ULONG;
                        pBuf           : PVOID;
                        cbBuf          : ULONG;
                        pcbNeeded      : PULONG)
                                         return SPLERR;

   function SplQueryQueue(pszComputerName: PSZ;
                          pszQueueName   : PSZ;
                          ulLevel        : ULONG;
                          pBuf           : PVOID;
                          cbBuf          : ULONG;
                          pcbNeeded      : PULONG)
                                           return SPLERR;

   function SplReleaseJob(pszComputerName: PSZ;
                          pszQueueName   : PSZ;
                          ulJob          : ULONG)
                                           return SPLERR;

   function SplReleaseQueue(pszComputerName: PSZ;
                            pszQueueName   : PSZ)
                                             return SPLERR;

   function SplSetDevice(pszComputerName   : PSZ;
                         pszPrintDeviceName: PSZ;
                         ulLevel           : ULONG;
                         pBuf              : PVOID;
                         cbBuf             : ULONG;
                         ulParmNum         : ULONG)
                                             return SPLERR;

   function SplSetJob(pszComputerName: PSZ;
                      pszQueueName   : PSZ;
                      ulJob          : ULONG;
                      ulLevel        : ULONG;
                      pBuf           : PVOID;
                      cbBuf          : ULONG;
                      ulParmNum      : ULONG)
                                       return SPLERR;

   function SplSetQueue(pszComputerName: PSZ;
                        pszQueueName   : PSZ;
                        ulLevel        : ULONG;
                        pBuf           : PVOID;
                        cbBuf          : ULONG;
                        ulParmNum      : ULONG)
                                         return SPLERR;

   function SplMessageBox(pszLogAddr: PSZ;
                          fErrInfo  : ULONG;
                          fErrData  : ULONG;
                          pszText   : PSZ;
                          pszCaption: PSZ;
                          idWindow  : ULONG;
                          fStyle    : ULONG)
                                      return ULONG;

   function SplQmAbort(hspl_hspl: HSPL) return BOOL;

   function SplQmAbortDoc(hspl_hspl: HSPL) return BOOL;

   function SplQmClose(hspl_hspl: HSPL) return BOOL;

   function SplQmEndDoc(hspl_hspl: HSPL) return BOOL;

   function SplQmOpen(pszToken  : PSZ;
                      lCount    : LONG;
                      pqmdopData: PQMOPENDATA)
                                  return HSPL;

   function SplQmStartDoc(hspl_hspl      : HSPL;
                          pszDocName: PSZ)
                                      return BOOL;

   function SplQmWrite(hspl_hspl  : HSPL;
                       lCount: LONG;
                       pData : PVOID)
                               return BOOL;

   function WinAssociateHelpInstance(hwndHelpInstance: HWND;
                                     hwndApp         : HWND)
                                                       return BOOL;

   function WinCreateHelpInstance(hab_hab                  : HAB;
                                  phinitHMInitStructure: PHELPINIT)
                                                         return HWND;

   function WinCreateHelpTable(hwndHelpInstance: HWND;
                               phtHelpTable    : PHELPTABLE)
                                                 return BOOL;

   function WinDestroyHelpInstance(hwndHelpInstance: HWND) return BOOL;

   function WinLoadHelpTable(hwndHelpInstance: HWND;
                             idHelpTable     : ULONG;
                             Module          : HMODULE)
                                               return BOOL;

   function WinQueryHelpInstance(hwndApp: HWND) return HWND;

   function DdfBeginList(hddf_hddf      : HDDF;
                         ulWidthDT : ULONG;
                         fBreakType: ULONG;
                         fSpacing  : ULONG)
                                     return BOOL;

   function DdfBitmap(hddf_hddf  : HDDF;
                      hbm   : HBITMAP;
                      fAlign: ULONG)
                              return BOOL;

   function DdfEndList(hddf_hddf: HDDF) return BOOL;

   function DdfHyperText(hddf_hddf          : HDDF;
                         pszText       : PCSZ;
                         pszReference  : PCSZ;
                         fReferenceType: ULONG)
                                         return BOOL;

   function DdfInform(hddf_hddf           : HDDF;
                      pszText        : PCSZ;
                      resInformNumber: ULONG)
                                       return BOOL;

   function DdfInitialize(hwndHelpInstance: HWND;
                          cbBuffer        : ULONG;
                          ulIncrement     : ULONG)
                                            return HDDF;

   function DdfListItem(hddf_hddf          : HDDF;
                        pszTerm       : PCSZ;
                        pszDescription: PCSZ)
                                        return BOOL;

   function DdfMetafile(hddf_hddf    : HDDF;
                        hmf_hmf     : HMF;
                        prclRect: PRECTL)
                                  return BOOL;

   function DdfPara(hddf_hddf: HDDF) return BOOL;

   function DdfSetColor(hddf_hddf      : HDDF;
                        fBackColor: COLOR;
                        fForColor : COLOR)
                                    return BOOL;

   function DdfSetFont(hddf_hddf       : HDDF;
                       pszFaceName: PCSZ;
                       ulWidth    : ULONG;
                       ulHeight   : ULONG)
                                    return BOOL;

   function DdfSetFontStyle(hddf_hddf      : HDDF;
                            fFontStyle: ULONG)
                                        return BOOL;

   function DdfSetFormat(hddf_hddf       : HDDF;
                         fFormatType: ULONG)
                                      return BOOL;

   function DdfSetTextAlign(hddf_hddf  : HDDF;
                            fAlign: ULONG)
                                    return BOOL;

   function DdfText(hddf_hddf   : HDDF;
                    pszText: PCSZ)
                             return BOOL;

private


    pragma Import(C, WinCancelShutdown, "WinCancelShutdown");

    pragma Import(C, WinCreateMsgQueue, "WinCreateMsgQueue");

    pragma Import(C, WinDestroyMsgQueue, "WinDestroyMsgQueue");

    pragma Import(C, WinDispatchMsg, "WinDispatchMsg");

    pragma Import(C, WinGetMsg, "WinGetMsg");

    pragma Import(C, WinPeekMsg, "WinPeekMsg");

    pragma Import(C, WinPostMsg, "WinPostMsg");

    pragma Import(C, WinQueryQueueInfo, "WinQueryQueueInfo");

    pragma Import(C, WinRegisterUserDatatype, "WinRegisterUserDatatype");

    pragma Import(C, WinRegisterUserMsg, "WinRegisterUserMsg");

    pragma Import(C, WinSendMsg, "WinSendMsg");

    pragma Import(C, WinSetMsgMode, "WinSetMsgMode");

    pragma Import(C, WinSetSynchroMode, "WinSetSynchroMode");

    pragma Import(C, WinCreateWindow, "WinCreateWindow");

    pragma Import(C, WinDrawBitmap, "WinDrawBitmap");

    pragma Import(C, WinDrawBorder, "WinDrawBorder");

    pragma Import(C, WinDrawText, "WinDrawText");

    pragma Import(C, WinEnableWindow, "WinEnableWindow");

    pragma Import(C, WinEnableWindowUpdate, "WinEnableWindowUpdate");

    pragma Import(C, WinInvalidateRect, "WinInvalidateRect");

    pragma Import(C, WinInvalidateRegion, "WinInvalidateRegion");

    pragma Import(C, WinInvertRect, "WinInvertRect");

    pragma Import(C, WinIsChild, "WinIsChild");

    pragma Import(C, WinIsWindow, "WinIsWindow");

    pragma Import(C, WinIsWindowEnabled, "WinIsWindowEnabled");

    pragma Import(C, WinIsWindowVisible, "WinIsWindowVisible");

    pragma Import(C, WinLoadMessage, "WinLoadMessage");

    pragma Import(C, WinLoadString, "WinLoadString");

    pragma Import(C, WinMultWindowFromIDs, "WinMultWindowFromIDs");

    pragma Import(C, WinQueryDesktopWindow, "WinQueryDesktopWindow");

    pragma Import(C, WinQueryObjectWindow, "WinQueryObjectWindow");

    pragma Import(C, WinQueryPointer, "WinQueryPointer");

    pragma Import(C, WinQueryWindow, "WinQueryWindow");

    pragma Import(C, WinQueryWindowPos, "WinQueryWindowPos");

    pragma Import(C, WinQueryWindowProcess, "WinQueryWindowProcess");

    pragma Import(C, WinQueryWindowText, "WinQueryWindowText");

    pragma Import(C, WinQueryWindowTextLength, "WinQueryWindowTextLength");

    pragma Import(C, WinSetMultWindowPos, "WinSetMultWindowPos");

    pragma Import(C, WinSetOwner, "WinSetOwner");

    pragma Import(C, WinSetParent, "WinSetParent");

    pragma Import(C, WinSetWindowPos, "WinSetWindowPos");

    pragma Import(C, WinSetWindowText, "WinSetWindowText");

    pragma Import(C, WinUpdateWindow, "WinUpdateWindow");

    pragma Import(C, WinWindowFromID, "WinWindowFromID");

    pragma Import(C, WinCreateStdWindow, "WinCreateStdWindow");

    pragma Import(C, WinCalcFrameRect, "WinCalcFrameRect");

    pragma Import(C, WinCreateFrameControls, "WinCreateFrameControls");

    pragma Import(C, WinFlashWindow, "WinFlashWindow");

    pragma Import(C, WinGetMaxPosition, "WinGetMaxPosition");

    pragma Import(C, WinGetMinPosition, "WinGetMinPosition");

    pragma Import(C, WinSaveWindowPos, "WinSaveWindowPos");

    pragma Import(C, WinBeginPaint, "WinBeginPaint");

    pragma Import(C, WinDefWindowProc, "WinDefWindowProc");

    pragma Import(C, WinDestroyWindow, "WinDestroyWindow");

    pragma Import(C, WinEndPaint, "WinEndPaint");

    pragma Import(C, WinFillRect, "WinFillRect");

    pragma Import(C, WinGetClipPS, "WinGetClipPS");

    pragma Import(C, WinGetPS, "WinGetPS");

    pragma Import(C, WinInitialize, "WinInitialize");

    pragma Import(C, WinIsWindowShowing, "WinIsWindowShowing");

    pragma Import(C, WinOpenWindowDC, "WinOpenWindowDC");

    pragma Import(C, WinQueryAnchorBlock, "WinQueryAnchorBlock");

    pragma Import(C, WinQueryVersion, "WinQueryVersion");

    pragma Import(C, WinQueryWindowRect, "WinQueryWindowRect");

    pragma Import(C, WinRegisterClass, "WinRegisterClass");

    pragma Import(C, WinReleasePS, "WinReleasePS");

    pragma Import(C, WinScrollWindow, "WinScrollWindow");

    pragma Import(C, WinSetActiveWindow, "WinSetActiveWindow");

    pragma Import(C, WinShowWindow, "WinShowWindow");

    pragma Import(C, WinTerminate, "WinTerminate");

    pragma Import(C, WinBeginEnumWindows, "WinBeginEnumWindows");

    pragma Import(C, WinEndEnumWindows, "WinEndEnumWindows");

    pragma Import(C, WinExcludeUpdateRegion, "WinExcludeUpdateRegion");

    pragma Import(C, WinGetNextWindow, "WinGetNextWindow");

    pragma Import(C, WinGetScreenPS, "WinGetScreenPS");

    pragma Import(C, WinIsThreadActive, "WinIsThreadActive");

    pragma Import(C, WinLockVisRegions, "WinLockVisRegions");

    pragma Import(C, WinLockWindowUpdate, "WinLockWindowUpdate");

    pragma Import(C, WinMapWindowPoints, "WinMapWindowPoints");

    pragma Import(C, WinQueryActiveWindow, "WinQueryActiveWindow");

    pragma Import(C, WinQueryClassInfo, "WinQueryClassInfo");

    pragma Import(C, WinQueryClassName, "WinQueryClassName");

    pragma Import(C, WinQueryUpdateRect, "WinQueryUpdateRect");

    pragma Import(C, WinQueryUpdateRegion, "WinQueryUpdateRegion");

    pragma Import(C, WinQuerySysModalWindow, "WinQuerySysModalWindow");

    pragma Import(C, WinQueryWindowDC, "WinQueryWindowDC");

    pragma Import(C, WinQueryWindowPtr, "WinQueryWindowPtr");

    pragma Import(C, WinQueryWindowULong, "WinQueryWindowULong");

    pragma Import(C, WinQueryWindowUShort, "WinQueryWindowUShort");

    pragma Import(C, WinSetSysModalWindow, "WinSetSysModalWindow");

    pragma Import(C, WinSetWindowBits, "WinSetWindowBits");

    pragma Import(C, WinSetWindowPtr, "WinSetWindowPtr");

    pragma Import(C, WinSetWindowULong, "WinSetWindowULong");

    pragma Import(C, WinSetWindowUShort, "WinSetWindowUShort");

    pragma Import(C, WinSubclassWindow, "WinSubclassWindow");

    pragma Import(C, WinValidateRect, "WinValidateRect");

    pragma Import(C, WinValidateRegion, "WinValidateRegion");

    pragma Import(C, WinWindowFromDC, "WinWindowFromDC");

    pragma Import(C, WinWindowFromPoint, "WinWindowFromPoint");

    pragma Import(C, WinCopyAccelTable, "WinCopyAccelTable");

    pragma Import(C, WinCreateAccelTable, "WinCreateAccelTable");

    pragma Import(C, WinDestroyAccelTable, "WinDestroyAccelTable");

    pragma Import(C, WinLoadAccelTable, "WinLoadAccelTable");

    pragma Import(C, WinQueryAccelTable, "WinQueryAccelTable");

    pragma Import(C, WinSetAccelTable, "WinSetAccelTable");

    pragma Import(C, WinTranslateAccel, "WinTranslateAccel");

    pragma Import(C, WinAddAtom, "WinAddAtom");

    pragma Import(C, WinCreateAtomTable, "WinCreateAtomTable");

    pragma Import(C, WinDeleteAtom, "WinDeleteAtom");

    pragma Import(C, WinDestroyAtomTable, "WinDestroyAtomTable");

    pragma Import(C, WinFindAtom, "WinFindAtom");

    pragma Import(C, WinQueryAtomLength, "WinQueryAtomLength");

    pragma Import(C, WinQueryAtomName, "WinQueryAtomName");

    pragma Import(C, WinQueryAtomUsage, "WinQueryAtomUsage");

    pragma Import(C, WinQuerySystemAtomTable, "WinQuerySystemAtomTable");

    pragma Import(C, WinCloseClipbrd, "WinCloseClipbrd");

    pragma Import(C, WinEmptyClipbrd, "WinEmptyClipbrd");

    pragma Import(C, WinEnumClipbrdFmts, "WinEnumClipbrdFmts");

    pragma Import(C, WinOpenClipbrd, "WinOpenClipbrd");

    pragma Import(C, WinQueryClipbrdData, "WinQueryClipbrdData");

    pragma Import(C, WinQueryClipbrdFmtInfo, "WinQueryClipbrdFmtInfo");

    pragma Import(C, WinQueryClipbrdOwner, "WinQueryClipbrdOwner");

    pragma Import(C, WinQueryClipbrdViewer, "WinQueryClipbrdViewer");

    pragma Import(C, WinSetClipbrdData, "WinSetClipbrdData");

    pragma Import(C, WinSetClipbrdOwner, "WinSetClipbrdOwner");

    pragma Import(C, WinSetClipbrdViewer, "WinSetClipbrdViewer");

    pragma Import(C, WinDdeInitiate, "WinDdeInitiate");

    pragma Import(C, WinDdePostMsg, "WinDdePostMsg");

    pragma Import(C, WinDdeRespond, "WinDdeRespond");

    pragma Import(C, WinCompareStrings, "WinCompareStrings");

    pragma Import(C, WinCpTranslateChar, "WinCpTranslateChar");

    pragma Import(C, WinCpTranslateString, "WinCpTranslateString");

    pragma Import(C, WinNextChar, "WinNextChar");

    pragma Import(C, WinPrevChar, "WinPrevChar");

    pragma Import(C, WinQueryCp, "WinQueryCp");

    pragma Import(C, WinQueryCpList, "WinQueryCpList");

    pragma Import(C, WinSetCp, "WinSetCp");

    pragma Import(C, WinUpper, "WinUpper");

    pragma Import(C, WinUpperChar, "WinUpperChar");

    pragma Import(C, WinCreateCursor, "WinCreateCursor");

    pragma Import(C, WinDestroyCursor, "WinDestroyCursor");

    pragma Import(C, WinShowCursor, "WinShowCursor");

    pragma Import(C, WinQueryCursorInfo, "WinQueryCursorInfo");

    pragma Import(C, WinQueryDesktopBkgnd, "WinQueryDesktopBkgnd");

    pragma Import(C, WinSetDesktopBkgnd, "WinSetDesktopBkgnd");

    pragma Import(C, WinAlarm, "WinAlarm");

    pragma Import(C, WinDefDlgProc, "WinDefDlgProc");

    pragma Import(C, WinDismissDlg, "WinDismissDlg");

    pragma Import(C, WinDlgBox, "WinDlgBox");

    pragma Import(C, WinGetDlgMsg, "WinGetDlgMsg");

    pragma Import(C, WinLoadDlg, "WinLoadDlg");

    pragma Import(C, WinMessageBox, "WinMessageBox");

    pragma Import(C, WinQueryDlgItemShort, "WinQueryDlgItemShort");

    pragma Import(C, WinQueryDlgItemText, "WinQueryDlgItemText");

    pragma Import(C, WinQueryDlgItemTextLength, "WinQueryDlgItemTextLength");

    pragma Import(C, WinSetDlgItemShort, "WinSetDlgItemShort");

    pragma Import(C, WinSetDlgItemText, "WinSetDlgItemText");

    pragma Import(C, WinCreateDlg, "WinCreateDlg");

    pragma Import(C, WinEnumDlgItem, "WinEnumDlgItem");

    pragma Import(C, WinMapDlgPoints, "WinMapDlgPoints");

    pragma Import(C, WinProcessDlg, "WinProcessDlg");

    pragma Import(C, WinSendDlgItemMsg, "WinSendDlgItemMsg");

    pragma Import(C, WinSubstituteStrings, "WinSubstituteStrings");

    pragma Import(C, WinGetLastError, "WinGetLastError");

    pragma Import(C, WinFreeErrorInfo, "WinFreeErrorInfo");

    pragma Import(C, WinGetErrorInfo, "WinGetErrorInfo");

    pragma Import(C, WinCallMsgFilter, "WinCallMsgFilter");

    pragma Import(C, WinReleaseHook, "WinReleaseHook");

    pragma Import(C, WinSetHook, "WinSetHook");

    pragma Import(C, WinFocusChange, "WinFocusChange");

    pragma Import(C, WinLockupSystem, "WinLockupSystem");

    pragma Import(C, WinSetFocus, "WinSetFocus");

    pragma Import(C, WinUnlockSystem, "WinUnlockSystem");

    pragma Import(C, WinCheckInput, "WinCheckInput");

    pragma Import(C, WinEnablePhysInput, "WinEnablePhysInput");

    pragma Import(C, WinGetKeyState, "WinGetKeyState");

    pragma Import(C, WinGetPhysKeyState, "WinGetPhysKeyState");

    pragma Import(C, WinIsPhysInputEnabled, "WinIsPhysInputEnabled");

    pragma Import(C, WinQueryCapture, "WinQueryCapture");

    pragma Import(C, WinQueryFocus, "WinQueryFocus");

    pragma Import(C, WinQueryVisibleRegion, "WinQueryVisibleRegion");

    pragma Import(C, WinSetCapture, "WinSetCapture");

    pragma Import(C, WinSetKeyboardStateTable, "WinSetKeyboardStateTable");

    pragma Import(C, WinSetVisibleRegionNotify, "WinSetVisibleRegionNotify");

    pragma Import(C, WinDeleteLibrary, "WinDeleteLibrary");

    pragma Import(C, WinDeleteProcedure, "WinDeleteProcedure");

    pragma Import(C, WinLoadLibrary, "WinLoadLibrary");

    pragma Import(C, WinLoadProcedure, "WinLoadProcedure");

    pragma Import(C, WinCreateMenu, "WinCreateMenu");

    pragma Import(C, WinLoadMenu, "WinLoadMenu");

    pragma Import(C, WinPopupMenu, "WinPopupMenu");

    pragma Import(C, WinBroadcastMsg, "WinBroadcastMsg");

    pragma Import(C, WinInSendMsg, "WinInSendMsg");

    pragma Import(C, WinPostQueueMsg, "WinPostQueueMsg");

    pragma Import(C, WinQueryMsgPos, "WinQueryMsgPos");

    pragma Import(C, WinQueryMsgTime, "WinQueryMsgTime");

    pragma Import(C, WinQueryQueueStatus, "WinQueryQueueStatus");

    pragma Import(C, WinRequestMutexSem, "WinRequestMutexSem");

    pragma Import(C, WinSetClassMsgInterest, "WinSetClassMsgInterest");

    pragma Import(C, WinSetMsgInterest, "WinSetMsgInterest");

    pragma Import(C, WinWaitEventSem, "WinWaitEventSem");

    pragma Import(C, WinWaitMsg, "WinWaitMsg");

    pragma Import(C, WinWaitMuxWaitSem, "WinWaitMuxWaitSem");

    pragma Import(C, WinRealizePalette, "WinRealizePalette");

    pragma Import(C, WinCreatePointer, "WinCreatePointer");

    pragma Import(C, WinCreatePointerIndirect, "WinCreatePointerIndirect");

    pragma Import(C, WinDestroyPointer, "WinDestroyPointer");

    pragma Import(C, WinDrawPointer, "WinDrawPointer");

    pragma Import(C, WinGetSysBitmap, "WinGetSysBitmap");

    pragma Import(C, WinLoadPointer, "WinLoadPointer");

    pragma Import(C, WinLockPointerUpdate, "WinLockPointerUpdate");

    pragma Import(C, WinQueryPointerPos, "WinQueryPointerPos");

    pragma Import(C, WinQueryPointerInfo, "WinQueryPointerInfo");

    pragma Import(C, WinQuerySysPointer, "WinQuerySysPointer");

    pragma Import(C, WinQuerySysPointerData, "WinQuerySysPointerData");

    pragma Import(C, WinSetPointer, "WinSetPointer");

    pragma Import(C, WinSetPointerOwner, "WinSetPointerOwner");

    pragma Import(C, WinSetPointerPos, "WinSetPointerPos");

    pragma Import(C, WinSetSysPointerData, "WinSetSysPointerData");

    pragma Import(C, WinShowPointer, "WinShowPointer");

    pragma Import(C, WinCopyRect, "WinCopyRect");

    pragma Import(C, WinEqualRect, "WinEqualRect");

    pragma Import(C, WinInflateRect, "WinInflateRect");

    pragma Import(C, WinIntersectRect, "WinIntersectRect");

    pragma Import(C, WinIsRectEmpty, "WinIsRectEmpty");

    pragma Import(C, WinMakePoints, "WinMakePoints");

    pragma Import(C, WinMakeRect, "WinMakeRect");

    pragma Import(C, WinOffsetRect, "WinOffsetRect");

    pragma Import(C, WinPtInRect, "WinPtInRect");

    pragma Import(C, WinSetRect, "WinSetRect");

    pragma Import(C, WinSetRectEmpty, "WinSetRectEmpty");

    pragma Import(C, WinSubtractRect, "WinSubtractRect");

    pragma Import(C, WinUnionRect, "WinUnionRect");

    pragma Import(C, WinQueryPresParam, "WinQueryPresParam");

    pragma Import(C, WinQuerySysColor, "WinQuerySysColor");

    pragma Import(C, WinQuerySysValue, "WinQuerySysValue");

    pragma Import(C, WinRemovePresParam, "WinRemovePresParam");

    pragma Import(C, WinSetPresParam, "WinSetPresParam");

    pragma Import(C, WinSetSysColors, "WinSetSysColors");

    pragma Import(C, WinSetSysValue, "WinSetSysValue");

    pragma Import(C, WinQueryClassThunkProc, "WinQueryClassThunkProc");

    pragma Import(C, WinQueryWindowModel, "WinQueryWindowModel");

    pragma Import(C, WinQueryWindowThunkProc, "WinQueryWindowThunkProc");

    pragma Import(C, WinSetClassThunkProc, "WinSetClassThunkProc");

    pragma Import(C, WinSetWindowThunkProc, "WinSetWindowThunkProc");

    pragma Import(C, WinGetCurrentTime, "WinGetCurrentTime");

    pragma Import(C, WinStartTimer, "WinStartTimer");

    pragma Import(C, WinStopTimer, "WinStopTimer");

    pragma Import(C, WinShowTrackRect, "WinShowTrackRect");

    pragma Import(C, WinTrackRect, "WinTrackRect");

    pragma Import(C, GpiAnimatePalette, "GpiAnimatePalette");

    pragma Import(C, GpiAssociate, "GpiAssociate");

    pragma Import(C, GpiBeginArea, "GpiBeginArea");

    pragma Import(C, GpiBeginElement, "GpiBeginElement");

    pragma Import(C, GpiBeginPath, "GpiBeginPath");

    pragma Import(C, GpiBitBlt, "GpiBitBlt");

    pragma Import(C, GpiBox, "GpiBox");

    pragma Import(C, GpiCallSegmentMatrix, "GpiCallSegmentMatrix");

    pragma Import(C, GpiCharString, "GpiCharString");

    pragma Import(C, GpiCharStringAt, "GpiCharStringAt");

    pragma Import(C, GpiCharStringPos, "GpiCharStringPos");

    pragma Import(C, GpiCharStringPosAt, "GpiCharStringPosAt");

    pragma Import(C, GpiCloseFigure, "GpiCloseFigure");

    pragma Import(C, GpiCloseSegment, "GpiCloseSegment");

    pragma Import(C, GpiCombineRegion, "GpiCombineRegion");

    pragma Import(C, GpiComment, "GpiComment");

    pragma Import(C, GpiConvert, "GpiConvert");

    pragma Import(C, GpiConvertWithMatrix, "GpiConvertWithMatrix");

    pragma Import(C, GpiCopyMetaFile, "GpiCopyMetaFile");

    pragma Import(C, GpiCorrelateChain, "GpiCorrelateChain");

    pragma Import(C, GpiCorrelateFrom, "GpiCorrelateFrom");

    pragma Import(C, GpiCorrelateSegment, "GpiCorrelateSegment");

    pragma Import(C, GpiCreateBitmap, "GpiCreateBitmap");

    pragma Import(C, GpiCreateLogColorTable, "GpiCreateLogColorTable");

    pragma Import(C, GpiCreateLogFont, "GpiCreateLogFont");

    pragma Import(C, GpiCreatePalette, "GpiCreatePalette");

    pragma Import(C, GpiCreatePS, "GpiCreatePS");

    pragma Import(C, GpiCreateRegion, "GpiCreateRegion");

    pragma Import(C, GpiDeleteBitmap, "GpiDeleteBitmap");

    pragma Import(C, GpiDeleteElement, "GpiDeleteElement");

    pragma Import(C, GpiDeleteElementRange, "GpiDeleteElementRange");

    pragma Import(C, GpiDeleteElementsBetweenLabels, "GpiDeleteElementsBetweenLabels");

    pragma Import(C, GpiDeleteMetaFile, "GpiDeleteMetaFile");

    pragma Import(C, GpiDeletePalette, "GpiDeletePalette");

    pragma Import(C, GpiDeleteSegment, "GpiDeleteSegment");

    pragma Import(C, GpiDeleteSegments, "GpiDeleteSegments");

    pragma Import(C, GpiDeleteSetId, "GpiDeleteSetId");

    pragma Import(C, GpiDestroyPS, "GpiDestroyPS");

    pragma Import(C, GpiDestroyRegion, "GpiDestroyRegion");

    pragma Import(C, GpiDrawBits, "GpiDrawBits");

    pragma Import(C, GpiDrawChain, "GpiDrawChain");

    pragma Import(C, GpiDrawDynamics, "GpiDrawDynamics");

    pragma Import(C, GpiDrawFrom, "GpiDrawFrom");

    pragma Import(C, GpiDrawSegment, "GpiDrawSegment");

    pragma Import(C, GpiElement, "GpiElement");

    pragma Import(C, GpiEndArea, "GpiEndArea");

    pragma Import(C, GpiEndElement, "GpiEndElement");

    pragma Import(C, GpiEndPath, "GpiEndPath");

    pragma Import(C, GpiEqualRegion, "GpiEqualRegion");

    pragma Import(C, GpiErase, "GpiErase");

    pragma Import(C, GpiErrorSegmentData, "GpiErrorSegmentData");

    pragma Import(C, GpiExcludeClipRectangle, "GpiExcludeClipRectangle");

    pragma Import(C, GpiFillPath, "GpiFillPath");

    pragma Import(C, GpiFloodFill, "GpiFloodFill");

    pragma Import(C, GpiFrameRegion, "GpiFrameRegion");

    pragma Import(C, GpiFullArc, "GpiFullArc");

    pragma Import(C, GpiGetData, "GpiGetData");

    pragma Import(C, GpiImage, "GpiImage");

    pragma Import(C, GpiIntersectClipRectangle, "GpiIntersectClipRectangle");

    pragma Import(C, GpiLabel, "GpiLabel");

    pragma Import(C, GpiLine, "GpiLine");

    pragma Import(C, GpiLoadBitmap, "GpiLoadBitmap");

    pragma Import(C, GpiLoadFonts, "GpiLoadFonts");

    pragma Import(C, GpiLoadMetaFile, "GpiLoadMetaFile");

    pragma Import(C, GpiLoadPublicFonts, "GpiLoadPublicFonts");

    pragma Import(C, GpiMarker, "GpiMarker");

    pragma Import(C, GpiModifyPath, "GpiModifyPath");

    pragma Import(C, GpiMove, "GpiMove");

    pragma Import(C, GpiOffsetClipRegion, "GpiOffsetClipRegion");

    pragma Import(C, GpiOffsetElementPointer, "GpiOffsetElementPointer");

    pragma Import(C, GpiOffsetRegion, "GpiOffsetRegion");

    pragma Import(C, GpiOpenSegment, "GpiOpenSegment");

    pragma Import(C, GpiOutlinePath, "GpiOutlinePath");

    pragma Import(C, GpiPaintRegion, "GpiPaintRegion");

    pragma Import(C, GpiPartialArc, "GpiPartialArc");

    pragma Import(C, GpiPathToRegion, "GpiPathToRegion");

    pragma Import(C, GpiPlayMetaFile, "GpiPlayMetaFile");

    pragma Import(C, GpiPointArc, "GpiPointArc");

    pragma Import(C, GpiPolyFillet, "GpiPolyFillet");

    pragma Import(C, GpiPolyFilletSharp, "GpiPolyFilletSharp");

    pragma Import(C, GpiPolygons, "GpiPolygons");

    pragma Import(C, GpiPolyLine, "GpiPolyLine");

    pragma Import(C, GpiPolyLineDisjoint, "GpiPolyLineDisjoint");

    pragma Import(C, GpiPolyMarker, "GpiPolyMarker");

    pragma Import(C, GpiPolySpline, "GpiPolySpline");

    pragma Import(C, GpiPop, "GpiPop");

    pragma Import(C, GpiPtInRegion, "GpiPtInRegion");

    pragma Import(C, GpiPtVisible, "GpiPtVisible");

    pragma Import(C, GpiPutData, "GpiPutData");

    pragma Import(C, GpiQueryArcParams, "GpiQueryArcParams");

    pragma Import(C, GpiQueryAttrMode, "GpiQueryAttrMode");

    pragma Import(C, GpiQueryAttrs, "GpiQueryAttrs");

    pragma Import(C, GpiQueryBackColor, "GpiQueryBackColor");

    pragma Import(C, GpiQueryBackMix, "GpiQueryBackMix");

    pragma Import(C, GpiQueryBitmapBits, "GpiQueryBitmapBits");

    pragma Import(C, GpiQueryBitmapDimension, "GpiQueryBitmapDimension");

    pragma Import(C, GpiQueryBitmapHandle, "GpiQueryBitmapHandle");

    pragma Import(C, GpiQueryBitmapInfoHeader, "GpiQueryBitmapInfoHeader");

    pragma Import(C, GpiQueryBitmapParameters, "GpiQueryBitmapParameters");

    pragma Import(C, GpiQueryBoundaryData, "GpiQueryBoundaryData");

    pragma Import(C, GpiQueryCharAngle, "GpiQueryCharAngle");

    pragma Import(C, GpiQueryCharBox, "GpiQueryCharBox");

    pragma Import(C, GpiQueryCharBreakExtra, "GpiQueryCharBreakExtra");

    pragma Import(C, GpiQueryCharDirection, "GpiQueryCharDirection");

    pragma Import(C, GpiQueryCharExtra, "GpiQueryCharExtra");

    pragma Import(C, GpiQueryCharMode, "GpiQueryCharMode");

    pragma Import(C, GpiQueryCharSet, "GpiQueryCharSet");

    pragma Import(C, GpiQueryCharShear, "GpiQueryCharShear");

    pragma Import(C, GpiQueryCharStringPos, "GpiQueryCharStringPos");

    pragma Import(C, GpiQueryCharStringPosAt, "GpiQueryCharStringPosAt");

    pragma Import(C, GpiQueryClipBox, "GpiQueryClipBox");

    pragma Import(C, GpiQueryClipRegion, "GpiQueryClipRegion");

    pragma Import(C, GpiQueryColor, "GpiQueryColor");

    pragma Import(C, GpiQueryColorData, "GpiQueryColorData");

    pragma Import(C, GpiQueryColorIndex, "GpiQueryColorIndex");

    pragma Import(C, GpiQueryCp, "GpiQueryCp");

    pragma Import(C, GpiQueryCurrentPosition, "GpiQueryCurrentPosition");

    pragma Import(C, GpiQueryDefArcParams, "GpiQueryDefArcParams");

    pragma Import(C, GpiQueryDefAttrs, "GpiQueryDefAttrs");

    pragma Import(C, GpiQueryDefCharBox, "GpiQueryDefCharBox");

    pragma Import(C, GpiQueryDefTag, "GpiQueryDefTag");

    pragma Import(C, GpiQueryDefViewingLimits, "GpiQueryDefViewingLimits");

    pragma Import(C, GpiQueryDefaultViewMatrix, "GpiQueryDefaultViewMatrix");

    pragma Import(C, GpiQueryDevice, "GpiQueryDevice");

    pragma Import(C, GpiQueryDeviceBitmapFormats, "GpiQueryDeviceBitmapFormats");

    pragma Import(C, GpiQueryDrawControl, "GpiQueryDrawControl");

    pragma Import(C, GpiQueryDrawingMode, "GpiQueryDrawingMode");

    pragma Import(C, GpiQueryEditMode, "GpiQueryEditMode");

    pragma Import(C, GpiQueryElement, "GpiQueryElement");

    pragma Import(C, GpiQueryElementPointer, "GpiQueryElementPointer");

    pragma Import(C, GpiQueryElementType, "GpiQueryElementType");

    pragma Import(C, GpiQueryFaceString, "GpiQueryFaceString");

    pragma Import(C, GpiQueryFontAction, "GpiQueryFontAction");

    pragma Import(C, GpiQueryFontFileDescriptions, "GpiQueryFontFileDescriptions");

    pragma Import(C, GpiQueryFontMetrics, "GpiQueryFontMetrics");

    pragma Import(C, GpiQueryFonts, "GpiQueryFonts");

    pragma Import(C, GpiQueryFullFontFileDescs, "GpiQueryFullFontFileDescs");

    pragma Import(C, GpiQueryGraphicsField, "GpiQueryGraphicsField");

    pragma Import(C, GpiQueryInitialSegmentAttrs, "GpiQueryInitialSegmentAttrs");

    pragma Import(C, GpiQueryKerningPairs, "GpiQueryKerningPairs");

    pragma Import(C, GpiQueryLineEnd, "GpiQueryLineEnd");

    pragma Import(C, GpiQueryLineJoin, "GpiQueryLineJoin");

    pragma Import(C, GpiQueryLineType, "GpiQueryLineType");

    pragma Import(C, GpiQueryLineWidth, "GpiQueryLineWidth");

    pragma Import(C, GpiQueryLineWidthGeom, "GpiQueryLineWidthGeom");

    pragma Import(C, GpiQueryLogColorTable, "GpiQueryLogColorTable");

    pragma Import(C, GpiQueryLogicalFont, "GpiQueryLogicalFont");

    pragma Import(C, GpiQueryMarker, "GpiQueryMarker");

    pragma Import(C, GpiQueryMarkerBox, "GpiQueryMarkerBox");

    pragma Import(C, GpiQueryMarkerSet, "GpiQueryMarkerSet");

    pragma Import(C, GpiQueryMetaFileBits, "GpiQueryMetaFileBits");

    pragma Import(C, GpiQueryMetaFileLength, "GpiQueryMetaFileLength");

    pragma Import(C, GpiQueryMix, "GpiQueryMix");

    pragma Import(C, GpiQueryModelTransformMatrix, "GpiQueryModelTransformMatrix");

    pragma Import(C, GpiQueryNearestColor, "GpiQueryNearestColor");

    pragma Import(C, GpiQueryNumberSetIds, "GpiQueryNumberSetIds");

    pragma Import(C, GpiQueryPageViewport, "GpiQueryPageViewport");

    pragma Import(C, GpiQueryPalette, "GpiQueryPalette");

    pragma Import(C, GpiQueryPaletteInfo, "GpiQueryPaletteInfo");

    pragma Import(C, GpiQueryPS, "GpiQueryPS");

    pragma Import(C, GpiQueryPattern, "GpiQueryPattern");

    pragma Import(C, GpiQueryPatternRefPoint, "GpiQueryPatternRefPoint");

    pragma Import(C, GpiQueryPatternSet, "GpiQueryPatternSet");

    pragma Import(C, GpiQueryPel, "GpiQueryPel");

    pragma Import(C, GpiQueryPickAperturePosition, "GpiQueryPickAperturePosition");

    pragma Import(C, GpiQueryPickApertureSize, "GpiQueryPickApertureSize");

    pragma Import(C, GpiQueryRealColors, "GpiQueryRealColors");

    pragma Import(C, GpiQueryRegionBox, "GpiQueryRegionBox");

    pragma Import(C, GpiQueryRegionRects, "GpiQueryRegionRects");

    pragma Import(C, GpiQueryRGBColor, "GpiQueryRGBColor");

    pragma Import(C, GpiQuerySegmentAttrs, "GpiQuerySegmentAttrs");

    pragma Import(C, GpiQuerySegmentNames, "GpiQuerySegmentNames");

    pragma Import(C, GpiQuerySegmentPriority, "GpiQuerySegmentPriority");

    pragma Import(C, GpiQuerySegmentTransformMatrix, "GpiQuerySegmentTransformMatrix");

    pragma Import(C, GpiQuerySetIds, "GpiQuerySetIds");

    pragma Import(C, GpiQueryStopDraw, "GpiQueryStopDraw");

    pragma Import(C, GpiQueryTag, "GpiQueryTag");

    pragma Import(C, GpiQueryTextAlignment, "GpiQueryTextAlignment");

    pragma Import(C, GpiQueryTextBox, "GpiQueryTextBox");

    pragma Import(C, GpiQueryViewingLimits, "GpiQueryViewingLimits");

    pragma Import(C, GpiQueryViewingTransformMatrix, "GpiQueryViewingTransformMatrix");

    pragma Import(C, GpiQueryWidthTable, "GpiQueryWidthTable");

    pragma Import(C, GpiRectInRegion, "GpiRectInRegion");

    pragma Import(C, GpiRectVisible, "GpiRectVisible");

    pragma Import(C, GpiRemoveDynamics, "GpiRemoveDynamics");

    pragma Import(C, GpiResetBoundaryData, "GpiResetBoundaryData");

    pragma Import(C, GpiResetPS, "GpiResetPS");

    pragma Import(C, GpiRestorePS, "GpiRestorePS");

    pragma Import(C, GpiRotate, "GpiRotate");

    pragma Import(C, GpiSaveMetaFile, "GpiSaveMetaFile");

    pragma Import(C, GpiSavePS, "GpiSavePS");

    pragma Import(C, GpiScale, "GpiScale");

    pragma Import(C, GpiSelectPalette, "GpiSelectPalette");

    pragma Import(C, GpiSetArcParams, "GpiSetArcParams");

    pragma Import(C, GpiSetAttrMode, "GpiSetAttrMode");

    pragma Import(C, GpiSetAttrs, "GpiSetAttrs");

    pragma Import(C, GpiSetBackColor, "GpiSetBackColor");

    pragma Import(C, GpiSetBackMix, "GpiSetBackMix");

    pragma Import(C, GpiSetBitmap, "GpiSetBitmap");

    pragma Import(C, GpiSetBitmapBits, "GpiSetBitmapBits");

    pragma Import(C, GpiSetBitmapDimension, "GpiSetBitmapDimension");

    pragma Import(C, GpiSetBitmapId, "GpiSetBitmapId");

    pragma Import(C, GpiSetCharAngle, "GpiSetCharAngle");

    pragma Import(C, GpiSetCharBox, "GpiSetCharBox");

    pragma Import(C, GpiSetCharBreakExtra, "GpiSetCharBreakExtra");

    pragma Import(C, GpiSetCharDirection, "GpiSetCharDirection");

    pragma Import(C, GpiSetCharExtra, "GpiSetCharExtra");

    pragma Import(C, GpiSetCharMode, "GpiSetCharMode");

    pragma Import(C, GpiSetCharSet, "GpiSetCharSet");

    pragma Import(C, GpiSetCharShear, "GpiSetCharShear");

    pragma Import(C, GpiSetClipPath, "GpiSetClipPath");

    pragma Import(C, GpiSetClipRegion, "GpiSetClipRegion");

    pragma Import(C, GpiSetColor, "GpiSetColor");

    pragma Import(C, GpiSetCp, "GpiSetCp");

    pragma Import(C, GpiSetCurrentPosition, "GpiSetCurrentPosition");

    pragma Import(C, GpiSetDefArcParams, "GpiSetDefArcParams");

    pragma Import(C, GpiSetDefAttrs, "GpiSetDefAttrs");

    pragma Import(C, GpiSetDefaultViewMatrix, "GpiSetDefaultViewMatrix");

    pragma Import(C, GpiSetDefTag, "GpiSetDefTag");

    pragma Import(C, GpiSetDefViewingLimits, "GpiSetDefViewingLimits");

    pragma Import(C, GpiSetDrawControl, "GpiSetDrawControl");

    pragma Import(C, GpiSetDrawingMode, "GpiSetDrawingMode");

    pragma Import(C, GpiSetEditMode, "GpiSetEditMode");

    pragma Import(C, GpiSetElementPointer, "GpiSetElementPointer");

    pragma Import(C, GpiSetElementPointerAtLabel, "GpiSetElementPointerAtLabel");

    pragma Import(C, GpiSetGraphicsField, "GpiSetGraphicsField");

    pragma Import(C, GpiSetInitialSegmentAttrs, "GpiSetInitialSegmentAttrs");

    pragma Import(C, GpiSetLineEnd, "GpiSetLineEnd");

    pragma Import(C, GpiSetLineJoin, "GpiSetLineJoin");

    pragma Import(C, GpiSetLineType, "GpiSetLineType");

    pragma Import(C, GpiSetLineWidth, "GpiSetLineWidth");

    pragma Import(C, GpiSetLineWidthGeom, "GpiSetLineWidthGeom");

    pragma Import(C, GpiSetMarker, "GpiSetMarker");

    pragma Import(C, GpiSetMarkerBox, "GpiSetMarkerBox");

    pragma Import(C, GpiSetMarkerSet, "GpiSetMarkerSet");

    pragma Import(C, GpiSetMetaFileBits, "GpiSetMetaFileBits");

    pragma Import(C, GpiSetMix, "GpiSetMix");

    pragma Import(C, GpiSetModelTransformMatrix, "GpiSetModelTransformMatrix");

    pragma Import(C, GpiSetPageViewport, "GpiSetPageViewport");

    pragma Import(C, GpiSetPaletteEntries, "GpiSetPaletteEntries");

    pragma Import(C, GpiSetPattern, "GpiSetPattern");

    pragma Import(C, GpiSetPatternRefPoint, "GpiSetPatternRefPoint");

    pragma Import(C, GpiSetPatternSet, "GpiSetPatternSet");

    pragma Import(C, GpiSetPel, "GpiSetPel");

    pragma Import(C, GpiSetPickAperturePosition, "GpiSetPickAperturePosition");

    pragma Import(C, GpiSetPickApertureSize, "GpiSetPickApertureSize");

    pragma Import(C, GpiSetPS, "GpiSetPS");

    pragma Import(C, GpiSetRegion, "GpiSetRegion");

    pragma Import(C, GpiSetSegmentAttrs, "GpiSetSegmentAttrs");

    pragma Import(C, GpiSetSegmentPriority, "GpiSetSegmentPriority");

    pragma Import(C, GpiSetSegmentTransformMatrix, "GpiSetSegmentTransformMatrix");

    pragma Import(C, GpiSetStopDraw, "GpiSetStopDraw");

    pragma Import(C, GpiSetTag, "GpiSetTag");

    pragma Import(C, GpiSetTextAlignment, "GpiSetTextAlignment");

    pragma Import(C, GpiSetViewingLimits, "GpiSetViewingLimits");

    pragma Import(C, GpiSetViewingTransformMatrix, "GpiSetViewingTransformMatrix");

    pragma Import(C, GpiStrokePath, "GpiStrokePath");

    pragma Import(C, GpiTranslate, "GpiTranslate");

    pragma Import(C, GpiUnloadFonts, "GpiUnloadFonts");

    pragma Import(C, GpiUnloadPublicFonts, "GpiUnloadPublicFonts");

    pragma Import(C, GpiWCBitBlt, "GpiWCBitBlt");

    pragma Import(C, DevCloseDC, "DevCloseDC");

    pragma Import(C, DevEscape, "DevEscape");

    pragma Import(C, DevOpenDC, "DevOpenDC");

    pragma Import(C, DevPostDeviceModes, "DevPostDeviceModes");

    pragma Import(C, DevQueryCaps, "DevQueryCaps");

    pragma Import(C, DevQueryDeviceNames, "DevQueryDeviceNames");

    pragma Import(C, DevQueryHardcopyCaps, "DevQueryHardcopyCaps");

    pragma Import(C, PrfAddProgram, "PrfAddProgram");

    pragma Import(C, PrfChangeProgram, "PrfChangeProgram");

    pragma Import(C, PrfCreateGroup, "PrfCreateGroup");

    pragma Import(C, PrfDestroyGroup, "PrfDestroyGroup");

    pragma Import(C, PrfQueryProgramCategory, "PrfQueryProgramCategory");

    pragma Import(C, PrfQueryProgramHandle, "PrfQueryProgramHandle");

    pragma Import(C, PrfQueryProgramTitles, "PrfQueryProgramTitles");

    pragma Import(C, PrfQueryDefinition, "PrfQueryDefinition");

    pragma Import(C, PrfRemoveProgram, "PrfRemoveProgram");

    pragma Import(C, WinStartApp, "WinStartApp");

    pragma Import(C, WinTerminateApp, "WinTerminateApp");

    pragma Import(C, WinAddSwitchEntry, "WinAddSwitchEntry");

    pragma Import(C, WinRemoveSwitchEntry, "WinRemoveSwitchEntry");

    pragma Import(C, WinChangeSwitchEntry, "WinChangeSwitchEntry");

    pragma Import(C, WinCreateSwitchEntry, "WinCreateSwitchEntry");

    pragma Import(C, WinQuerySessionTitle, "WinQuerySessionTitle");

    pragma Import(C, WinQuerySwitchEntry, "WinQuerySwitchEntry");

    pragma Import(C, WinQuerySwitchHandle, "WinQuerySwitchHandle");

    pragma Import(C, WinQuerySwitchList, "WinQuerySwitchList");

    pragma Import(C, WinQueryTaskSizePos, "WinQueryTaskSizePos");

    pragma Import(C, WinQueryTaskTitle, "WinQueryTaskTitle");

    pragma Import(C, WinSwitchToProgram, "WinSwitchToProgram");

    pragma Import(C, PrfCloseProfile, "PrfCloseProfile");

    pragma Import(C, PrfOpenProfile, "PrfOpenProfile");

    pragma Import(C, PrfQueryProfile, "PrfQueryProfile");

    pragma Import(C, PrfQueryProfileData, "PrfQueryProfileData");

    pragma Import(C, PrfQueryProfileInt, "PrfQueryProfileInt");

    pragma Import(C, PrfQueryProfileSize, "PrfQueryProfileSize");

    pragma Import(C, PrfQueryProfileString, "PrfQueryProfileString");

    pragma Import(C, PrfReset, "PrfReset");

    pragma Import(C, PrfWriteProfileData, "PrfWriteProfileData");

    pragma Import(C, PrfWriteProfileString, "PrfWriteProfileString");

    pragma Import(C, WinDefFileDlgProc, "WinDefFileDlgProc");

    pragma Import(C, WinFileDlg, "WinFileDlg");

    pragma Import(C, WinFreeFileDlgList, "WinFreeFileDlgList");

    pragma Import(C, WinFontDlg, "WinFontDlg");

    pragma Import(C, WinDefFontDlgProc, "WinDefFontDlgProc");

    pragma Import(C, DrgAcceptDroppedFiles, "DrgAcceptDroppedFiles");

    pragma Import(C, DrgAccessDraginfo, "DrgAccessDraginfo");

    pragma Import(C, DrgAddStrHandle, "DrgAddStrHandle");

    pragma Import(C, DrgAllocDraginfo, "DrgAllocDraginfo");

    pragma Import(C, DrgAllocDragtransfer, "DrgAllocDragtransfer");

    pragma Import(C, DrgDeleteDraginfoStrHandles, "DrgDeleteDraginfoStrHandles");

    pragma Import(C, DrgDeleteStrHandle, "DrgDeleteStrHandle");

    pragma Import(C, DrgDrag, "DrgDrag");

    pragma Import(C, DrgDragFiles, "DrgDragFiles");

    pragma Import(C, DrgFreeDraginfo, "DrgFreeDraginfo");

    pragma Import(C, DrgFreeDragtransfer, "DrgFreeDragtransfer");

    pragma Import(C, DrgGetPS, "DrgGetPS");

    pragma Import(C, DrgPostTransferMsg, "DrgPostTransferMsg");

    pragma Import(C, DrgPushDraginfo, "DrgPushDraginfo");

    pragma Import(C, DrgQueryDragitem, "DrgQueryDragitem");

    pragma Import(C, DrgQueryDragitemCount, "DrgQueryDragitemCount");

    pragma Import(C, DrgQueryDragitemPtr, "DrgQueryDragitemPtr");

    pragma Import(C, DrgQueryNativeRMF, "DrgQueryNativeRMF");

    pragma Import(C, DrgQueryNativeRMFLen, "DrgQueryNativeRMFLen");

    pragma Import(C, DrgQueryStrName, "DrgQueryStrName");

    pragma Import(C, DrgQueryStrNameLen, "DrgQueryStrNameLen");

    pragma Import(C, DrgQueryTrueType, "DrgQueryTrueType");

    pragma Import(C, DrgQueryTrueTypeLen, "DrgQueryTrueTypeLen");

    pragma Import(C, DrgReleasePS, "DrgReleasePS");

    pragma Import(C, DrgSendTransferMsg, "DrgSendTransferMsg");

    pragma Import(C, DrgSetDragImage, "DrgSetDragImage");

    pragma Import(C, DrgSetDragitem, "DrgSetDragitem");

    pragma Import(C, DrgSetDragPointer, "DrgSetDragPointer");

    pragma Import(C, DrgVerifyNativeRMF, "DrgVerifyNativeRMF");

    pragma Import(C, DrgVerifyRMF, "DrgVerifyRMF");

    pragma Import(C, DrgVerifyTrueType, "DrgVerifyTrueType");

    pragma Import(C, DrgVerifyType, "DrgVerifyType");

    pragma Import(C, DrgVerifyTypeSet, "DrgVerifyTypeSet");

    pragma Import(C, WinCreateObject, "WinCreateObject");

    pragma Import(C, WinDeregisterObjectClass, "WinDeregisterObjectClass");

    pragma Import(C, WinDestroyObject, "WinDestroyObject");

    pragma Import(C, WinEnumObjectClasses, "WinEnumObjectClasses");

    pragma Import(C, WinQueryObject, "WinQueryObject");

    pragma Import(C, WinRegisterObjectClass, "WinRegisterObjectClass");

    pragma Import(C, WinReplaceObjectClass, "WinReplaceObjectClass");

    pragma Import(C, WinSetObjectData, "WinSetObjectData");

    pragma Import(C, WinFreeFileIcon, "WinFreeFileIcon");

    pragma Import(C, WinLoadFileIcon, "WinLoadFileIcon");

    pragma Import(C, WinRestoreWindowPos, "WinRestoreWindowPos");

    pragma Import(C, WinSetFileIcon, "WinSetFileIcon");

    pragma Import(C, WinShutdownSystem, "WinShutdownSystem");

    pragma Import(C, WinStoreWindowPos, "WinStoreWindowPos");

    pragma Import(C, SplStdClose, "SplStdClose");

    pragma Import(C, SplStdDelete, "SplStdDelete");

    pragma Import(C, SplStdGetBits, "SplStdGetBits");

    pragma Import(C, SplStdOpen, "SplStdOpen");

    pragma Import(C, SplStdQueryLength, "SplStdQueryLength");

    pragma Import(C, SplStdStart, "SplStdStart");

    pragma Import(C, SplStdStop, "SplStdStop");

    pragma Import(C, SplControlDevice, "SplControlDevice");

    pragma Import(C, SplCopyJob, "SplCopyJob");

    pragma Import(C, SplCreateDevice, "SplCreateDevice");

    pragma Import(C, SplCreateQueue, "SplCreateQueue");

    pragma Import(C, SplDeleteDevice, "SplDeleteDevice");

    pragma Import(C, SplDeleteJob, "SplDeleteJob");

    pragma Import(C, SplDeleteQueue, "SplDeleteQueue");

    pragma Import(C, SplEnumDevice, "SplEnumDevice");

    pragma Import(C, SplEnumDriver, "SplEnumDriver");

    pragma Import(C, SplEnumJob, "SplEnumJob");

    pragma Import(C, SplEnumPort, "SplEnumPort");

    pragma Import(C, SplEnumPrinter, "SplEnumPrinter");

    pragma Import(C, SplEnumQueue, "SplEnumQueue");

    pragma Import(C, SplEnumQueueProcessor, "SplEnumQueueProcessor");

    pragma Import(C, SplHoldJob, "SplHoldJob");

    pragma Import(C, SplHoldQueue, "SplHoldQueue");

    pragma Import(C, SplPurgeQueue, "SplPurgeQueue");

    pragma Import(C, SplQueryDevice, "SplQueryDevice");

    pragma Import(C, SplQueryJob, "SplQueryJob");

    pragma Import(C, SplQueryQueue, "SplQueryQueue");

    pragma Import(C, SplReleaseJob, "SplReleaseJob");

    pragma Import(C, SplReleaseQueue, "SplReleaseQueue");

    pragma Import(C, SplSetDevice, "SplSetDevice");

    pragma Import(C, SplSetJob, "SplSetJob");

    pragma Import(C, SplSetQueue, "SplSetQueue");

    pragma Import(C, SplMessageBox, "SplMessageBox");

    pragma Import(C, SplQmAbort, "SplQmAbort");

    pragma Import(C, SplQmAbortDoc, "SplQmAbortDoc");

    pragma Import(C, SplQmClose, "SplQmClose");

    pragma Import(C, SplQmEndDoc, "SplQmEndDoc");

    pragma Import(C, SplQmOpen, "SplQmOpen");

    pragma Import(C, SplQmStartDoc, "SplQmStartDoc");

    pragma Import(C, SplQmWrite, "SplQmWrite");

    pragma Import(C, WinAssociateHelpInstance, "WinAssociateHelpInstance");

    pragma Import(C, WinCreateHelpInstance, "WinCreateHelpInstance");

    pragma Import(C, WinCreateHelpTable, "WinCreateHelpTable");

    pragma Import(C, WinDestroyHelpInstance, "WinDestroyHelpInstance");

    pragma Import(C, WinLoadHelpTable, "WinLoadHelpTable");

    pragma Import(C, WinQueryHelpInstance, "WinQueryHelpInstance");

    pragma Import(C, DdfBeginList, "DdfBeginList");

    pragma Import(C, DdfBitmap, "DdfBitmap");

    pragma Import(C, DdfEndList, "DdfEndList");

    pragma Import(C, DdfHyperText, "DdfHyperText");

    pragma Import(C, DdfInform, "DdfInform");

    pragma Import(C, DdfInitialize, "DdfInitialize");

    pragma Import(C, DdfListItem, "DdfListItem");

    pragma Import(C, DdfMetafile, "DdfMetafile");

    pragma Import(C, DdfPara, "DdfPara");

    pragma Import(C, DdfSetColor, "DdfSetColor");

    pragma Import(C, DdfSetFont, "DdfSetFont");

    pragma Import(C, DdfSetFontStyle, "DdfSetFontStyle");

    pragma Import(C, DdfSetFormat, "DdfSetFormat");

    pragma Import(C, DdfSetTextAlign, "DdfSetTextAlign");

    pragma Import(C, DdfText, "DdfText");


end OS2;

-- eof
