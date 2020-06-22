Class {
	#name : #QuantizedIntegrator,
	#superclass : #AtomicModel,
	#instVars : [
		'dx',
		'q',
		'last',
		'accumulated'
	],
	#pools : [
		'ChronologyConstants'
	],
	#category : #'DiscreteEvents-Atomics'
}

{ #category : #'as yet unclassified' }
QuantizedIntegrator >> incite [
	| nextTime |
	last := last + (q * dx sign).
	nextTime := (q / dx) abs devsSeconds.
	accumulated := 0.0.
	self hold: nextTime.

]

{ #category : #'as yet unclassified' }
QuantizedIntegrator >> initialC: value [
	last := value
]

{ #category : #'as yet unclassified' }
QuantizedIntegrator >> initialize [
	accumulated := 0.0.
	dx := 0.
	super initialize.
	self sleep
]

{ #category : #'as yet unclassified' }
QuantizedIntegrator >> input: event [
	| elapsed remaining nextTime |

	elapsed := event time - self lastChange.
	accumulated := accumulated + (elapsed seconds * dx).
	dx := event value.
	remaining := q * dx sign - accumulated.
	nextTime := dx isZero
		ifTrue: [ DEVSTime infinity ]
		ifFalse: [ (remaining / dx) abs devsSeconds ].
	self hold: nextTime
]

{ #category : #'as yet unclassified' }
QuantizedIntegrator >> output [
	| y |
	y := dx = 0 ifTrue: [self halt] ifFalse: [ last + (q * dx sign) ].
	^y
]

{ #category : #'as yet unclassified' }
QuantizedIntegrator >> q: value [
	q := value
]
