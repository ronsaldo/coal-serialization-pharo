"
I am a generic coal aggregate object. I am used for parsing coal that does not have a correspondance with in system classes.
"
Class {
	#name : #CoalGenericAggregate,
	#superclass : #Object,
	#instVars : [
		'type',
		'slots'
	],
	#category : #'CoalSerialization-Core-Materialization'
}

{ #category : #accessing }
CoalGenericAggregate >> at: fieldName [
	^ slots at: (type slotOfFieldNamed: fieldName)
]

{ #category : #accessing }
CoalGenericAggregate >> slots [

	^ slots
]

{ #category : #accessing }
CoalGenericAggregate >> slots: anObject [

	slots := anObject
]

{ #category : #accessing }
CoalGenericAggregate >> type [

	^ type
]

{ #category : #accessing }
CoalGenericAggregate >> type: anObject [

	type := anObject
]

{ #category : #accessing }
CoalGenericAggregate >> value [
	^ self at: #value
]
