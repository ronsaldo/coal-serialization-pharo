"
I am a type solver that is used for inspecting arbitrary coal serialized data.
"
Class {
	#name : #CoalGenericObjectMaterializationTypeSolver,
	#superclass : #CoalMaterializationTypeSolver,
	#category : #'CoalSerialization-Core-Materialization'
}

{ #category : #'instance creation' }
CoalGenericObjectMaterializationTypeSolver >> newInstanceForCluster: clusterType [
	^ CoalGenericObject new
		type: clusterType;
		slots: (Array new: clusterType totalSlotCount);
		yourself
]
