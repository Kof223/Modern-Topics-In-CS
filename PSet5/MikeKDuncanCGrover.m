0;
warning('off','Octave:num-to-str');
global bit;
function answer = grover(bitstring)
  global bit;
  bit = bitstring;
  size = length(bitstring);
  initial = dec2vec(0,size);
  H = hadamard(size);
  initial = H*initial;
  xm = "";
  for i = 1: 1: size
    xm = strcat(xm, "X");
  endfor
  xm = strcat(xm, "M");
  for i=1:sqrt(2^size)
    addBit = kron(initial, [0;1]);
    IH = kron(eye(2^size),hadamard(1));
    #phase inversion
    UF = uf(@a, size,1);
    #inversion about the mean
    A = 1/(2^(size))*ones(2^(size),2^(size));
    INV = 2*A-eye(2^(size));
    INVERSE = kron(INV,eye(2));
    before = INVERSE*UF*IH*addBit;
    measured = measure_subspace(before, xm);
    backToOld = measured(any(measured,2),:);
    ##Remove zeroes
    initial = backToOld;
  endfor  
  initial;
  answer = pretty(measure(initial))
endfunction

function f = a(x)
  global bit;
  f = 0;
  if (x == bin2dec(bit))
    f =1;
  endif
endfunction
