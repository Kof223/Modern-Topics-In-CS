0;
function bool = NAND(p, q) 
  bool = ~(p&&q);
endfunction

function bool = AND(p, q)
  bool = NAND(NAND(p,q), NAND(p,q));
endfunction

function bool = OR(p, q)
  bool = NAND(NAND(p,p), NAND(q,q));
endfunction

function bool = NOT(p)
  bool = NAND(p, p)
endfunction
