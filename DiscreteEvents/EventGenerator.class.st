Class {
	#name : #EventGenerator,
	#superclass : #AtomicModel,
	#instVars : [
		'next'
	],
	#category : #'DiscreteEvents-Atomics'
}

{ #category : #'as yet unclassified' }
EventGenerator >> incite [
	self hold: self period.
	next := next + 1.
]

{ #category : #'as yet unclassified' }
EventGenerator >> initialize [
	super initialize.
	next := 1.
	self hold: self period.
]

{ #category : #'as yet unclassified' }
EventGenerator >> output [
	^next
]

{ #category : #'as yet unclassified' }
EventGenerator >> period [
	^self subclassResponsibility
]
