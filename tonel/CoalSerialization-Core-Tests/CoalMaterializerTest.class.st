"
A CoalMaterializerTest is a test class for testing the behavior of CoalMaterializer
"
Class {
	#name : #CoalMaterializerTest,
	#superclass : #TestCase,
	#category : #'CoalSerialization-Core-Tests-Format'
}

{ #category : #tests }
CoalMaterializerTest >> testUInt8 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 5 42 1 0 0 0].
	self assert: parsedData value equals: 42
]
