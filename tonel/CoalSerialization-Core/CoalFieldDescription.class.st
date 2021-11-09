Class {
	#name : #CoalFieldDescription,
	#superclass : #Object,
	#instVars : [
		'name',
		'encoding'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #accessing }
CoalFieldDescription >> encoding [

	^ encoding
]

{ #category : #accessing }
CoalFieldDescription >> encoding: anObject [

	encoding := anObject
]

{ #category : #accessing }
CoalFieldDescription >> name [

	^ name
]

{ #category : #accessing }
CoalFieldDescription >> name: anObject [

	name := anObject
]
