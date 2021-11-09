"
I am a solver of types that stablishes a correspondance between serialized data, and in-image objects.
"
Class {
	#name : #CoalMaterializationTypeSolver,
	#superclass : #Object,
	#category : #'CoalSerialization-Core-Materialization'
}

{ #category : #'instance creation' }
CoalMaterializationTypeSolver >> newInstanceForCluster: clusterType [
	self subclassResponsibility
]

{ #category : #'reading-writing' }
CoalMaterializationTypeSolver >> readInstance: instance withType: clusterType stream: readStream [
	| slots destIndex|
	slots := instance slots.
	destIndex := 1.
	clusterType allFieldsDo:  [ :field |
		slots at: destIndex put: (field encoding readFieldWith: readStream).
		destIndex := destIndex + 1
	].
]

{ #category : #'type resolution' }
CoalMaterializationTypeSolver >> solveClusterType: aStructureType [
]

{ #category : #'type resolution' }
CoalMaterializationTypeSolver >> solveStructureType: aStructureType [
]

{ #category : #'type resolution' }
CoalMaterializationTypeSolver >> solveTypeFields: aStructureType [
]
