Class {
	#name : #Market,
	#superclass : #AtomicModel,
	#instVars : [
		'offers',
		'qe',
		'pe'
	],
	#category : #'DiscreteEvents-Ricardo'
}

{ #category : #'as yet unclassified' }
Market >> availability [
	^ (offers collect: [ :seller | seller available ]) sum

]

{ #category : #'as yet unclassified' }
Market >> buy: quantity [
	| price remaining sorted bought |
	price := 0.
	remaining := quantity.
	sorted := offers sorted: [:seller1 :seller2 | seller1 price < seller2 price ].
	sorted
		do: [ :seller | 
			bought := remaining min: seller available.
			remaining := remaining - bought.
			price := price + (seller price * bought).
			seller sell: bought.
			remaining = 0 ifTrue: [^price]
		].
	^price
]

{ #category : #'as yet unclassified' }
Market >> initialize [
	offers := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Market >> offer: subject [
	offers add: subject
]

{ #category : #'as yet unclassified' }
Market >> offer: subject at: price [
	offers at: subject put: price
]

{ #category : #'as yet unclassified' }
Market >> priceFor: quantity [
	| price remaining sorted bought |
	price := 0.
	remaining := quantity.
	sorted := offers sorted: [:seller1 :seller2 | seller1 price < seller2 price ].
	sorted
		do: [ :seller | 
			bought := remaining min: seller available.
			remaining := remaining - bought.
			price := price + (seller price * bought).
			remaining = 0 ifTrue: [^price]
		].
	^price
]

{ #category : #'as yet unclassified' }
Market >> quantityFor: amount [
	| remaining sorted bought cost hours |
	remaining := amount.
	bought := 0.
	sorted := offers sorted: [:seller1 :seller2 | seller1 price < seller2 price ].
	sorted
		do: [ :seller | 
			cost := remaining min: seller available * seller price.
			remaining := remaining - cost.
			hours := cost // seller price.
			bought := bought + hours.
			hours = 0 ifTrue: [^bought]
		].
	^bought
]
