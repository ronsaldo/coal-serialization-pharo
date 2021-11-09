"
I am a type descriptor for a fixed length array.
"
Class {
	#name : #CoalFixedArrayTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#instVars : [
		'size',
		'elementType'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalFixedArrayTypeDescriptor >> elementType [

	^ elementType
]

{ #category : #accessing }
CoalFixedArrayTypeDescriptor >> elementType: anObject [

	elementType := anObject
]

{ #category : #'reading-writing' }
CoalFixedArrayTypeDescriptor >> readFieldWith: readStream [
	^ (1 to: size) collect: [ :i |
		elementType readFieldWith: readStream
	]
]

{ #category : #accessing }
CoalFixedArrayTypeDescriptor >> size [
	^ size
]

{ #category : #accessing }
CoalFixedArrayTypeDescriptor >> size: anObject [

	size := anObject
]

{ #category : #'reading-writing' }
CoalFixedArrayTypeDescriptor >> skipFieldWith: readStream [
	1 to: size do: [ :i |
		elementType skipFieldWith: readStream
	]
]
