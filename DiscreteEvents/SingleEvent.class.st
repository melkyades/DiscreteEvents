Class {
	#name : #SingleEvent,
	#superclass : #AtomicModel,
	#instVars : [
		'value'
	],
	#category : #'DiscreteEvents-Atomics'
}

{ #category : #'as yet unclassified' }
SingleEvent >> incite [
	self sleep
]

{ #category : #'as yet unclassified' }
SingleEvent >> initialize [
	super initialize.
	self sleep
]

{ #category : #'as yet unclassified' }
SingleEvent >> instant: aDuration [
	self hold: aDuration
]

{ #category : #'as yet unclassified' }
SingleEvent >> output [
	^value
]

{ #category : #'as yet unclassified' }
SingleEvent >> value: aValue [
	value := aValue
]
