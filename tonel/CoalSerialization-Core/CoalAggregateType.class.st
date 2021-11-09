"
I am a coal aggregate type. An aggregate type holds a list of sequentially serialized fields.
"
Class {
	#name : #CoalAggregateType,
	#superclass : #CoalType,
	#instVars : [
		'fields',
		'fieldToSlotIndexDictionary'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #enumerating }
CoalAggregateType >> allFieldsDo: aBlock [
	fields do: aBlock
]

{ #category : #'as yet unclassified' }
CoalAggregateType >> fieldToSlotIndexDictionary [
	| index |
	fieldToSlotIndexDictionary ifNotNil: [ ^ fieldToSlotIndexDictionary ].
	fieldToSlotIndexDictionary := Dictionary new.
	index := 1.
	self allFieldsDo: [ :field |
		fieldToSlotIndexDictionary at: field name put: index.
		index := index + 1
	].
	^ fieldToSlotIndexDictionary
]

{ #category : #accessing }
CoalAggregateType >> fields [

	^ fields
]

{ #category : #accessing }
CoalAggregateType >> fields: anObject [

	fields := anObject
]

{ #category : #'as yet unclassified' }
CoalAggregateType >> slotOfFieldNamed: fieldName [
	^ self fieldToSlotIndexDictionary at: fieldName
]

{ #category : #accessing }
CoalAggregateType >> totalSlotCount [
	^ fields size
]
