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
 
    Linear := True
    
    While (A_Index != obj.MaxIndex()) {
        if !(obj.hasKey(A_Index)) {
            Linear := False
            break
        }
    }

    For e, v in obj {
        if (Linear == False) {
            if (IsObject(v)) 
               r .= e ":" Obj2Str(v) ", "        
            else {                  
                r .= e ":"  
                if v is number 
                    r .= v ", "
                else 
                    r .= """" v """, " 
            }            
        } else {
            if (IsObject(v)) 
                r .= Obj2Str(v) ", "
            else {          
                if v is number 
                    r .= v ", "
                else 
                    r .= """" v """, " 
            }
        }
    }
    return Linear ? "[" trim(r, ", ") "]" 
                 : "{" trim(r, ", ") "}"
}
