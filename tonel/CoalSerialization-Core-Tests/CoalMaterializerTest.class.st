"
A CoalMaterializerTest is a test class for testing the behavior of CoalMaterializer
"
Class {
	#name : #CoalMaterializerTest,
	#superclass : #TestCase,
	#category : #'CoalSerialization-Core-Tests-Format'
}

{ #category : #tests }
CoalMaterializerTest >> testArray32 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 133 12 5 0 0 0 1 0 0 0 2 0 0 0 3 0 0 0 3 0 0 0 42 0 0 0 1 0 0 0].
	self assert: parsedData value equals: #(1 2 3 3 42).
	
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 29 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 72 101 108 108 111 87 111 114 108 100 13 10 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 133 28 3 0 0 0 17 0 0 0 5 0 0 0 22 0 0 0 5 0 0 0 27 0 0 0 2 0 0 0 1 0 0 0].
	self assert: parsedData value equals: { 'Hello' . 'World' . String crlf } 
]

{ #category : #tests }
CoalMaterializerTest >> testBoolean8 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 1 0 1 0 0 0].
	self assert: parsedData value equals: false.
	
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 1 1 1 0 0 0].
	self assert: parsedData value equals: true.
]

{ #category : #tests }
CoalMaterializerTest >> testFloat32 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 16 0 0 42 66 1 0 0 0].
	self assert: parsedData value equals: 42.5
]

{ #category : #tests }
CoalMaterializerTest >> testFloat64 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 17 0 0 0 0 0 64 69 64 1 0 0 0].
	self assert: parsedData value equals: 42.5
]

{ #category : #tests }
CoalMaterializerTest >> testInt16 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 11 214 255 1 0 0 0].
	self assert: parsedData value equals: -42
]

{ #category : #tests }
CoalMaterializerTest >> testInt32 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 12 214 255 255 255 1 0 0 0].
	self assert: parsedData value equals: -42
]

{ #category : #tests }
CoalMaterializerTest >> testInt64 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 13 214 255 255 255 255 255 255 255 1 0 0 0].
	self assert: parsedData value equals: -42
]

{ #category : #tests }
CoalMaterializerTest >> testInt8 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 10 214 1 0 0 0].
	self assert: parsedData value equals: -42
]

{ #category : #tests }
CoalMaterializerTest >> testMap32 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 33 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 70 105 114 115 116 83 101 99 111 110 100 84 104 105 114 100 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 139 28 12 3 0 0 0 17 0 0 0 5 0 0 0 1 0 0 0 22 0 0 0 6 0 0 0 2 0 0 0 28 0 0 0 5 0 0 0 3 0 0 0 1 0 0 0].
	self assert: parsedData value equals: (Dictionary newFromPairs: #(
		'First' 1
		'Second' 2
		'Third' 3
	))
]

{ #category : #tests }
CoalMaterializerTest >> testSet32 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 136 12 4 0 0 0 3 0 0 0 42 0 0 0 2 0 0 0 1 0 0 0 1 0 0 0].
	self assert: parsedData value equals: #(1 2 3 42) asSet.
	
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 29 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 13 10 87 111 114 108 100 72 101 108 108 111 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 136 28 3 0 0 0 17 0 0 0 2 0 0 0 19 0 0 0 5 0 0 0 24 0 0 0 5 0 0 0 1 0 0 0].
	self assert: parsedData value equals: { 'Hello' . 'World' . String crlf } asSet
]

{ #category : #tests }
CoalMaterializerTest >> testUInt16 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 6 42 0 1 0 0 0].
	self assert: parsedData value equals: 42
]

{ #category : #tests }
CoalMaterializerTest >> testUInt32 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 7 42 0 0 0 1 0 0 0].
	self assert: parsedData value equals: 42
]

{ #category : #tests }
CoalMaterializerTest >> testUInt64 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 8 42 0 0 0 0 0 0 0 1 0 0 0].
	self assert: parsedData value equals: 42
]

{ #category : #tests }
CoalMaterializerTest >> testUInt8 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 17 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 5 42 1 0 0 0].
	self assert: parsedData value equals: 42
]

{ #category : #tests }
CoalMaterializerTest >> testUTF8_32_32 [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 30 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 72 101 108 108 111 32 87 111 114 108 100 13 10 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 28 17 0 0 0 13 0 0 0 1 0 0 0].
	self assert: parsedData value equals: 'Hello World' , String crlf
]
