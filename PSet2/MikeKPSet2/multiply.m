function product = multiply (arg1, arg2)
  for i=1:length(arg1)
    A(i) = str2num(arg1(i));
    B(i) = str2num(arg2(i));
  endfor
  line1 = strcat(num2str(and(A(1), B(4))), num2str(and(A(2), B(4))), num2str(and(A(3), B(4))), num2str(and(A(4), B(4))));
  line2 = strcat(num2str(and(A(2), B(3))), num2str(and(A(3), B(3))), num2str(and(A(4), B(3))), "0");
  line3 = strcat(num2str(and(A(3), B(2))), num2str(and(A(4), B(2))), "0", "0");
  line4 = strcat(num2str(and(A(4), B(1))), "0", "0", "0");
  
  add1 = adder(line1, line2);
  add2 = adder(add1, line3);
  product = adder(add2, line4);
endfunction
