Class {
	#name : #EventRouter,
	#superclass : #Object,
	#instVars : [
		'routes'
	],
	#category : #'DiscreteEvents-Kernel'
}

{ #category : #'as yet unclassified' }
EventRouter >> addRoute: from to: to [
	| route |
	route := Route from: from to: to.
	^routes add: route
]

{ #category : #'as yet unclassified' }
EventRouter >> initialize [
	routes := OrderedCollection new
]

{ #category : #'as yet unclassified' }
EventRouter >> propagateProductionAt: time [
	routes do: [:route | route propagateAt: time ]
]
