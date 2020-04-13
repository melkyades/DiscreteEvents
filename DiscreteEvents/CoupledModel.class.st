Class {
	#name : #CoupledModel,
	#superclass : #AtomicModel,
	#instVars : [
		'models',
		'nextIncited',
		'lastProduction',
		'labels'
	],
	#category : #'DiscreteEvents-Kernel'
}

{ #category : #'as yet unclassified' }
CoupledModel >> >> aSymbol [
	^labels at: aSymbol
]

{ #category : #'as yet unclassified' }
CoupledModel >> add: aModel [
	models add: aModel.
	self prepareForNextEvent
]

{ #category : #'as yet unclassified' }
CoupledModel >> add: aModel as: name [
	self add: aModel.
	labels at: name put: aModel.
	
]

{ #category : #'as yet unclassified' }
CoupledModel >> findNextIncited [
	^models min: #nextChange
]

{ #category : #'as yet unclassified' }
CoupledModel >> incite [
	nextIncited propagateProduction; evolve.
	self prepareForNextEvent
]

{ #category : #'as yet unclassified' }
CoupledModel >> initialize [
	super initialize.
	models := OrderedCollection new.
	labels := Dictionary new.

]

{ #category : #'as yet unclassified' }
CoupledModel >> prepareForNextEvent [
	nextIncited := self findNextIncited.
	self hold: (nextIncited nextChange - self currentTime max: 0 devsSeconds)
]

{ #category : #'as yet unclassified' }
CoupledModel >> routeLastResult [
	| result port event |
	result := lastResult key.
	port := lastResult value.
	event := Event at: self currentTime valued: result.
	router forward: event from: nextIncited at: port

]

{ #category : #'as yet unclassified' }
CoupledModel >> simulateFor: aDuration [
	| next |
	[ 
		next := self nextChange.
		next <= aDuration ] whileTrue: [ self evolve ]
]
