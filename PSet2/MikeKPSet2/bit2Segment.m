function segments = bit2Segment(bits)

  

  segments = '0000000';
  
  A = str2num(bits(1));
  B = str2num(bits(2));
  C = str2num(bits(3));
  D = str2num(bits(4));
  
  a = (!A&&B&&D)||(A&&!B&&!C)||(!B&&!D)||(!A&&C)||(A&&!D)||(B&&C);
  b = (!A && !B) || (!A && C && D) || (!B && !D) || (A && !C && D) || (!A  && !C && !D) || (!B && !C);
  c = (!B&&!C)||(!B&&D)||(!C&&D)||(!A&&B)||(A&&!B);
  d = (!B&&!C&&!D)||(!B&&C&&D)||(!A&&C&&!D)||(B&&!C&&D)||(A&&!C)||(A&&B&&!D);
  e = (!B&&!D)||(C&&!D)||(A&&B)||(A&&C);
  f = (!A&&B&&!C)||(!C&&!D)||(B&&!D)||(A&&C)||(A&&!B);
  g = (!A&&B&&!D)||(B&&!C&&D)||(!B&&C)||(A&&C)||(A&&!B);

  segments = strcat(num2str(g), num2str(f), num2str(e), num2str(d), num2str(c), num2str(b), num2str(a))
  %%% Your code here - write down the code necessary to translate
  %%% these four bits into segments being on or off.
  %%% If the segment is on segment[i] = 1,
  %%% then segment[i] = 0
  ##segments = strcat(num2str(a), num2str(b), num2str(c), num2str(d), num2str(e), num2str(f), num2str(g))
  
  
  
endfunction
