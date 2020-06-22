Class {
	#name : #DEVSTime,
	#superclass : #Magnitude,
	#instVars : [
		'seconds'
	],
	#pools : [
		'ChronologyConstants'
	],
	#category : #'DiscreteEvents-Kernel'
}

{ #category : #'as yet unclassified' }
DEVSTime class >> days: days [
	^self new seconds: days * SecondsInDay

]

{ #category : #'as yet unclassified' }
DEVSTime class >> infinity [
	^self seconds: Float infinity
]

{ #category : #'as yet unclassified' }
DEVSTime class >> nanoSeconds: nanos [
	^self seconds: nanos asFloat / NanosInSecond.

]

{ #category : #'as yet unclassified' }
DEVSTime class >> seconds: seconds [
	^self new seconds: seconds

]

{ #category : #'as yet unclassified' }
DEVSTime >> * anObject [
	^ anObject isDevsTime
		ifTrue: [ self halt ]
		ifFalse: [ (seconds * anObject) devsSeconds ]
]

{ #category : #'as yet unclassified' }
DEVSTime >> + anotherTime [
	^ self class seconds: seconds + anotherTime seconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> - anotherTime [
	^ self class seconds: seconds - anotherTime seconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> / anObject [
	^ anObject isDevsTime
		ifTrue: [ seconds / anObject seconds ]
		ifFalse: [ (seconds / anObject) devsSeconds ]
]

{ #category : #'as yet unclassified' }
DEVSTime >> < anotherTime [
	^ seconds < anotherTime seconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> = anotherTime [
	anotherTime class = self class
		ifFalse: [ ^ false ].
	^ seconds = anotherTime seconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> > anotherTime [
	^ seconds > anotherTime seconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> @ aNumber [
	^seconds @ aNumber
]

{ #category : #'as yet unclassified' }
DEVSTime >> adaptToInteger: anInteger andCompare: selector [
	^ anInteger perform: selector with: seconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> ceiling [
	^ seconds ceiling devsSeconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> days [
	^(seconds quo: SecondsInDay)
]

{ #category : #'as yet unclassified' }
DEVSTime >> floor [
	^ seconds floor devsSeconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> hash [
	^seconds hash
]

{ #category : #'as yet unclassified' }
DEVSTime >> hours [
	^(seconds rem: SecondsInDay) quo: SecondsInHour
]

{ #category : #'as yet unclassified' }
DEVSTime >> isDevsTime [
		^true
]

{ #category : #'*DiscreteEvents' }
DEVSTime >> isInfinite [
	^ seconds isInfinite
]

{ #category : #'*DiscreteEvents' }
DEVSTime >> isNaN [
	^ seconds isNaN
]

{ #category : #'*DiscreteEvents' }
DEVSTime >> isNumber [
	^ true
]

{ #category : #'as yet unclassified' }
DEVSTime >> isZero [
	^seconds = 0
]

{ #category : #'as yet unclassified' }
DEVSTime >> ln [
	^ seconds ln devsSeconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> minutes [
	^(seconds rem: SecondsInHour) quo: SecondsInMinute
]

{ #category : #'as yet unclassified' }
DEVSTime >> nanoSeconds [
	^ seconds * NanosInSecond
]

{ #category : #'as yet unclassified' }
DEVSTime >> nanoSeconds: nanoCount [
	seconds := nanoCount asFloat / NanosInSecond
]

{ #category : #'as yet unclassified' }
DEVSTime >> nanoSecondsPart [
	^seconds rem: 1
]

{ #category : #'as yet unclassified' }
DEVSTime >> negative [
	^seconds < 0
]

{ #category : #'as yet unclassified' }
DEVSTime >> printOn: aStream [
	"Format as per ANSI 5.8.2.16: [-]D:HH:MM:SS[.S]"

	| d h m s n |
	self isInfinite
		ifTrue: [ ^ aStream nextPutAll: 'infinity' ].
	d := self days abs.
	h := self hours abs.
	m := self minutes abs.
	s := self secondsPart abs truncated.
	n := self nanoSecondsPart abs.
	self negative
		ifTrue: [ aStream nextPut: $- ].
	d printOn: aStream.
	aStream nextPut: $:.
	h < 10
		ifTrue: [ aStream nextPut: $0 ].
	h printOn: aStream.
	aStream nextPut: $:.
	m < 10
		ifTrue: [ aStream nextPut: $0 ].
	m printOn: aStream.
	aStream nextPut: $:.
	s < 10
		ifTrue: [ aStream nextPut: $0 ].
	s printOn: aStream.
	n = 0
		ifFalse: [ | z ps |
			aStream nextPut: $..
			ps := n printString padRightTo: 9 with: $0.
			z := ps findLast: [ :c | c asciiValue > $0 asciiValue ].
			ps from: 3 to: z do: [ :c | aStream nextPut: c ] ]
]

{ #category : #'as yet unclassified' }
DEVSTime >> seconds [
	^ seconds
]

{ #category : #'as yet unclassified' }
DEVSTime >> seconds: amount [
	seconds := amount
]

{ #category : #'as yet unclassified' }
DEVSTime >> seconds: secondCount nanoSeconds: nanoCount [ 
	"Private - only used by Duration class"

	seconds := secondCount + (nanoCount asFloat / NanosInSecond)
	
]

{ #category : #'as yet unclassified' }
DEVSTime >> secondsPart [
	^(seconds rem: SecondsInMinute) truncated
]
