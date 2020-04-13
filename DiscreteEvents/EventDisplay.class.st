Class {
	#name : #EventDisplay,
	#superclass : #AtomicModel,
	#instVars : [
		'events'
	],
	#category : #'DiscreteEvents-GUI'
}

{ #category : #'as yet unclassified' }
EventDisplay >> addEvent: event [
	events add: event
]

{ #category : #'as yet unclassified' }
EventDisplay >> buildChart [
	| table b ds |

	table := self eventTable.
	b := RTGrapher new.
	b extent: 400 @ 200.

	ds := RTData new.
	ds interaction fixedPopupText: [ :row | row value at: 1 ]. 
	"ds dotShape ellipse 
		color: (Color blue alpha: 0.3);
		size: [ :row  | 5 ]."
	ds points: table values.
	ds connectColor: Color blue.
	ds y: [ :row | row at: 2 ].
	b add: ds. 
	b axisXWithNumberOfTicks: table values size.
	"b axisY noDecimals."
	^b build.
]

{ #category : #'as yet unclassified' }
EventDisplay >> buildChart2 [
	| table b ds |

	table := self eventTable.
	b := RTGrapher new.
	b extent: 400 @ 200.

	ds := RTData new.
	ds dotShape circle color: Color red.
	ds interaction fixedPopupText: [ :e | e printString ].

	ds points: events.
	ds connectColor: Color blue.
	ds x: [ :e | e time asSeconds ].
	ds y: [ :e | e value ].
	b add: ds. 
	b axisXWithNumberOfTicks: table values size.
	^b build openTitled: name.
]

{ #category : #'as yet unclassified' }
EventDisplay >> eventTable [
	| result |
	result := RTTabTable new input: 
	'evento 1,20
	evento2,30' usingDelimiter: $,.
	result 	convertColumnsAsInteger: #(2).
	^result

]

{ #category : #'as yet unclassified' }
EventDisplay >> initialize [
	events := OrderedCollection new.
	super initialize.
	self buildChart; sleep
]

{ #category : #'as yet unclassified' }
EventDisplay >> receive: event [
	self addEvent: event.
	self sleep
]
