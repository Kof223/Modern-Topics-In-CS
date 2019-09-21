1;
function result = halfAdder (args1, args2)
  carry = 0;
  sum = 0;
  if (xor(args1, args2) == 1)
    sum = 1;
  endif
  if (and(args1, args2) == 1)
    carry = 1;
  endif
  result = [carry, sum];
endfunction

function result = fullAdder (args1, args2, carry)
  x = halfAdder(args1, args2);
  y = halfAdder(x(2), carry);
  
  result = [(y(1) || x(1)), y(2)];
  # carry then sum
endfunction
