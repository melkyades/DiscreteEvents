Extension { #name : #DEVSTime }

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
