"
I am a generic coal structure. I am used for inspecting arbitrary coal serialized data.
"
Class {
	#name : #CoalGenericStructure,
	#superclass : #CoalGenericAggregate,
	#category : #'CoalSerialization-Core-Materialization'
}

{ #category : #printing }
CoalGenericStructure >> printOn: aStream [
	super printOn: aStream.
	(type isNil or: [slots isNil]) ifTrue: [ ^ self ].
	self asFieldNameValueAssociationList printOn: aStream
]
