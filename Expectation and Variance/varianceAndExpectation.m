0;
function varianceAndExpectation
  psi = [1/2; i*sqrt(3)/2]
  z = [1; 0]
  x = [1/sqrt(2); 1/sqrt(2)]
  y = [1/sqrt(2); i/sqrt(2)]
  
  Pz = prob(psi, z)
  Px = prob(psi, x)
  Py = prob(psi, y)
  
  Ez = expec(psi, z)
  Ex = expec(psi, x)
  Ey = expec(psi, y)
  
  Vz = vari(psi, z)
  Vx = vari(psi, x)
  Vy = vari(psi, y)
  
endfunction

function probability = prob(args1, args2)
  probability = args1' * args2 * args2' * args1;
endfunction

function expected = expec(args1, args2)
  expected = prob(args1, args2) - (1 - prob(args1, args2));
endfunction

function variance = vari(args1, args2)
  ex1 = prob(args1, args2) + (1 - prob(args1, args2));
  variance = ex1 - expec(args1, args2)^2;
endfunction
