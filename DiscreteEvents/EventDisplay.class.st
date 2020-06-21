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
	| c times values plot |
	times := events collect: [ :e | e time seconds ].
	values := events collect: [ :e | e value ].
	plot := RSLinePlot new x: times y: values.
	c := RSChart new.
	c
		extent: 400 @ 200;
		xlabel: 'seconds';
		addDecoration: RSVerticalTick new;
		addDecoration: RSHorizontalTick new;
		addPlot: plot.
	^ c open
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
EventDisplay >> initialize [
	events := OrderedCollection new.
	super initialize.
	self sleep
]

{ #category : #'as yet unclassified' }
EventDisplay >> receive: event [
	self addEvent: event.
	self sleep
]
