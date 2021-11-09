Class {
	#name : #CoalGenericObject,
	#superclass : #Object,
	#instVars : [
		'type',
		'slots'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalGenericObject >> slots [

	^ slots
]

{ #category : #accessing }
CoalGenericObject >> slots: anObject [

	slots := anObject
]

{ #category : #accessing }
CoalGenericObject >> type [

	^ type
]

{ #category : #accessing }
CoalGenericObject >> type: anObject [

	type := anObject
]
