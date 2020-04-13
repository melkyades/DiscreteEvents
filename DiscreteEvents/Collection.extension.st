Extension { #name : #Collection }

{ #category : #'*DiscreteEvents' }
Collection >> max: anEvaluable [
	^self detectMax: anEvaluable
]

{ #category : #'*DiscreteEvents' }
Collection >> min: anEvaluable [
	^self detectMin: anEvaluable
]
