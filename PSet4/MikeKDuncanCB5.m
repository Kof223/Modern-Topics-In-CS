0;
warning('off', 'Octave:num-to-str');
function PSET(g)
  ## Determine function size
  ## Not the complete size
  size = 0;
  for i=10: -1: 1
    if(g(2^i - 1) != -1)
      size = i;
      break;
    endif
  endfor
  trueSize = size + 1;
  
  ## Circuit
  HH = hadamard(trueSize);
  HI = kron(hadamard(size), eye(2));
  UF = uf(g, size, 1);
  init = dec2vec(1, trueSize);
  circuit = HI*UF*HH*init;
  measurement = pretty(measure(circuit));
  printf("\nMeasurement: ");
  printf(measurement);
  printf("\n");
  
  ## Determine Constant or Balanced
  constant = true;
  for i = 3: 1: 2^trueSize
    if(circuit(i) >= 0.01)
      constant = false;
    endif
  endfor
  
  if (constant)
    display("This is a constant function");
  else
    display("This is a balanced function");
  endif
endfunction

## Testing Functions
function y = x(a)
  y = mod(a, 2);
  if(a > 63)
    y = -1;
  endif
endfunction
