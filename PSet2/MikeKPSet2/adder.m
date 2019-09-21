function sum = adder(arg1,arg2)
  
  for i=1:length(arg1)
    A(i) = str2num(arg1(i));
    B(i) = str2num(arg2(i));
  endfor
  logicGates;
  first = halfAdder(A(4), B(4));
  second = fullAdder(A(3), B(3), first(1));
  third = fullAdder(A(2), B(2), second(1));
  fourth = fullAdder(A(1), B(1), third(1));

  sum = strcat(num2str(fourth(2)),num2str(third(2)),num2str(second(2)),num2str(first(2)));
  
  
  %%%Your code here, 
  %%%the two arguments are length - 4 arrays of bits
  %%% that you must use logic gates to add. 
  %%% Feel free to create a half and full-adder function and exploit these.
  %%% Make sure to use num2str to have your output as a string.

  
  
  
  
  
endfunction
