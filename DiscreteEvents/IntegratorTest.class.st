Class {
	#name : #IntegratorTest,
	#superclass : #TestCase,
	#category : #'DiscreteEvents-Tests'
}

{ #category : #'as yet unclassified' }
IntegratorTest >> simulate: aModel for: aDuration [
	| simulator |
	simulator := Simulator on: aModel.
	simulator runFor: aDuration.

	
]

{ #category : #'as yet unclassified' }
IntegratorTest >> testAccumulateUsingPreviousDX [
	| c1 c2 area log coupled ev expected |
	c1 := SingleEvent new value: 1; instant: 0 devsSeconds.
	c2 := SingleEvent new value: -1; instant: 0.5 devsSeconds.
	area := QuantizedIntegrator new initialC: 0; q: 1.
	log  := EventCollector new.

	coupled := CoupledModel new 	add: c1; add: area; add: c2.
	c1 forward: #output to: area -> #input:.
	c2 forward: #output to: area -> #input:.
	area forward: #output to: log  -> #receive:.
	
	self simulate: coupled for: 3 devsSeconds.
	expected := { 2 -> -1. 3 -> -2 }.
	expected withIndexDo: [ :exp :i |
		ev := log at: i.
		self 
			assert: ev time seconds -> ev value equals: exp
	]
]

{ #category : #'as yet unclassified' }
IntegratorTest >> testConstantNegativeDX [
	| constant area log coupled e |
	constant := SingleEvent new value: -1; instant: 0 devsSeconds.
	area := QuantizedIntegrator new initialC: 0; q: 1.
	log  := EventCollector new.

	coupled := CoupledModel new 	add: constant; add: area.
	constant forward: #output to: area -> #input:.
	area	forward: #output to: log  -> #receive:.
	
	self simulate: coupled for: 3 devsSeconds.
	1 to: 3 do: [ :i |
		e := log at: i.
		self 
			assert: e time equals: i devsSeconds;
			assert: e value equals: i negated asFloat
	]
]

{ #category : #'as yet unclassified' }
IntegratorTest >> testConstantPositiveDX [
	| constant area log coupled e |
	constant := SingleEvent new value: 1; instant: 0 devsSeconds.
	area := QuantizedIntegrator new initialC: 0; q: 1.
	log  := EventCollector new.

	coupled := CoupledModel new 	add: constant; add: area.
	constant forward: #output to: area -> #input:.
	area forward: #output to: log  -> #receive:.
	
	self simulate: coupled for: 3 devsSeconds.
	1 to: 3 do: [ :i |
		e := log at: i.
		self 
			assert: e time equals: i devsSeconds;
			assert: e value equals: i asFloat
	]
]
