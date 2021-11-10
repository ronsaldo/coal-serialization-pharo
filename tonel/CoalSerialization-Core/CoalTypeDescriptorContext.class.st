Class {
	#name : #CoalTypeDescriptorContext,
	#superclass : #Object,
	#instVars : [
		'valueTypes',
		'clusterTypes',
		'primitiveTypeDescriptors',
		'typeDescriptorCache'
	],
	#classVars : [
		'TypeDescriptorKindParseSelectors'
	],
	#pools : [
		'CoalConstants'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #initialization }
CoalTypeDescriptorContext class >> initialize [
	TypeDescriptorKindParseSelectors := Array new: 256 withAll: #parseUnsupportedKind:with:.
	
	1 to: PrimitiveTypeDescriptorCount do: [ :i |
		TypeDescriptorKindParseSelectors at: i put: #parsePrimitiveDescriptorKind:with:
	].

	{
		TypeDescriptorKind_Struct . #parseStructureTypeDescriptorKind:with:.
		TypeDescriptorKind_TypedObject . #parseTypedObjectTypeDescriptorKind:with:.
		TypeDescriptorKind_FixedArray . #parseFixedArrayTypeDescriptorKind:with:.
		TypeDescriptorKind_Array8 . #parseArrayTypeDescriptorKind:with:.
		TypeDescriptorKind_Array16 . #parseArrayTypeDescriptorKind:with:.
		TypeDescriptorKind_Array32 . #parseArrayTypeDescriptorKind:with:.
		TypeDescriptorKind_Set8 . #parseSetTypeDescriptorKind:with:.
		TypeDescriptorKind_Set16 . #parseSetTypeDescriptorKind:with:.
		TypeDescriptorKind_Set32 . #parseSetTypeDescriptorKind:with:.
		TypeDescriptorKind_Map8 . #parseMapTypeDescriptorKind:with:.
		TypeDescriptorKind_Map16 . #parseMapTypeDescriptorKind:with:.
		TypeDescriptorKind_Map32 . #parseMapTypeDescriptorKind:with:.
	} pairsDo: [ :kind :selector |
		TypeDescriptorKindParseSelectors at: kind + 1 put: selector
	]
]

{ #category : #adding }
CoalTypeDescriptorContext >> addClusterType: aClusterType [
	clusterTypes add: aClusterType
]

{ #category : #adding }
CoalTypeDescriptorContext >> addValueType: aValueType [
	valueTypes add: aValueType
]

{ #category : #initialization }
CoalTypeDescriptorContext >> initialize [
	super initialize.
	valueTypes := OrderedCollection new.
	clusterTypes := OrderedCollection new.
	primitiveTypeDescriptors := Array new: PrimitiveTypeDescriptorCount.
	typeDescriptorCache := Dictionary new.
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseArrayTypeDescriptorKind: kind with: readStream [
	| elementType |
	elementType := self readNextTypeDescriptorWith: readStream.
	^ typeDescriptorCache at: { CoalArrayTypeDescriptor . kind . elementType } ifAbsentPut: [ 
		CoalArrayTypeDescriptor new
			kind: kind;
			elementType: elementType;
			yourself
	]
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseFixedArrayTypeDescriptorKind: kind with: readStream [
	| elementType size |
	size := readStream nextUInt32.
	elementType := self readNextTypeDescriptorWith: readStream.
	^ typeDescriptorCache at: { CoalFixedArrayTypeDescriptor . kind . elementType } ifAbsentPut: [ 
		CoalFixedArrayTypeDescriptor new
			kind: kind;
			size: size;
			elementType: elementType;
			yourself
	]
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseMapTypeDescriptorKind: kind with: readStream [
	| keyType valueType |
	keyType := self readNextTypeDescriptorWith: readStream.
	valueType := self readNextTypeDescriptorWith: readStream.
	^ typeDescriptorCache at: { CoalMapTypeDescriptor . kind . keyType . valueType } ifAbsentPut: [ 
		CoalMapTypeDescriptor new
			kind: kind;
			keyType: keyType;
			valueType: valueType;
			yourself
	]
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parsePrimitiveDescriptorKind: kind with: readStream [
	(primitiveTypeDescriptors at: kind + 1) ifNotNil: [ :found | ^ found ].
	^ primitiveTypeDescriptors at: kind + 1 put: (CoalPrimitiveTypeDescriptor new kind: kind; yourself)
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseSetTypeDescriptorKind: kind with: readStream [
	| elementType |
	elementType := self readNextTypeDescriptorWith: readStream.
	^ typeDescriptorCache at: { CoalSetTypeDescriptor . kind . elementType } ifAbsentPut: [ 
		CoalSetTypeDescriptor new
			kind: kind;
			elementType: elementType;
			yourself
	]
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseStructureTypeDescriptorKind: kind with: readStream [
	| structureType |
	structureType := valueTypes at: readStream nextUInt32 + 1.
	^ typeDescriptorCache at: { CoalStructureTypeDescriptor . kind . structureType } ifAbsentPut: [ 
		CoalStructureTypeDescriptor new
			kind: kind;
			structureType: structureType;
			yourself
	]
	
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseTypedObjectTypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseUnsupportedKind: kind with: readStream [
	self error: 'Unsupported type descriptor kind.'.
]

{ #category : #parsing }
CoalTypeDescriptorContext >> readNextTypeDescriptorWith: readStream [
	| kind |
	kind := readStream nextUInt8.
	^ self perform: (TypeDescriptorKindParseSelectors at: kind + 1) with: kind with: readStream
]
