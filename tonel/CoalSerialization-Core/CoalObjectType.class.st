"
I represent the type for a heap allocated and potentially cyclic object with fields. 
"
Class {
	#name : #CoalObjectType,
	#superclass : #CoalAggregateType,
	#instVars : [
		'superType',
		'totalSlotCount'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #enumerating }
CoalObjectType >> allFieldsDo: aBlock [
	superType ifNotNil: [ superType allFieldsDo: aBlock ].
	super allFieldsDo: aBlock
]

{ #category : #accessing }
CoalObjectType >> superType [

	^ superType
]

{ #category : #accessing }
CoalObjectType >> superType: anObject [

	superType := anObject
]

{ #category : #accessing }
CoalObjectType >> totalSlotCount [
	^ totalSlotCount ifNil: [ totalSlotCount :=
			(superType
				ifNil: [ 0 ]
				ifNotNil: [ superType totalSlotCount ]) + fields size ]
]
