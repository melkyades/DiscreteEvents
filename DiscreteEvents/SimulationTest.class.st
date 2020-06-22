Class {
	#name : #SimulationTest,
	#superclass : #TestCase,
	#instVars : [
		'log'
	],
	#category : #'DiscreteEvents-Tests'
}

{ #category : #'as yet unclassified' }
SimulationTest >> log: port of: model [
	log := EventLogger new.
	model forward: port to: log -> #receive:.
	
]

{ #category : #'as yet unclassified' }
SimulationTest >> newFallingBall [
	| acceleration velocity position physics |
	acceleration := SingleEvent new value: -9.8; instant: 0 devsSeconds.
	velocity := QuantizedIntegrator named: 'accel to vel'.
	position := QuantizedIntegrator named: 'vel to pos'.

	physics := CoupledModel new
							add: acceleration as: #acceleration;
							add: velocity as: #velocity;
							add: position as: #position.

	acceleration forward: #output to: velocity -> #input:.
	velocity forward: #output to: position -> #input:.
	^physics
]

{ #category : #'as yet unclassified' }
SimulationTest >> newRecorded: model [
	| recorder coupling |
	recorder := EventCollector new.
	coupling := CoupledModel new add: model; add: recorder as: #recorder.
	model forward: #output to: recorder -> #receive:.
	^coupling
]

{ #category : #'as yet unclassified' }
SimulationTest >> simulate: aModel for: aDuration [
	| simulator |
	simulator := Simulator on: aModel.
	simulator runFor: aDuration.

	
]

{ #category : #'as yet unclassified' }
SimulationTest >> test010SimulatePeriodicEvents [
	| coupled output |
	coupled := self newRecorded: PeriodicEventGenerator new.
	self simulate: coupled for: 3 devsSeconds.
	output := (coupled >> #recorder) events collect: [ :event | event time -> event value ].
	self assert: output asArray equals: { 1 devsSeconds -> 1. 2 devsSeconds -> 2. 3 devsSeconds -> 3 }
	
]

{ #category : #'as yet unclassified' }
SimulationTest >> test020SimulateRandomEvents [
	| coupled |
	coupled := self newRecorded: PeriodicEventGenerator new.
	self simulate: coupled for: 3 devsSeconds.
	(coupled >> #recorder) events pairsDo: [ :prev :next | self assert: prev value equals: next value - 1 ]
	
]

{ #category : #'as yet unclassified' }
SimulationTest >> test200FallingBall [
	| ball chart1 chart2 |
	ball := FallingBall new.
	ball velocity 	initialC: 20; q: 1.
	ball position initialC: 0; q: 0.1.
	chart1 := EventDisplay new title: 'Position'; ylabel: 'm'.
	ball position forward: #output to: chart1 as: #receive:.
	chart2 := EventDisplay new title: 'Velocity'; ylabel: 'm/s'.
	ball velocity forward: #output to: chart2 as: #receive:.
	self simulate: ball physics for: 5 devsSeconds.
	chart1 plot.
	chart2 plot
]
