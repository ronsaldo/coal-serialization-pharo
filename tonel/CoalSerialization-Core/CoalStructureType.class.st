"
I represent an inline passed by value aggregate structure.
"
Class {
	#name : #CoalStructureType,
	#superclass : #CoalAggregateType,
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #'reading-writing' }
CoalStructureType >> readAsFieldWith: readStream [
	| slots |
	self flags: 'TODO: Support resolving into different types.'.
	slots := Array new: fields size.
	fields doWithIndex: [ :field :index |
		slots at: index put: (field encoding readFieldWith: readStream)
	].

	^ CoalGenericAggregate new
		type: self;
		slots: slots;
		yourself
]
