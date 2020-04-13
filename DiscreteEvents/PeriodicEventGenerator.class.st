Class {
	#name : #PeriodicEventGenerator,
	#superclass : #EventGenerator,
	#instVars : [
		'period'
	],
	#category : #'DiscreteEvents-Atomics'
}

{ #category : #'as yet unclassified' }
PeriodicEventGenerator >> initialize [
	period := 1 devsSeconds.
	super initialize
]

{ #category : #'as yet unclassified' }
PeriodicEventGenerator >> period [
	^period
]

{ #category : #'as yet unclassified' }
PeriodicEventGenerator >> period: devSeconds [
	period := devSeconds
]
