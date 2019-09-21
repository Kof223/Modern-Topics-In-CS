function assignment2()
  
  dec1 = floor(rand(1)*15.99);
  dec2 = floor(rand(1)*15.99);
  
  input_1 = dec2hex(dec1)
  input_2 = dec2hex(dec2)
  
  arg1 =  num2str(dec2bin(dec1,4));
  arg2 =  num2str(dec2bin(dec2,4));
  
  sum = adder(arg1,arg2);
  diff = subtractor(arg1,arg2);
  SegmentLED(sum);
  dec2hex(bin2dec (sum))
  display "Press any key to continue"
  pause;
  dec2hex(bin2dec (diff))

  SegmentLED(diff);
  
  multiply(arg1, arg2)
endfunction
