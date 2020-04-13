Class {
	#name : #EventCollector,
	#superclass : #AtomicModel,
	#instVars : [
		'events'
	],
	#category : #'DiscreteEvents-Atomics'
}

{ #category : #'as yet unclassified' }
EventCollector >> at: index [
	^events at: index
]

{ #category : #'as yet unclassified' }
EventCollector >> events [
	^events

]

{ #category : #'as yet unclassified' }
EventCollector >> initialize [
	events := OrderedCollection new.
	super initialize.
	self sleep
]

{ #category : #'as yet unclassified' }
EventCollector >> receive: event [
	events add: event.
	self sleep
]
