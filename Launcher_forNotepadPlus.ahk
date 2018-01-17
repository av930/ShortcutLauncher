NP := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; NP.fsa				:= "sendinput, ^s"			 ;;save all
;; NP.fca				:= "sendinput, ^+a `n sleep, 1000 `n sendinput, {text}Close All "				 ;;close all
;; NP.fe					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}File Encoding" )


;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

{ ;;;; move -단축키로 정의
;~ symbol-highlight
;~ previous/next cursor
;~ previous/next modified position
;~ previous/next tab/file
;~ jump to line
;~ matching brace toggle
NP.mfold					:= "sendinput, ^+-"			;;fold all
NP.mfoldc				:= "sendinput, ^+="			;;unfold all

;~ move symbol-next/previous
}

{ ;;;; debug -단축키로 지정
;~ run
;~ stop
;~ step over
;~ step in
;~ step out
;~ go till here
;~ eval expression


;~ { ;;;; edit - need to define by keymap
;~ undo
;~ redo
;~ indent block
;~ indent file
;~ duplicate line
;~ delete line
;~ block-mode/out
;~ column-mode/out
;~ comment line/out
;~ comment block/out
;~ case-upper
;~ case-lower
NP.es				:= "sendinput, ^+!j"			;;select multi occurrence
}


;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

{ ;;;; program
NP.plist				:= ""
NP.pset					:= "sendinput, !t `n sendinput, p"	;;project setting
NP.pconf				:= "sendinput, ^!+s"			 ;;project configuration
NP.pkey					:= Func( "F_RunAction" ).Bind( "^!s", 1200, "{text}Keymap" )
NP.pk					:= NP.pkey
NP.pexit				:= "sendinput, {ALT}{F4}"	 ;;project configuration
}

{ ;;;; file
NP.fo					:= "sendinput, ^+n"			 ;;open
NP.fr					:= "sendinput, ^!y"			 ;;reload & sync
NP.fsync				:= NP.fr
NP.fc					:= "sendinput, ^{F4}"		 ;;close
NP.fsa					:= "sendinput, ^s"			 ;;save all
NP.fca					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}Close All" ) ;;close all
NP.fe					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}file encoding" )
}


{ ;;;; symbol & search
NP.sync					:= "sendinput, ^!y"		;;sync-up symbol
NP.stype				:= "sendinput, ^+b"		;;view symbol-type
NP.spre					:= "sendinput, ^+i"		;;preview symbol-definition
NP.shelp				:= "sendinput, +{F1}"	;;external symbol document help
NP.sjump				:= "sendinput, ^b"		;;jump to symbol-definition
NP.shier				:= "sendinput, ^h"		;;hierarchy
NP.scaller				:= "sendinput, !{F7}"	;;find caller
NP.sf					:= "sendinput, ^+f",	;;search symbol all space
NP.sr					:= "sendinput, ^+r"		;;replace symbol all space
NP.sfind				:= "sendinput, ^+f"		;;search/replace project-range
NP.sreplace				:= "sendinput, ^+r"		;;replace smartly
NP.ssample				:= "sendinput, !{F8}"	;;search sample code
}

{ ;;;; coding
NP.cc					:= "sendinput, ^{space}"				;;symbol auto complete
NP.cp					:= "sendinput, ^{space}"				;;parameter auto complete
NP.ci					:= "sendinput, ^!o"		;;class import optimization
NP.cerr					:= "sendinput, ^{F1}"	;;error tip
NP.cfix					:= "sendinput, !{enter}"	;;error fix
NP.ct					:= "sendinput, !{enter}"	;;code generation, override, implement, constructor, etc
}

{ ;;;; build
NP.bp					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}Build Apks") ;;build & run
NP.bp					:= "sendinput, ^{F9}"				;;build
NP.brun					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}Run Run/Debug") ;;build & run
NP.bre					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}Rebuild Project") ;;rebuild
NP.bc					:= "sendinput, ^+`` `n sendinput, c"	;;clean
NP.bd					:= "sendinput, +{F9}"	;;start debug
}

{ ;;;; vcs
NP.vs					:= ""				;;status
NP.vh					:= ""				;;log & history
NP.va					:= "sendinput, ^!a"		;;commit & patch
NP.vc					:= ""				;;commit & patch
NP.vpush				:= "sendinput, ^+k"		;;push & upload
NP.vpull				:= ""				;;pull & update
}


{ ;;;; windows
NP.wfull				:= "sendinput, ^+{F12}"		;;toggle full-screen
NP.w					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}Tool Windows")				;;window list
NP.wedit				:= "sendinput, {ESC}"				;;editor
NP.wdir					:= "sendinput, !1"				;;directory view
NP.wsym					:= "sendinput, !7"				;;symbol view
NP.whier				:= "sendinput, ^h"				;;hierarchy view
NP.wlog					:= "sendinput, !6"				;;logger
NP.wdebug				:= "sendinput, !5"				;;debugger
}


{ ;;;; tool
NP.tex					:= Func( "F_RunAction" ).Bind( "^+a", 500, "{text}Show in Explorer")	;;explorer
NP.te					:= NP.tex
NP.tcmd					:= "sendinput, !{F12}"				;;command line interface
}
