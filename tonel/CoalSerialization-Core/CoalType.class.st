"
I represent a specific coal type in a given serialization/materialization context.
"
Class {
	#name : #CoalType,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalType >> name [

	^ name
]

{ #category : #accessing }
CoalType >> name: anObject [

	name := anObject
]
