#{
  Title: Problem Set 1
  Author: Mike Ko
  
  How to use:
  In command, type the name of this file. This will load the script, allowing 
  you to run the functions.
  Either run doP# for whole problem or P#P(letter) for part of a problem 
#}
0;
x = [0, 1; 1, 0];
y = [0, -i; i, 0];
z = [1, 0; 0, -1];

function doP1
  printf("Problem 1\n");
  P1Pa;
  P1Pb;
endfunction

function P1Pa
  I = [1+i, 1+i; 1-i, 1-i];
  J = [-1, i; -i, 1]; 
  printf("Part a\n");
  I*J
endfunction

function P1Pb
  printf("Part b\n");
  original = [1+i, 1+i; 1-i, 1+i]
  printf("Transposed\n");
  transpose(original)
  printf("Conjugated\n");
  conj(original)
  printf("Conjugate-Tranpose\n");
  conj(transpose(original))
  printf("Inversed\n");
  inv(original)
endfunction

function doP2
  printf("Problem 2\n");
  P2Pa
  P2Pb
  P2Pc
endfunction

function P2Pa
  printf("Part a\n");
  x = [0, 1; 1, 0]
  y = [0, -i; i, 0]
  z = [1, 0; 0, -1]
  printf("XY, then YX\n");
  x*y-y*x
  y*x-x*y
  printf("YZ, then ZY\n");
  y*z-z*y
  z*y-y*z
  printf("ZX, then XZ\n");
  z*x-x*z
  x*z-z*x
endfunction

function P2Pb
  printf("Part b\n");
  printf("The rule is:\nIf x>y>z>x, then +.\nIf x<y<z<x, then -.\n"); 
endfunction

function P2Pc
  printf("Part c\n");
  x = [0, 1; 1, 0];
  y = [0, -i; i, 0];
  z = [1, 0; 0, -1];
  x*x + y*y + z*z
endfunction

function doP3
  printf("Problem 3\n");
  P3Pa
  P3Pb
  P3Pc
  P3Pd
endfunction

function P3Pa
  printf("Part a\n");
  printf("e^i0 =");
  disp(euler(0));
  printf("f(0) is 1, and g(0) is 0\n");
endfunction

function P3Pb
  printf("Part b\n");
  hold on;
  x = [0: 0.1: 10];
  y = real(euler(x));
  plot(x,y);
  y = imag(euler(x));
  plot(x,y);
  printf("Real part is cosine, imaginary part is sine.\n")
endfunction

function P3Pc
  printf("Part c\n");  
  x = [0: 0.1: 10];
  y = real(euler(x))-cos(x);
  plot(x,y);
  y = imag(euler(x))-sin(x);
  plot(x,y);
  printf("Yes, it's correct.\n");
endfunction

function P3Pd
  printf("Part d\n");  
  printf("Euler Pi + 1\n");
  euler(pi) + 1
endfunction

function Euler = euler(theta)
  Euler = exp(i*theta);
endfunction






