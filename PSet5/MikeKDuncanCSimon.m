0;
global cc;
global nn;
function y = periodic(c,n)
  y = zeros(2^n,1);
  for i=1:length(y)
    i-1;
    y(bitxor(i-1,c)+1) =i-1;
    y(i) =i-1;  
  endfor
endfunction

function y = func(x,n)
  global cc;
  global nn;
  v = periodic(cc,nn);
  y = v(x+1);
endfunction

#function y = filt(ugly)
  #ug = ugly;
  
  
  #for i=1:1:length(ugly)
    
#endfunction 

  
function simon(c,n)
  global cc;
  global nn;
  cc = c;
  nn = n;
  
  Uf = uf(@func,n,n);
  HI = kron(hadamard(n),eye(2^n));
  init = dec2vec(0,n+n);
  circuit = HI*Uf*HI*init;
  xm="";
  for i =1:1:n
    xm = strcat(xm,"X");
  endfor
  
  for i=1:1:n
    xm = strcat(xm,"M");
  endfor 
  
  firstHalf = measure_subspace(circuit,xm);
  arr =[];
  for i=1:1:rows(firstHalf)
    if(firstHalf(i)!= 0 && abs(firstHalf(i))>10^-7)
      arr(end+1) = i-1;
    endif
  endfor
  arr = dec2bin(arr);
  toNull = zeros(n,n);
  for i=1:1:size(arr)(1)
    for j=1:1:n
      toNull(i,j) = arr(i,j);
      if(toNull(i,j) == 48)
        toNull(i,j) = 0;
      else
        toNull(i,j) = 1;
      endif
    endfor
  endfor
  disp("Measurements: ");
  measurements = toNull
  [A,reduced] = lu(toNull);
  moded = mod(reduced, 2);
  nulled = null(moded);
  nulled(abs(nulled) > 0.1) = 1;
  nulled;
  binAnswer = "";
  for i = 1:1:rows(nulled)
    binAnswer = strcat(binAnswer, num2str(nulled(i)));
  endfor
  numAnswer = bin2dec(binAnswer);
  printf("These correspond with c = ");
  printf(binAnswer);
  printf(" = "); 
  printf(num2str(numAnswer));
  disp("");
  
endfunction
