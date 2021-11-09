Class {
	#name : #CoalStructureTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#instVars : [
		'structureType'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalStructureTypeDescriptor >> structureType [

	^ structureType
]

{ #category : #accessing }
CoalStructureTypeDescriptor >> structureType: anObject [

	structureType := anObject
]
