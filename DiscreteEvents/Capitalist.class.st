Class {
	#name : #Capitalist,
	#superclass : #AtomicModel,
	#instVars : [
		'interest',
		'soldCapital',
		'capital',
		'market'
	],
	#category : #'DiscreteEvents-Ricardo'
}

{ #category : #'as yet unclassified' }
Capitalist >> available [
	^capital - soldCapital 
]

{ #category : #'as yet unclassified' }
Capitalist >> capital [
	^capital
]

{ #category : #'as yet unclassified' }
Capitalist >> downDelta [
	^-1 * self upDelta

]

{ #category : #'as yet unclassified' }
Capitalist >> incite [
	self recalculateInterest hold: 1 devsDays
]

{ #category : #'as yet unclassified' }
Capitalist >> initialize [
	soldCapital := 0.
	capital := 1000.
	interest := 0.
	super initialize.
	self hold: 1 devsDays
]

{ #category : #'as yet unclassified' }
Capitalist >> interest [
	^interest
]

{ #category : #'as yet unclassified' }
Capitalist >> market: aMarket [
	market := aMarket.
	market offer: self
]

{ #category : #'as yet unclassified' }
Capitalist >> price [
	^interest
]

{ #category : #'as yet unclassified' }
Capitalist >> recalculateInterest [
	| delta |
	delta := soldCapital >= (0)
		ifTrue: [ self upDelta ]
		ifFalse: [ self downDelta ].
	capital := capital + (interest * soldCapital).
	interest := (interest + delta) max: 0.001.
	self sold: 0
]

{ #category : #'as yet unclassified' }
Capitalist >> sell: amount [
	| sold |
	sold := amount min: self available.
	^ self sold: sold + self sold

]

{ #category : #'as yet unclassified' }
Capitalist >> sold [
	^soldCapital
]

{ #category : #'as yet unclassified' }
Capitalist >> sold: amount [
	soldCapital := amount
]

{ #category : #'as yet unclassified' }
Capitalist >> upDelta [
	^((soldCapital + interest) / capital + 0.01) * 0.15

]
