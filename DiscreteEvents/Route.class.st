Class {
	#name : #Route,
	#superclass : #Object,
	#instVars : [
		'fromModel',
		'fromPort',
		'toModel',
		'toPort'
	],
	#category : #'DiscreteEvents-Kernel'
}

{ #category : #'as yet unclassified' }
Route class >> from: fromModel at: fromPort to: toModel at: toPort [
	^self new from: fromModel at: fromPort to: toModel at: toPort
]

{ #category : #'as yet unclassified' }
Route class >> from: from to: to [
	^self from: from key at: from value to: to key at: to value
]

{ #category : #'as yet unclassified' }
Route >> from: fromModel1 at: fromPort1 to: toModel1 at: toPort1 [
	(fromModel1 isKindOf: AtomicModel) ifFalse: [self halt].
	fromModel := fromModel1.
	fromPort  := fromPort1.
	toModel   := toModel1.
	toPort    := toPort1
]

{ #category : #'as yet unclassified' }
Route >> propagateAt: time [
	| value event |
	value := fromModel perform: fromPort.
	event := Event at: time valued: value.
	^toModel receive: event in: toPort

]
