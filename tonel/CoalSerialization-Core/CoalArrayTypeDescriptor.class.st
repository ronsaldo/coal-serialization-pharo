Class {
	#name : #CoalArrayTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#instVars : [
		'elementType'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalArrayTypeDescriptor >> elementType [

	^ elementType
]

{ #category : #accessing }
CoalArrayTypeDescriptor >> elementType: anObject [

	elementType := anObject
]
