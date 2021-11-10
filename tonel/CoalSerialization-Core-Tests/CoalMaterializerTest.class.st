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
CoalMaterializerTest >> testSampleNestedStructure [
	| parsedData innerStruct |
	parsedData := (CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 98 0 0 0 2 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 83 116 114 117 99 116 117 114 101 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 83 97 109 112 108 101 78 101 115 116 101 100 83 116 114 117 99 116 117 114 101 105 110 110 101 114 83 116 114 117 99 116 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 15 0 3 0 15 0 0 0 12 0 1 27 0 0 0 12 0 12 39 0 0 0 10 0 16 49 0 0 0 21 0 2 0 70 0 0 0 11 0 128 0 0 0 0 27 0 0 0 12 0 12 81 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 93 0 0 0 5 0 128 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0]) value.
	innerStruct := parsedData at: #innerStruct.
	self assert: (parsedData at: #integerField) equals: 0.
	self assert: (innerStruct at: #booleanField) equals: false.
	self assert: (innerStruct at: #integerField) equals: 0.
	self assert: (innerStruct at: #floatField) equals: 0.0.
	
	parsedData := (CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 98 0 0 0 2 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 83 116 114 117 99 116 117 114 101 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 83 97 109 112 108 101 78 101 115 116 101 100 83 116 114 117 99 116 117 114 101 105 110 110 101 114 83 116 114 117 99 116 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 15 0 3 0 15 0 0 0 12 0 1 27 0 0 0 12 0 12 39 0 0 0 10 0 16 49 0 0 0 21 0 2 0 70 0 0 0 11 0 128 0 0 0 0 27 0 0 0 12 0 12 81 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 93 0 0 0 5 0 128 1 0 0 0 1 214 255 255 255 0 0 42 66 13 0 0 0 1 0 0 0]) value.
	innerStruct := parsedData at: #innerStruct.
	self assert: (parsedData at: #integerField) equals: 13.
	self assert: (innerStruct at: #booleanField) equals: true.
	self assert: (innerStruct at: #integerField) equals: -42.
	self assert: (innerStruct at: #floatField) equals: 42.5.0.
]

{ #category : #tests }
CoalMaterializerTest >> testSampleStructure [
	| parsedData |
	parsedData := (CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 66 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 83 116 114 117 99 116 117 114 101 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 15 0 3 0 15 0 0 0 12 0 1 27 0 0 0 12 0 12 39 0 0 0 10 0 16 49 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 61 0 0 0 5 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0]) value.
	self assert: (parsedData at: #booleanField) equals: false.
	self assert: (parsedData at: #integerField) equals: 0.
	self assert: (parsedData at: #floatField) equals: 0.0.
	
	parsedData := (CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 66 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 83 116 114 117 99 116 117 114 101 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 0 0 0 0 15 0 3 0 15 0 0 0 12 0 1 27 0 0 0 12 0 12 39 0 0 0 10 0 16 49 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 61 0 0 0 5 0 128 0 0 0 0 1 214 255 255 255 0 0 42 66 1 0 0 0]) value.
	self assert: (parsedData at: #booleanField) equals: true.
	self assert: (parsedData at: #integerField) equals: -42.
	self assert: (parsedData at: #floatField) equals: 42.5.0.
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
