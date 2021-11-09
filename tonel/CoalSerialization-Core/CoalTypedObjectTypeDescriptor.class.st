Class {
	#name : #CoalTypedObjectTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#instVars : [
		'objectType'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalTypedObjectTypeDescriptor >> objectType [

	^ objectType
]

{ #category : #accessing }
CoalTypedObjectTypeDescriptor >> objectType: anObject [

	objectType := anObject
]
