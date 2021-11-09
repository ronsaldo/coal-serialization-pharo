Class {
	#name : #CoalMapTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#instVars : [
		'keyType',
		'valueType'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalMapTypeDescriptor >> keyType [

	^ keyType
]

{ #category : #accessing }
CoalMapTypeDescriptor >> keyType: anObject [

	keyType := anObject
]

{ #category : #accessing }
CoalMapTypeDescriptor >> valueType [

	^ valueType
]

{ #category : #accessing }
CoalMapTypeDescriptor >> valueType: anObject [

	valueType := anObject
]
