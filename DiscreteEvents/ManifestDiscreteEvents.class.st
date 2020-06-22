"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestDiscreteEvents,
	#superclass : #PackageManifest,
	#category : #'DiscreteEvents-Manifest'
}

{ #category : #'code-critics' }
ManifestDiscreteEvents class >> ruleRBUsesAddRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#IntegratorTest #testConstantPositiveDX #false)) #'2020-06-21T21:16:24.170486-03:00') )
]
