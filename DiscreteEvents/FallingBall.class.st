Class {
	#name : #FallingBall,
	#superclass : #Object,
	#instVars : [
		'acceleration',
		'velocity',
		'position',
		'physics'
	],
	#category : #'DiscreteEvents-Tests'
}

{ #category : #'as yet unclassified' }
FallingBall >> acceleration [
	^acceleration

	


]

{ #category : #'as yet unclassified' }
FallingBall >> initialize [

	acceleration := SingleEvent new value: -10; instant: 0 devsSeconds.
	velocity := QuantizedIntegrator named: 'accel to vel'.
	position := QuantizedIntegrator named: 'vel to pos'.

	acceleration forward: #output to: velocity as: #input:.
	velocity forward: #output to: position as: #input:.

	physics := CoupledModel new
							add: acceleration as: #acceleration;
							add: velocity as: #velocity;
							add: position as: #position.

	


]

{ #category : #'as yet unclassified' }
FallingBall >> physics [
	^physics
	


	


]

{ #category : #'as yet unclassified' }
FallingBall >> position [
	^position
	


	


]

{ #category : #'as yet unclassified' }
FallingBall >> velocity [
	^velocity


	


]
