"
I'm a random event generator. I do not generate random numbers but random events (i.e. events that happen at random moments).

Public API and Key Messages

  The same of atomic models

Internal Representation

   	distribution: I hold a random number generator to fetch the time of the next event.
	next: anInteger, I maintain the count of messages sent.

"
Class {
	#name : #RandomEventGenerator,
	#superclass : #EventGenerator,
	#instVars : [
		'distribution'
	],
	#category : #'DiscreteEvents-Atomics'
}

{ #category : #'as yet unclassified' }
RandomEventGenerator >> initialize [
	distribution := Random new.
	super initialize


]

{ #category : #'as yet unclassified' }
RandomEventGenerator >> period [
	^self random
]

{ #category : #'as yet unclassified' }
RandomEventGenerator >> random [
	^distribution next devsSeconds
]
