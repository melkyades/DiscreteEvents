Class {
	#name : #Event,
	#superclass : #Object,
	#instVars : [
		'time',
		'value'
	],
	#category : #'DiscreteEvents-Kernel'
}

{ #category : #'as yet unclassified' }
Event class >> at: aDuration [
	^self new time: aDuration
]

{ #category : #'as yet unclassified' }
Event class >> at: aDuration valued: value [
	^self new value: value; time: aDuration
]

{ #category : #'as yet unclassified' }
Event >> printOn: aStream [ 
	aStream nextPutAll: 'Ev «', value printString, '» @ ', time printString.
]

{ #category : #'as yet unclassified' }
Event >> time [
	^time
]

{ #category : #'as yet unclassified' }
Event >> time: aDuration [
	time := aDuration
]

{ #category : #'as yet unclassified' }
Event >> value [
	^value
]

{ #category : #'as yet unclassified' }
Event >> value: value1 [
	value := value1
]
