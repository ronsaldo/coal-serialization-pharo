"
I am a type descriptor for a set of elements.
"
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

{ #category : #'reading-writing' }
CoalSetTypeDescriptor >> readFieldWith: readStream [
	| size |
	size := self readSizeWith: readStream.
	^ (1 to: size) collect: [ :i |
		elementType readFieldWith: readStream
	] as: Set
]

{ #category : #'reading-writing' }
CoalSetTypeDescriptor >> readSizeWith: readStream [
	kind = TypeDescriptorKind_Set8 ifTrue: [ ^ readStream nextUInt8 ].
	kind = TypeDescriptorKind_Set16 ifTrue: [ ^ readStream nextUInt16 ].
	kind = TypeDescriptorKind_Set32 ifTrue: [ ^ readStream nextUInt32 ].
	self error: 'Unsupported kind.'
]

{ #category : #'reading-writing' }
CoalSetTypeDescriptor >> skipFieldWith: readStream [
	| size |
	size := self readSizeWith: readStream.
	1 to: size do: [ :i |
		elementType skipFieldWith: readStream
	]
]
