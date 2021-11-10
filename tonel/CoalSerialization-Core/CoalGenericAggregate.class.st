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

{ #category : #converting }
CoalGenericAggregate >> asFieldNameValueAssociationList [
	| result slotIndex |
	result := Array new: slots size.
	slotIndex := 1.
	type allFieldsDo: [ :fieldDescription |
		result at: slotIndex put: (Association key: fieldDescription name value: (slots at: slotIndex)).
		slotIndex := slotIndex + 1
	].
	^ result
]

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
