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
