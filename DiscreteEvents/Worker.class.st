Class {
	#name : #Worker,
	#superclass : #AtomicModel,
	#instVars : [
		'salary',
		'soldHours',
		'maximumHours',
		'market'
	],
	#category : #'DiscreteEvents-Ricardo'
}

{ #category : #'as yet unclassified' }
Worker class >> minimumIncome [
	^ 4 * 2
]

{ #category : #'as yet unclassified' }
Worker >> available [
	^maximumHours - soldHours
]

{ #category : #'as yet unclassified' }
Worker >> downDelta [
	^-1 * self upDelta
]

{ #category : #'as yet unclassified' }
Worker >> incite [
	self recalculateSalary; hold: 1 devsDays
]

{ #category : #'as yet unclassified' }
Worker >> initialize [
	soldHours := 0.
	maximumHours := 12.
	salary := 10.
	super initialize.
	self hold: 1 devsDays
]

{ #category : #'as yet unclassified' }
Worker >> market: aMarket [
	market := aMarket.
	market offer: self
]

{ #category : #'as yet unclassified' }
Worker >> minimumIncome [
	^self class minimumIncome
]

{ #category : #'as yet unclassified' }
Worker >> price [
	^salary
]

{ #category : #'as yet unclassified' }
Worker >> recalculateSalary [
	| delta |
	delta := soldHours >= maximumHours
		ifTrue: [ self upDelta ]
		ifFalse: [ self downDelta ].
	self salary: salary + delta; sold: 0
]

{ #category : #'as yet unclassified' }
Worker >> salary [
	^salary
]

{ #category : #'as yet unclassified' }
Worker >> salary: aSalary [ 
	salary := aSalary
]

{ #category : #'as yet unclassified' }
Worker >> sell: amount [
	| sold |
	sold := amount min: self available.
	^ self sold: sold + self sold

]

{ #category : #'as yet unclassified' }
Worker >> sold [
	^soldHours
]

{ #category : #'as yet unclassified' }
Worker >> sold: amount [
	soldHours := amount
]

{ #category : #'as yet unclassified' }
Worker >> upDelta [
	^self minimumIncome / 8 * 0.75 + (self salary * 0.05) /  8
]
