{+ AutoGen5 template  -*- nroff -*-

texi

## aginfo3.tpl -- Template for function texi doc
##
## Author:          Bruce Korb <bkorb@gnu.org>
##
##  This file is part of AutoOpts, a companion to AutoGen.
##  AutoOpts is free software.
##  AutoOpts is Copyright (C) 1992-2018 by Bruce Korb - all rights reserved
##
##  AutoOpts is available under any one of two licenses.  The license
##  in use must be one of these two and the choice is under the control
##  of the user of the license.
##
##   The GNU Lesser General Public License, version 3 or later
##      See the files "COPYING.lgplv3" and "COPYING.gplv3"
##
##   The Modified Berkeley Software Distribution License
##      See the file "COPYING.mbsd"
##
##  These files have the following sha256 sums:
##
##  8584710e9b04216a394078dc156b781d0b47e1729104d666658aecef8ee32e95  COPYING.gplv3
##  4379e7444a0e2ce2b12dd6f5a52a27a4d02d39d247901d3285c88cf0d37f477b  COPYING.lgplv3
##  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.mbsd

+}{+

(out-push-new (sprintf "%s.menu" (base-name)))
(define lib-name (get "library"))
(if (< (string-length lib-name) 1)
    (set! lib-name (base-name)) )
(define node-name (sprintf "lib%s procedures" lib-name))
(define sec-name  (sprintf "lib%s External Procedures" lib-name))

(define doc-level (getenv "LEVEL"))
(if (not (string? doc-level))
    (set! doc-level "section"))
(sprintf "* %-28s %s\n" (string-append node-name "::") sec-name)  +}{+
(out-pop)
+}@node {+ (. node-name) +}
@{+ (. doc-level) +} {+ (. sec-name) +}

{+

IF (not (exist? "lib-description"))

+}These are the publicly exported procedures from the lib@i{{+(. lib-name)+}}
library.  Any other functions mentioned in the @i{header} file are
for the private use of the library.{+

ELSE  +}{+  lib-description +}{+
ENDIF +}

@menu{+

FOR export-func               +}{+
  IF (not (exist? "private")) +}
* lib{+(sprintf "%-24s" (string-append
       lib-name "-" (get "name") "::"))
    +} {+name      +}{+

  ENDIF private    +}{+

ENDFOR export-func +}
@end menu

This {+(. doc-level)+} was automatically generated by AutoGen
using extracted information and the {+(tpl-file)+} template.{+

FOR export-func                +}{+
  IF (not (exist? "private"))

+}

@node lib{+library+}-{+name+}
@{+CASE (. doc-level)+}{+
   = chapter    +}{+
   = section    +}sub{+
   = subsection +}subsub{+
   ESAC +}section {+name+}
@findex {+name+}

{+what+}

@noindent
Usage:
@example
{+ % ret-type "%s res = "
+}{+name+}({+
  IF (exist? "arg") +} {+
    FOR arg ", " +}{+arg-name+}{+
    ENDFOR +} {+
  ENDIF +});
@end example{+
  IF (or (exist? "arg") (exist? "ret-type")) +}
@noindent
Where the arguments are:
@multitable @columnfractions .05 .15 .20 .55
@item @tab Name @tab Type @tab Description
@item @tab ----- @tab ----- @tab -------------{+
    FOR arg "\n" +}
@item @tab {+arg-name+} @tab @code{{+arg-type+}}
@tab {+arg-desc+}{+
    ENDFOR+}{+
    IF (exist? "ret-type") +}
@item @tab returns @tab {+ret-type+}
@tab {+ ret-desc +}{+

    ENDIF +}
@end multitable{+

  ENDIF
+}

{+doc+}
{+ % err "\n%s\n" +}{+

  ENDIF private  +}{+

ENDFOR  export-func


+}