function d=circuit(a, b, c)
  e = sp2AND(a, b);
  f = spNOT(c);
  d = sp2AND(e,f);
 end
 
% 2-input AND gate truth table
%  I1 I2| O
%  0  0 | 0 
%  0  1 | 0 
%  1  0 | 0 
%  1  1 | 1 

function e=sp2AND(a, b)
  printf("AND Gate for input probabilities (%f %f):\n",a,b)
  e = a*b;
  e
  esw(e);
endfunction

% NOT gate truth table
%  I | O
%  0 | 1 
%  1 | 0 

function f=spNOT(c)
  printf("NOT Gate for input probabilities (%f):\n",c)
  f = (1 - c);
  f
  esw(f);
endfunction

function sa = esw(s)
  sa = 2*s*(1-s);
  printf("Switching Activity is(%f)\n",sa);
endfunction