"
I am a type descriptor for an aggregate inline encoded field.
"
Class {
	#name : #CoalStructureTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#instVars : [
		'structureType'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #'reading-writing' }
CoalStructureTypeDescriptor >> readFieldWith: readStream [
	^ structureType readAsFieldWith: readStream
]

{ #category : #'reading-writing' }
CoalStructureTypeDescriptor >> skipFieldWith: readStream [
	structureType allFieldsDo: [ :field |
		field encoding skipFieldWith: readStream
	]
]

{ #category : #accessing }
CoalStructureTypeDescriptor >> structureType [

	^ structureType
]

{ #category : #accessing }
CoalStructureTypeDescriptor >> structureType: anObject [

	structureType := anObject
]
