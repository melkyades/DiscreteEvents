Class {
	#name : #Landowner,
	#superclass : #AtomicModel,
	#instVars : [
		'labourMarket',
		'capitalMarket',
		'a',
		'alpha',
		'land',
		'benefits',
		'usedWork',
		'desiredWork'
	],
	#category : #'DiscreteEvents-Ricardo'
}

{ #category : #'as yet unclassified' }
Landowner >> benefits [
	^benefits first

]

{ #category : #'as yet unclassified' }
Landowner >> capitalMarket: aMarket [
	capitalMarket := aMarket
]

{ #category : #'as yet unclassified' }
Landowner >> desiredWork [
	^desiredWork
]

{ #category : #'as yet unclassified' }
Landowner >> downDelta [
	^-1 * self upDelta
]

{ #category : #'as yet unclassified' }
Landowner >> harvest [
	| required cost interest production |
	required := self requiredWork.
	cost := labourMarket buy: required.
	interest := capitalMarket buy: cost.
	production := self produceUsing: required.
	benefits := Array with: (production - cost - interest) with: benefits first with: benefits second
]

{ #category : #'as yet unclassified' }
Landowner >> incite [
	self harvest; update; hold: 1 devsDays
]

{ #category : #'as yet unclassified' }
Landowner >> initialize [
	a := 10.
	alpha := 0.3.
	land := 15.
	desiredWork := 10.
	benefits := Array with: 0 with: 0 with: 0.
	usedWork := 0.
	super initialize.
	self hold: 0 devsDays
]

{ #category : #'as yet unclassified' }
Landowner >> labourMarket: aMarket [
	labourMarket := aMarket
]

{ #category : #'as yet unclassified' }
Landowner >> produceUsing: amountOfWork [
	usedWork := amountOfWork.
	^ a * (amountOfWork raisedTo: alpha) * (land raisedTo: 1 - alpha)
]

{ #category : #'as yet unclassified' }
Landowner >> requiredWork [
	| work wages |
	work := desiredWork min: labourMarket availability.
	wages := capitalMarket availability min: (labourMarket priceFor: work).
	^ (labourMarket quantityFor: wages)
]

{ #category : #'as yet unclassified' }
Landowner >> upDelta [
	^0.1 * a + (usedWork  * 0.05)
]

{ #category : #'as yet unclassified' }
Landowner >> update [
	| delta |
	delta := benefits sum >= 0
		ifTrue: [ self upDelta ]
		ifFalse: [ self downDelta ].
	desiredWork := usedWork  + (delta max: -2990)
]

{ #category : #'as yet unclassified' }
Landowner >> usedWork [
	^usedWork
]
