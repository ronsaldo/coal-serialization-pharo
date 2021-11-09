"
I am a type descriptor for a typed object reference.
"
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

{ #category : #'reading-writing' }
CoalTypedObjectTypeDescriptor >> readFieldWith: readStream [
	^ readStream nextInstanceReference
]

{ #category : #'reading-writing' }
CoalTypedObjectTypeDescriptor >> skipFieldWith: readStream [
	readStream skip: 4
]
