Class {
	#name : #Simulator,
	#superclass : #Object,
	#instVars : [
		'root',
		'currentTime',
		'limit'
	],
	#category : #'DiscreteEvents-Kernel'
}

{ #category : #'as yet unclassified' }
Simulator class >> on: aModel [
	^self new root: aModel.
]

{ #category : #'as yet unclassified' }
Simulator >> initialize [
	super initialize.
	currentTime := 0 devsSeconds.
	limit := 0 devsSeconds
]

{ #category : #'as yet unclassified' }
Simulator >> moveLimit: duration [
	limit := limit + duration
]

{ #category : #'as yet unclassified' }
Simulator >> root: aModel [
	root := aModel
]

{ #category : #'as yet unclassified' }
Simulator >> run [
	| next |
	[ 
		next := root nextChange.
		next <= limit ] whileTrue: [ root evolve ]
]

{ #category : #'as yet unclassified' }
Simulator >> runFor: duration [
	self moveLimit: duration; run
]
