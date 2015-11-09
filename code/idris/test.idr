- + Errors (1)
 `-- ./test.idr line 22 col 66:
      error: expected: "$",
         "&&", "*", "*>", "+", "++", "-",
         "->", ".", "/", "/=", "::", ";",
         "<", "<$>", "<*", "<*>", "<+>",
         "<<", "<=", "<|>", "=", "==",
         ">", ">=", ">>", ">>=", "\\\\",
         "`", "||", "~=~",
         ambiguous use of a left-associative operator,
         ambiguous use of a non-associative operator,
         ambiguous use of a right-associative operator,
         declaration, end of input,
         function argument, where block
     appendA = (++) ((S O) :: (S (S O)) :: nil) ((S O) :: (S O) :: nil))            
                                                                       ^            
