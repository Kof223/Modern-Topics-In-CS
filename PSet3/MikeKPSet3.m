0;
#{
  How to use:
  In command, type the name of this file. This will load the script, allowing 
  you to run the functions.
  Either run doP# for a whole problem or P#P(letter) for part of a problem 
  doAll for all problems
#}
function doAll
  doP1
  doP2
  doP3
  doP4
endfunction

function doP1
  disp("\nProblem 1\n");
  P1Pa
  P1Pb
  P1Pc  
endfunction

function P1Pa
  theta = 0.5;
  fi = 0.5;
  nState = [cos(theta/2);e^(i * fi) * sin(theta/2)];
  isNormalized = (nState') * nState
  hold on;
  theta = [0: 0.5: 2*pi];
  fi = [0: 0.5: 2*pi];
  z = zeros(length(theta), length(fi));
  for m = 1:length(theta)
    for n = 1:length(fi)
      nState = [cos(m/2);e^(i * n) * sin(m/2)];
      z(m, n) = nState' * nState;
    endfor
  endfor
  mesh(theta, fi, z);
endfunction

function P1Pb
  theta = pi/2
  fi = 0
  nAsX = [cos(theta/2); e^(i * fi) * sin(theta/2)]
  
  theta = pi/2
  fi = pi/2
  nAsY = [cos(theta/2); e^(i * fi) * sin(theta/2)]
endfunction

function P1Pc
  disp("For +Z on +n, the probability is cos(theta/2) squared");
  disp("For -Z on +n, the probability is sin(theta/2) squared");
endfunction

function doP2
  disp("\nProblem 2\n");
  sigmaX = [0,1; 1,0];
  sigmaY = [0,-i; i,0];
  plusX = [1/sqrt(2); 1/sqrt(2)];
  plusY = [1/sqrt(2); i/sqrt(2)];
  [eigenVec, eigenVal] = eig(sigmaX)
  disp("plusX state is the right column eigenvector.");
  xCalculatedEigenvalue = plusX'*sigmaX*plusX
  [eigenVec, eigenVal] = eig(sigmaY)
  disp("plusY state is the right column eigenvector, but it has a phase shift.");
  yCalculatedEigenvalue = plusY'*sigmaY*plusY
  disp("This works because the operator and its ket is the definition of");
  disp("eigenvalue/vector, so since he ket is a eigenvector, I can replace it");
  disp("with the eigenvalue and the ket. The eigenvalue can be moved out, the");
  disp("bra and ket becomes one, so you're left with the eigenvalue.");
endfunction

function doP3
  disp("\nProblem 3\n");
  P3Pa;
  P3Pb;
endfunction

function P3Pa
  A = [-1, 2+i; 2-i, 3]
  daggerOfA = A'
  disp("It is the same, so it is hermetian.");
endfunction

function P3Pb
  A = [-1, 2+i; 2-i, 3];
  [eigenVec, eigenVal] = eig(A)
  eigVec1 = eigenVec(:,1);
  eigVec2 = eigenVec(:,2);
  isOrthoganal = eigVec2'*eigVec1
endfunction

function doP4
  disp("\nProblem 4\n");
  A = [-1, 2+i; 2-i, 3];
  [eigenVec, eigenVal] = eig(A);
  eigVecPosZ = eigenVec(1,2)
  eigVecNegZ = eigenVec(2,2)
  disp("Need to change so Pos z is only real. To do this, e^-i(ang)");
  disp("To find phi, i part = 0, so 0 = sin(ang)*0.36515 - cos(ang)*0.18257");
  disp("Which equals arctan of 0.18257/0.36515");
  correctPosZ = eigVecPosZ * e^(-i*atan(abs(imag(eigVecPosZ))/real(eigVecPosZ)))
  correctNegZ = eigVecNegZ * e^(-i*atan(abs(imag(eigVecPosZ))/real(eigVecPosZ)))
  theta = acos(correctPosZ) * 2
  fi2 = acos(real(correctNegZ) /  sin(theta/2));
  fi = asin(imag(correctNegZ) /  sin(theta/2))
  nState = [cos(theta/2);e^(i * fi) * sin(theta/2)];
  newVec = [correctPosZ; correctNegZ];
  prob = abs(newVec' * nState)^2
  
endfunction
