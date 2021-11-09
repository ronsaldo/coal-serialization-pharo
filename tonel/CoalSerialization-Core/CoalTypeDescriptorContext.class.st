Class {
	#name : #CoalTypeDescriptorContext,
	#superclass : #Object,
	#instVars : [
		'valueTypes',
		'clusterTypes',
		'primitiveTypeDescriptors'
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
	TypeDescriptorKindParseSelectors := Array new: 256 withAll: #parseUnsupportedKind:.
	
	1 to: PrimitiveTypeDescriptorCount do: [ :i |
		TypeDescriptorKindParseSelectors at: i put: #parsePrimitiveDescriptorKind:
	].

	{
		TypeDescriptorKind_Struct . #parseStructureTypeDescriptorKind:.
		TypeDescriptorKind_TypedObject . #parseTypedObjectTypeDescriptorKind:.
		TypeDescriptorKind_FixedArray . #parseFixedArrayTypeDescriptorKind:.
		TypeDescriptorKind_Array8 . #parseArray8TypeDescriptorKind:.
		TypeDescriptorKind_Array16 . #parseArray16TypeDescriptorKind:.
		TypeDescriptorKind_Array32 . #parseArray32TypeDescriptorKind:.
		TypeDescriptorKind_Set8 . #parseSet8TypeDescriptorKind:.
		TypeDescriptorKind_Set16 . #parseSet16TypeDescriptorKind:.
		TypeDescriptorKind_Set32 . #parseSet32TypeDescriptorKind:.
		TypeDescriptorKind_Map8 . #parseMap8TypeDescriptorKind:.
		TypeDescriptorKind_Map16 . #parseMap16TypeDescriptorKind:.
		TypeDescriptorKind_Map32 . #parseMap32TypeDescriptorKind:.
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
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseArray16TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseArray32TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseArray8TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseFixedArrayTypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseMap16TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseMap32TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseMap8TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parsePrimitiveDescriptorKind: kind [
	(primitiveTypeDescriptors at: kind + 1) ifNotNil: [ :found | ^ found ].
	^ primitiveTypeDescriptors at: kind + 1 put: (CoalPrimitiveTypeDescriptor new kind: kind; yourself)
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseSet16TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseSet32TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseSet8TypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseStructureTypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseTypedObjectTypeDescriptorKind: kind [
	self halt
]

{ #category : #parsing }
CoalTypeDescriptorContext >> parseUnsupportedKind: kind [
	self error: 'Unsupported type descriptor kind.'.
]

{ #category : #'as yet unclassified' }
CoalTypeDescriptorContext >> readNextTypeDescriptorWith: readStream [
	| kind |
	kind := readStream nextUInt8.
	^ self perform: (TypeDescriptorKindParseSelectors at: kind + 1) with: kind
]
