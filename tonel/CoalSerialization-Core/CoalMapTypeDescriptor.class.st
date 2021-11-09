"
I am a type descriptor for a map or dictionary. 
"
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

{ #category : #'reading-writing' }
CoalMapTypeDescriptor >> readFieldWith: readStream [
	| size |
	size := self readSizeWith: readStream.
	^ (1 to: size) collect: [ :i |
		Association key: (keyType readFieldWith: readStream) value: (valueType readFieldWith: readStream)
	] as: Dictionary
]

{ #category : #'reading-writing' }
CoalMapTypeDescriptor >> readSizeWith: readStream [
	kind = TypeDescriptorKind_Map8 ifTrue: [ ^ readStream nextUInt8 ].
	kind = TypeDescriptorKind_Map16 ifTrue: [ ^ readStream nextUInt16 ].
	kind = TypeDescriptorKind_Map32 ifTrue: [ ^ readStream nextUInt32 ].
	self error: 'Unsupported kind.'
]

{ #category : #'reading-writing' }
CoalMapTypeDescriptor >> skipFieldWith: readStream [
	| size |
	size := self readSizeWith: readStream.
	1 to: size do: [ :i |
		keyType skipFieldWith: readStream.
		valueType skipFieldWith: readStream.
	]
]

{ #category : #accessing }
CoalMapTypeDescriptor >> valueType [

	^ valueType
]

{ #category : #accessing }
CoalMapTypeDescriptor >> valueType: anObject [

	valueType := anObject
]
