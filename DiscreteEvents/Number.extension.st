Extension { #name : #Number }

{ #category : #'*DiscreteEvents' }
Number >> devsDays [
 	^ DEVSTime days: self
]

{ #category : #'*DiscreteEvents' }
Number >> devsSeconds [
 	^ DEVSTime seconds: self
]
