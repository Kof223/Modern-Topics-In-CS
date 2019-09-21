function diff = subtractor(arg1,arg2)
  
  for i=1:length(arg1)
    A(i) = str2num(arg1(i));
    B(i) = str2num(arg2(i));
  endfor
  for i=1:length(B)
    B(i) = not(B(i));
  endfor
  AString = strcat(num2str(A(1)), num2str(A(2)), num2str(A(3)), num2str(A(4))); 
  BString = strcat(num2str(B(1)), num2str(B(2)), num2str(B(3)), num2str(B(4))); 
  temp = adder(AString,BString);
  diff = adder(temp, "0001");
  %%%Your code here, 
  %%%the two arguments are length - 4 arrays of bits
  %%% that you must use logic gates to add. 
  %%% Feel free to use the adder function previously used.
  %%% Make sure to use num2str to have your output as a string.
  
  
  
  
endfunction
