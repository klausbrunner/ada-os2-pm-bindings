THIN ADA 95 BINDINGS TO THE OS/2 API, R 0.4
-------------------------------------------

General:

The OS2 package provides thin, direct Ada 95 bindings to the most
important sections of OS/2's GUI API, i.e. Win, GPI, Dev, Spl, DDF,
Prf, Drg.

Notes:

* Use the BUILD command file to compile the bindings and create
  the sample program (WINTEST).

* Note that some names and types are not exactly identical to the
  C API definitions. Declarations like "HWND hwnd", anonymous arrays
  as structure members, pointers etc. had to be changed.

* Support for other OS/2 APIs than those related to the Presentation
  Manager has been dropped.

Version History:

0.4:	severe bug fixed (pragma pack for all OS/2 records)
        severe bug fixed (naming of some formal parameters, not recognized by
                          GNAT < 3.05)
0.3:    some testing
	removed Dos stuff 
0.2á:	implemented more macro functions
        made minor changes to some type definitions
0.1á:	first release

Miscellaneous:

The bindings have been created using a customized CBIND6 and tested
with GNAT 3.05 on OS/2 Warp v3. The CBIND utility can be obtained from
ftp://rational.com/public/tools/cbind/, the GNAT Ada'95 compiler is
at ftp://ftp.cs.nyu.edu/pub/gnat/. The base file was OS2EMX.H (part of
gcc/emx), thus a copy of the GNU Library General Public License is 
included with the distribution archive. 