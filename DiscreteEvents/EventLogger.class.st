Class {
	#name : #EventLogger,
	#superclass : #AtomicModel,
	#category : #'DiscreteEvents-Atomics'
}

{ #category : #'as yet unclassified' }
EventLogger >> initialize [
	super initialize.
	self sleep
]

{ #category : #'as yet unclassified' }
EventLogger >> receive: event [
	Transcript show: event time printString, ', ', event value printString, String cr.
	self sleep
]
