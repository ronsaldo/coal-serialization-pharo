"
I am a type descriptor for a variable length array.
"
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

{ #category : #'reading-writing' }
CoalArrayTypeDescriptor >> readFieldWith: readStream [
	| size |
	size := self readSizeWith: readStream.
	^ (1 to: size) collect: [ :i |
		elementType readFieldWith: readStream
	]
]

{ #category : #'reading-writing' }
CoalArrayTypeDescriptor >> readSizeWith: readStream [
	kind = TypeDescriptorKind_Array8 ifTrue: [ ^ readStream nextUInt8 ].
	kind = TypeDescriptorKind_Array16 ifTrue: [ ^ readStream nextUInt16 ].
	kind = TypeDescriptorKind_Array32 ifTrue: [ ^ readStream nextUInt32 ].
	self error: 'Unsupported kind.'
]

{ #category : #'reading-writing' }
CoalArrayTypeDescriptor >> skipFieldWith: readStream [
	| size |
	size := self readSizeWith: readStream.
	1 to: size do: [ :i |
		elementType skipFieldWith: readStream
	]
]
