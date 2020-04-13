Class {
	#name : #AtomicModel,
	#superclass : #Object,
	#instVars : [
		'lastChange',
		'sigma',
		'name',
		'router'
	],
	#category : #'DiscreteEvents-Kernel'
}

{ #category : #'as yet unclassified' }
AtomicModel class >> named: aString [
	^self new name: aString
]

{ #category : #'as yet unclassified' }
AtomicModel >> currentTime [
	^self lastChange
]

{ #category : #'as yet unclassified' }
AtomicModel >> evolve [
	self updateTime: lastChange + sigma.
	self incite.
]

{ #category : #'as yet unclassified' }
AtomicModel >> forward: outport to: to [
	router addRoute: self -> outport to: to
]

{ #category : #'as yet unclassified' }
AtomicModel >> forward: outport to: observer as: inport [
	router addRoute: self -> outport to: observer -> inport

]

{ #category : #'as yet unclassified' }
AtomicModel >> hold: aDuration [
	sigma := aDuration

]

{ #category : #'as yet unclassified' }
AtomicModel >> incite [
	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AtomicModel >> initialize [
	lastChange := 0 devsSeconds.
	router := EventRouter new.


]

{ #category : #'as yet unclassified' }
AtomicModel >> lastChange [
	^lastChange
]

{ #category : #'as yet unclassified' }
AtomicModel >> name: aString [
	name := aString
]

{ #category : #'as yet unclassified' }
AtomicModel >> nextChange [
	^lastChange + sigma
]

{ #category : #'as yet unclassified' }
AtomicModel >> printOn: aStream [
	name printOn: aStream.
	aStream nextPutAll: ', '.
	self class printOn: aStream
]

{ #category : #'as yet unclassified' }
AtomicModel >> propagateProduction [
	router propagateProductionAt: self nextChange
]

{ #category : #'as yet unclassified' }
AtomicModel >> receive: anEvent in: port [
	self perform: port with: anEvent; updateTime: anEvent time
]

{ #category : #'as yet unclassified' }
AtomicModel >> sigma [
	^sigma
]

{ #category : #'as yet unclassified' }
AtomicModel >> sleep [
	self hold: (DEVSTime infinity)

]

{ #category : #'as yet unclassified' }
AtomicModel >> updateTime: time [
	lastChange > time ifTrue: [ self halt ].
	lastChange := time
]
