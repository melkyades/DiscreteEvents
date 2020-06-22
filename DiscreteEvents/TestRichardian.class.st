Class {
	#name : #TestRichardian,
	#superclass : #TestCase,
	#instVars : [
		'log'
	],
	#category : #'DiscreteEvents-Ricardo'
}

{ #category : #'as yet unclassified' }
TestRichardian >> testSmallWorld [
	| labourMarket capitalMarket w1 w2 w3 c1 c2 l1 l2 world log2 log3 log4 log5 |
	labourMarket := Market new.
	capitalMarket := Market new.
	w1 := Worker new market: labourMarket.
	w2 := Worker new market: labourMarket.
	w3 := Worker new market: labourMarket.
	c1 := Capitalist new market: capitalMarket.
	c2 := Capitalist new market: capitalMarket.
	l1 := Landowner new labourMarket: labourMarket; capitalMarket: capitalMarket.
	l2 := Landowner new labourMarket: labourMarket; capitalMarket: capitalMarket.
	world := CoupledModel new.
	"	world add: w1; add: w2; add: w3; add: c1; add: c2; add: l1; add: l2."
	world 
		add: w1;
		add: w2;
		add: w3;
		add: c1;
		add: c2;
		add: l1;
		add: l2.
	log := EventDisplay new name: 'desiredWork'; title: 'Desired Work'.
	l1 forward: #desiredWork to: log as: #receive:.
	log2 := EventDisplay new name: #interest; title: 'Interest'.
	c1 forward: #interest to: log2 as: #receive:.
	log3 := EventDisplay new name: #salary; title: 'Salary'.
	w1 forward: #salary to: log3 as: #receive:.
	log4 := EventDisplay new name: #benefits; title: 'Benefits'.
	l1 forward: #benefits to: log4 as: #receive:.
	log5 := EventDisplay new name: #capital; title: 'Capital'.
	c1 forward: #capital to: log5 as: #receive:.
	world simulateFor: 3000 devsDays.
	log plot.
	log2 plot.
	log3 plot.
	log4 plot.
	log5 plot
]
