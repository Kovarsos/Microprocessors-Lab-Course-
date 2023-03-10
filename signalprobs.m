%%% �� ����������� ��� ����������� �� signal probabilities 
%%% AND ��� OR ����� ��� ������� ����� ��� ���������� ��������.
%%% �� ����������� ��� ����������� �� signal probabilities 
%%% XOR, NAND ��� NOR ����� ��� ������� ����� ��������.
%%% (�) ��� ������� �� ������������ ��� ��������� �������� ����������� ��� ��� ����������
%%% ��� signal probabilities XOR,NAND ��� NOR 2 ������� �����.
%%% (�) ������ ����������� ��� ��� ���������� ��� signal probabilities 
%%% AND, OR, XOR, NAND, NOR ����� 3 �������
%%% (�) ������ ����������� ��� ��� ���������� ��� signal probabilities 
%%% AND, OR, XOR, NAND, NOR ����� � �������


function s=signalprobs(input1sp, input2sp, input3sp)
  sp2AND(input1sp, input2sp);
  sp2OR(input1sp, input2sp);
  sp2XOR(input1sp, input2sp);
  sp2NAND(input1sp, input2sp);
  sp2NOR(input1sp, input2sp);
  
  sp3AND(input1sp, input2sp, input3sp);
  sp3OR(input1sp, input2sp, input3sp);
  sp3XOR(input1sp, input2sp, input3sp);
  sp3NAND(input1sp, input2sp, input3sp);
  sp3NOR(input1sp, input2sp, input3sp);
  
  % �� �������� ����������� ������ �� ������� ��'��������� ��� �� (�)
  %% �������: ������ �� ������� ���������� ��� ����� �������� ���� ������
  %spAND(input1sp, input2sp, input3sp, input4sp ...)
  %spOR(input1sp, input2sp, input3sp, input4sp ...)
  %spXOR(input1sp, input2sp, input3sp, input4sp, ...);
  %spNAND(input1sp, input2sp, input3sp, input4sp, ...);
  %spNOR(input1sp, input2sp, input3sp, input4sp, ...);
  
end

% 2-input AND gate truth table
%  I1 I2| O
%  0  0 | 0 
%  0  1 | 0 
%  1  0 | 0 
%  1  1 | 1 

function s=sp2AND(input1sp, input2sp)
  printf("AND Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = input1sp*input2sp;
  s
  esw(s);
  endfunction

% 2-input OR gate truth table
%  I1 I2| O
%  0  0 | 0 
%  0  1 | 1 
%  1  0 | 1 
%  1  1 | 1 

function s=sp2OR(input1sp, input2sp)
  printf("OR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = 1-(1-input1sp)*(1-input2sp);
  s
  esw(s);
endfunction


% 2-input XOR gate truth table
%  I1 I2| O
%  0  0 | 0 
%  0  1 | 1 
%  1  0 | 1 
%  1  1 | 0 

function s=sp2XOR(input1sp, input2sp)
  printf("XOR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = (1-input1sp)*input2sp + input1sp*(1-input2sp);
  s
  esw(s);
endfunction


% 2-input NAND gate truth table
%  I1 I2| O
%  0  0 | 1 
%  0  1 | 1 
%  1  0 | 1 
%  1  1 | 0 

function s=sp2NAND(input1sp, input2sp)
  printf("NAND Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = (1 - input1sp)*(1 - input2sp) + (1 - input1sp)*input2sp + input1sp*(1 - input2sp);
  s
  esw(s);
  endfunction



% 2-input NOR gate truth table
%  I1 I2| O
%  0  0 | 1 
%  0  1 | 0 
%  1  0 | 0 
%  1  1 | 0 

function s=sp2NOR(input1sp, input2sp)
  printf("NOR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = (1 - input1sp)*(1 - input2sp);
  s
  esw(s);
endfunction

% 3-input AND gate truth table
%  I1 �3 I2| O
%  0  0  0 | 0 
%  0  0  1 | 0
%  0  1  0 | 0
%  0  1  1 | 0
%  1  0  0 | 0 
%  1  0  1 | 0
%  1  1  0 | 0
%  1  1  1 | 1 

function s=sp3AND(input1sp, input2sp, input3sp)
  printf("AND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = input1sp*input2sp*input3sp;
  s
  esw(s);
  endfunction

% 3-input OR gate truth table
%  I1 �3 I2| O
%  0  0  0 | 0 
%  0  0  1 | 1
%  0  1  0 | 1
%  0  1  1 | 1
%  1  0  0 | 1 
%  1  0  1 | 1
%  1  1  0 | 1
%  1  1  1 | 1 

function s=sp3OR(input1sp, input2sp, input3sp)
  printf("OR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = (1 - input1sp)*(1 - input2sp)*input3sp + (1 - input1sp)*input2sp*(1-input3sp) + (1 - input1sp)*input2sp*input3sp + input1sp*(1 - input2sp)*(1- input3sp) + input1sp*(1 - input2sp)*input3sp + input1sp*input2sp*(1 - input3sp) + input1sp*input2sp*input3sp;
  s
  esw(s);
  endfunction

% 3-input �OR gate truth table
%  I1 �3 I2| O
%  0  0  0 | 0 
%  0  0  1 | 1
%  0  1  0 | 1
%  0  1  1 | 0
%  1  0  0 | 1 
%  1  0  1 | 0
%  1  1  0 | 0
%  1  1  1 | 1 

function s=sp3XOR(input1sp, input2sp, input3sp)
  printf("XOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = (1 - input1sp)*(1 - input2sp)*input3sp + (1 - input1sp)*input2sp*(1-input3sp) + input1sp*(1 - input2sp)*(1- input3sp) + input1sp*input2sp*input3sp;
  s
  esw(s);
  endfunction

% 3-input NAND gate truth table
%  I1 �3 I2| O
%  0  0  0 | 1 
%  0  0  1 | 1
%  0  1  0 | 1
%  0  1  1 | 1
%  1  0  0 | 1 
%  1  0  1 | 1
%  1  1  0 | 1
%  1  1  1 | 0 

function s=sp3NAND(input1sp, input2sp, input3sp)                                          
  printf("NAND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = (1 - input1sp)*(1 - input2sp)*(1- input3sp) + (1 - input1sp)*(1 - input2sp)*input3sp + (1 - input1sp)*input2sp*(1-input3sp) + (1 - input1sp)*input2sp*input3sp + input1sp*(1 - input2sp)*(1- input3sp) + input1sp*(1 - input2sp)*input3sp + input1sp*input2sp*(1 - input3sp);
  s
  esw(s);

  endfunction

# 3-input NOR gate truth table
#  I1 �3 I2| O
#  0  0  0 | 1 
#  0  0  1 | 0
#  0  1  0 | 0
#  0  1  1 | 0
#  1  0  0 | 0 
#  1  0  1 | 0
#  1  1  0 | 0
#  1  1  1 | 0 

function s=sp3NOR(input1sp, input2sp, input3sp)
  printf("NOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = (1 - input1sp)*(1 - input2sp)*(1- input3sp);
  s
  esw(s);
endfunction

function sa = esw(s)
  sa = 2*s*(1-s);
  printf("Switching Activity is(%f)\n",sa);
endfunction
