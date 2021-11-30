"
I am the baseline for loading the coal serialization format support.
"
Class {
	#name : #BaselineOfCoalSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfCoalSerialization
}

{ #category : #baselines }
BaselineOfCoalSerialization >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
			spec
				package: #'CoalSerialization-Core';
				package: #'CoalSerialization-Core-Tests' with: [ spec requires: #'CoalSerialization-Core' ];
				package: #'CoalSerialization-Tools' with: [ spec requires: #'CoalSerialization-Core' ]
	]
]
