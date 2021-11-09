"
I am a descriptor for a field type in the Coal serialization format.
"
Class {
	#name : #CoalTypeDescriptor,
	#superclass : #Object,
	#instVars : [
		'kind'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalTypeDescriptor >> kind [

	^ kind
]

{ #category : #accessing }
CoalTypeDescriptor >> kind: anObject [

	kind := anObject
]
