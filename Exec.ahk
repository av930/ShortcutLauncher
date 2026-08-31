;; AHK v2 note: v1's giant command-name dispatcher is unnecessary in v2 because
;; every legacy command (SendInput, Sleep, Run, MsgBox, ...) is already a real,
;; dynamically-callable function. Exec() just parses "FuncName, arg1, arg2 `n ..."
;; text (one call per line) and invokes the matching function by name.
;; NOTE: v2's Func() no longer resolves a function by name string (calling it now
;; constructs the Func class itself -> "Invalid base"); use %name%(args*) instead.
Exec(CmdText) {
    for line in StrSplit(CmdText, "`n") {
        line := Trim(line)
        if (line = "")
            continue
        ;; normalize "FuncName arg1, arg2" -> "FuncName,arg1,arg2"
        line := RegExReplace(line, "^(\w+)\s+", "$1,")
        parts := StrSplit(line, ",", " `t")
        fname := parts[1]
        args := []
        loop parts.Length - 1
            args.Push(parts[A_Index + 1])
        try
            %fname%(args*)
        catch
            continue
    }
}

