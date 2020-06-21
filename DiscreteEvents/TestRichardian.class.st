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
	l1 := Landowner new
		labourMarket: labourMarket;
		capitalMarket: capitalMarket.
	l2 := Landowner new
		labourMarket: labourMarket;
		capitalMarket: capitalMarket.
	world := CoupledModel new.
	"	world add: w1; add: w2; add: w3; add: c1; add: c2; add: l1; add: l2."
	world
		add: w1;
		add: w2;
		add: w3;
		add: c1;
		add: l1.
	log := EventDisplay named: 'desiredWork'.
	l1 forward: #desiredWork to: log as: #receive:.
	log2 := EventDisplay named: #interest.
	c1 forward: #interest to: log2 as: #receive:.
	log3 := EventDisplay named: #salary.
	w1 forward: #salary to: log3 as: #receive:.
	log4 := EventDisplay named: #benefits.
	l1 forward: #benefits to: log4 as: #receive:.
	log5 := EventDisplay named: #capital.
	c1 forward: #capital to: log5 as: #receive:.
	world simulateFor: 3000 devsDays.
	log buildChart.
	log2 buildChart.
	log3 buildChart.
	log4 buildChart.
	log5 buildChart
]
