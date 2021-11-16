"
I am a generic coal object. I am used for inspecting arbitrary coal serialized data.
"
Class {
	#name : #CoalGenericObject,
	#superclass : #CoalGenericAggregate,
	#category : #'CoalSerialization-Core-Materialization'
}

{ #category : #converting }
CoalGenericObject >> asCoalGenericObjectForPrinting [
	^ type
		ifNotNil: [ 'A ', type name , ' reference' ]
		ifNil: [ 'Coal Object Reference' ]
]
