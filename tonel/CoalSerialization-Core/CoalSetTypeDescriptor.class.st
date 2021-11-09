Class {
	#name : #CoalSetTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#instVars : [
		'elementType'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalSetTypeDescriptor >> elementType [

	^ elementType
]

{ #category : #accessing }
CoalSetTypeDescriptor >> elementType: anObject [

	elementType := anObject
]
