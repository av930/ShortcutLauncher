/*                 ___ _     _ ____  __ _        
                  /___\ |__ (_)___ \/ _\ |_ _ __ 
                 //  // '_ \| | __) \ \| __| '__|
                / \_//| |_) | |/ __/_\ \ |_| |   
                \___/ |_.__// |_____\__/\__|_|   
                 4/17/17  |__/ by errorseven       

What this does:

    Takes an Object/Array and turns it into a string. Maintains exact format, 
    can easily transfer to other scripts, useful for debugging.

Example: 
   
    OurObject := {arr:[1, 2, 3]
                , text:"Hello, World"
                , obj:{1:1, 2:2, 3:3, 5:5}}
    
    String := Obj2Str(OurObject) 
            
    MsgBox % String 
    ; String -> {arr:[1, 2, 3], obj:{1:1, 2:2, 3:3, 5:5}, text:"Hello, World"}            
      
*/

Obj2Str(obj) {
    r := ""
    if (obj is Array) {
        for v in obj
            r .= (IsObject(v) ? Obj2Str(v) : (IsNumber(v) ? v : '"' v '"')) ", "
        return "[" Trim(r, ", ") "]"
    }
    for e, v in (obj is Map ? obj : obj.OwnProps())
        r .= e ":" (IsObject(v) ? Obj2Str(v) : (IsNumber(v) ? v : '"' v '"')) ", "
    return "{" Trim(r, ", ") "}"
}
