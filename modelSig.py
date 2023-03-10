import collections

SignalsTable = []

ElementTypes = ["NOT", "AND", "OR", "NAND", "NOR", "XNOR"]

ElementTable = []

topinputs = [0, 1, 2]

class Element:
	def __init__(self, type, output, *inputs):
		self.type = type
		self.inputs= inputs
		self.output = output

def Esw(input1):
	return (2*input1*(1-input1))

def spAND(*args):
	signal_prob=1
	for i in args:
		signal_prob *= i
	return signal_prob

def spNOR(*args):
	signal_prob = 1
	for i in args:
		signal_prob *= (1-i) 

	return signal_prob

def spOR(*args):
	signal_prob = 1 - spNOR(*args)  
	return signal_prob

def spNand(*args):
	signal_prob = 1 - spAND(*args)
	return signal_prob

def spXOR(*args):
	signal_prob = spXOR2(args[0],args[1])
	for i in range(2,len(args),1):
		signal_prob = spXOR2(signal_prob,args[i])

	return signal_prob

def spXOR2(input1,input2):
	return ((input1*(1-input2)) + input2*(1-input1))

def spNOT(input1):
	return (1-input1)

def spXNOR(*args):
	return 1 - spXOR(*args)

def process(element):
	mylist = []
	if(isinstance(element.inputs[0], collections.Iterable)):	
		for i in element.inputs:
			for j in i:
				mylist.append(j)
	else:
		mylist = element.inputs
		
	if(element.type == "AND"):
		SignalsTable[element.output]=spAND(SignalsTable[mylist[0]], SignalsTable[mylist[1]])
		for i in range(2,len(mylist)):
			SignalsTable[element.output]=spAND(SignalsTable[mylist[i]], SignalsTable[mylist.output])
		print("Signal prob of and gate = ",SignalsTable[element.output])
		
		if(SignalsTable[element.output]!=0 and SignalsTable[element.output]!=1):
			esw = Esw(SignalsTable[element.output])
			print("switching activity of and gate = ", esw)
	
	elif(element.type == "NOT"): 
		SignalsTable[element.output]=spNOT(SignalsTable[mylist[0]])
		print("Signal prob of not gate = ",SignalsTable[element.output])
		
		if(SignalsTable[element.output]!=0 and SignalsTable[element.output]!=1):
			esw = Esw(SignalsTable[element.output])
			print("switching activity of not gate = ", esw)

	elif(element.type=="XOR"):
		SignalsTable[element.output]=spXOR(SignalsTable[mylist[0]],SignalsTable[mylist[1]])
		for i in range(2,len(mylist)):
			SignalsTable[element.output]=spXOR(SignalsTable[mylist[i]], SignalsTable[element.output])
		print("Signal prob of xor = ",SignalsTable[element.output])
		
		if(SignalsTable[element.output]!=0 and SignalsTable[element.output]!=1):
			esw = Esw(SignalsTable[element.output])
			print("switching activity of xor gate = ", esw)

	elif(element.type=="OR"):
		SignalsTable[element.output]=spOR(SignalsTable[mylist[0]],SignalsTable[mylist[1]])
		for i in range(2,len(mylist)):
			SignalsTable[element.output]=spOR(SignalsTable[mylist[i]], SignalsTable[element.output])
		print("Signal prob of or = ",SignalsTable[element.output])
		
		if(SignalsTable[element.output]!=0 and SignalsTable[element.output]!=1):
			esw = Esw(SignalsTable[element.output])
			print("switching activity of or gate = ", esw)
	
	elif(element.type=="NOR"):
		SignalsTable[element.output]=spNOR(SignalsTable[mylist[0]],SignalsTable[mylist[1]])
		for i in range(2,len(mylist)):
			SignalsTable[element.output]=spNOR(SignalsTable[mylist[i]], SignalsTable[element.output])
		print("Signal prob of nor = ",SignalsTable[element.output])

		if(SignalsTable[element.output]!=0 and SignalsTable[element.output]!=1):
			esw = Esw(SignalsTable[element.output])
			print("switching activity of nor gate = ", esw)
	
	elif(element.type=="NAND"):
		SignalsTable[element.output]=spNAND(SignalsTable[mylist[0]],SignalsTable[mylist[1]])
		for i in range(2,len(mylist)):
			SignalsTable[element.output]=spNAND(SignalsTable[mylist[i]], SignalsTable[element.output])
		print("Signal prob of nand = ",SignalsTable[element.output])
		
		if(SignalsTable[element.output]!=0 and SignalsTable[element.output]!=1):
			esw = Esw(SignalsTable[element.output])
			print("switching activity of nand gate = ", esw)
	
	elif(element.type=="XNOR"):
		SignalsTable[element.output]=spXNOR(SignalsTable[mylist[0]],SignalsTable[mylist[1]])
		for i in range(2,len(mylist)):
			SignalsTable[element.output]=spXNOR(SignalsTable[mylist[i]], SignalsTable[element.output])
		print("Signal prob of nand = ",SignalsTable[element.output])

		if(SignalsTable[element.output]!=0 and SignalsTable[element.output]!=1):
			esw = Esw(SignalsTable[element.output])
			print("switching activity of xnor gate = ", esw)

	else:
		print("Not supported")

def truthtable (n):
  if n < 1:
    return [[]]
  subtable = truthtable(n-1)
  return  [row + [v] for row in subtable for v in [0,1]] 

def testbench(*Elements):
	for element in Elements:
		if(element.output):
			SignalsTable.append(0)

	for i in range(0,len(topinputs)):
		SignalsTable.append(0)

	input = truthtable(len(topinputs))
	for j in range(0,len(input)):
		print('For input = ', input[j], ' we have the following outputs : ')
		for k in range(0,len(topinputs)):
			SignalsTable[topinputs[k]] = input[j][k]
		for i in range(0,len(Elements)):
			process(Elements[i])

	print("Calculation of Switching activity for inputs = 0.5")
	for i in range(0,len(topinputs)):
		SignalsTable[topinputs[i]] = 0.5

	for i in range(0,len(ElementTable)):
		process(ElementTable[i])

	print("Calculation of Switching activity for inputs = 0.4323")
	for i in range(0,len(topinputs)):
		SignalsTable[topinputs[i]] = 0.4611

	for i in range(0,len(ElementTable)):
		process(ElementTable[i])

def giveInputs(inputs):
	
	for i in range(0,len(inputs)):
		SignalsTable[topinputs[i]] = inputs[i]

	for i in range(0,len(ElementTable)):
		process(ElementTable[i])
		
def main():

	E1 = Element(ElementTypes[1], 4, 0, 1)
	E2 = Element(ElementTypes[0], 5, 2)
	E3 = Element(ElementTypes[1], 3, 4, 5)
	
	ElementTable.append(E1)
	ElementTable.append(E2)
	ElementTable.append(E3)

	testbench(E1,E2,E3)
	while True:
		inputList = []
		for i in range(0,len(topinputs)):
			i = float(input('Insert input : '))
			inputList.append(i)
		giveInputs(inputList)
		print("If you want to stop press exit else continue ")
		n = str(input())
		if(n == "exit"):
			break
		elif(n=="continue"):
			continue
		else:
			print("You entered a non valid value")
			break

if __name__=="__main__":
    main()
