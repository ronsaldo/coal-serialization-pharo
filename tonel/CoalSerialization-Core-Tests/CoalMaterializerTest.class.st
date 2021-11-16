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
	self assert: parsedData value equals: #(1 2 3 3 42) asOrderedCollection.
	
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 29 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 72 101 108 108 111 87 111 114 108 100 13 10 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 133 28 3 0 0 0 17 0 0 0 5 0 0 0 22 0 0 0 5 0 0 0 27 0 0 0 2 0 0 0 1 0 0 0].
	self assert: parsedData value equals: { 'Hello' . 'World' . String crlf } asOrderedCollection
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
CoalMaterializerTest >> testSampleCyclicObject [
	| first second |
	first := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 71 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 67 121 99 108 105 99 79 98 106 101 99 116 112 111 116 101 110 116 105 97 108 108 121 67 121 99 108 105 99 82 101 102 101 114 101 110 99 101 112 111 116 101 110 116 105 97 108 108 121 67 121 99 108 105 99 82 101 102 101 114 101 110 99 101 50 0 0 0 0 18 0 0 0 0 0 2 0 1 0 0 0 18 0 0 0 26 0 129 0 0 0 0 44 0 0 0 27 0 129 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0].
	self assert: (first at: #potentiallyCyclicReference) equals: nil.
	self assert: (first at: #potentiallyCyclicReference2) equals: nil.
	
	first := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 71 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 67 121 99 108 105 99 79 98 106 101 99 116 112 111 116 101 110 116 105 97 108 108 121 67 121 99 108 105 99 82 101 102 101 114 101 110 99 101 112 111 116 101 110 116 105 97 108 108 121 67 121 99 108 105 99 82 101 102 101 114 101 110 99 101 50 0 0 0 0 18 0 0 0 0 0 2 0 1 0 0 0 18 0 0 0 26 0 129 0 0 0 0 44 0 0 0 27 0 129 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0].
	self assert: (first at: #potentiallyCyclicReference) equals: first.
	self assert: (first at: #potentiallyCyclicReference2) equals: nil.
	
	first := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 71 0 0 0 0 0 0 0 1 0 0 0 2 0 0 0 83 97 109 112 108 101 67 121 99 108 105 99 79 98 106 101 99 116 112 111 116 101 110 116 105 97 108 108 121 67 121 99 108 105 99 82 101 102 101 114 101 110 99 101 112 111 116 101 110 116 105 97 108 108 121 67 121 99 108 105 99 82 101 102 101 114 101 110 99 101 50 0 0 0 0 18 0 0 0 0 0 2 0 2 0 0 0 18 0 0 0 26 0 129 0 0 0 0 44 0 0 0 27 0 129 0 0 0 0 2 0 0 0 0 0 0 0 1 0 0 0 2 0 0 0 1 0 0 0].
	second := first at: #potentiallyCyclicReference.
	
	self assert: (second at: #potentiallyCyclicReference) equals: first.
	self assert: (second at: #potentiallyCyclicReference2) equals: second.
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
CoalMaterializerTest >> testSampleObject [
	| parsedData |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 46 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 79 98 106 101 99 116 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 0 0 0 0 12 0 0 0 0 0 3 0 1 0 0 0 12 0 0 0 12 0 1 24 0 0 0 12 0 12 36 0 0 0 10 0 16 0 0 0 0 0 0 0 0 0 1 0 0 0].
	self assert: (parsedData at: #booleanField) equals: false.
	self assert: (parsedData at: #integerField) equals: 0.
	self assert: (parsedData at: #floatField) equals: 0.0.
	
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 46 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 83 97 109 112 108 101 79 98 106 101 99 116 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 0 0 0 0 12 0 0 0 0 0 3 0 1 0 0 0 12 0 0 0 12 0 1 24 0 0 0 12 0 12 36 0 0 0 10 0 16 1 214 255 255 255 0 0 42 66 1 0 0 0].
	self assert: (parsedData at: #booleanField) equals: true.
	self assert: (parsedData at: #integerField) equals: -42.
	self assert: (parsedData at: #floatField) equals: 42.5.0.
]

{ #category : #tests }
CoalMaterializerTest >> testSampleObjectWithCollections [
	| root list set map first second third |
	root := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 82 0 0 0 0 0 0 0 2 0 0 0 1 0 0 0 83 97 109 112 108 101 79 98 106 101 99 116 87 105 116 104 67 111 108 108 101 99 116 105 111 110 108 105 115 116 115 101 116 109 97 112 83 97 109 112 108 101 79 98 106 101 99 116 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 0 0 0 0 26 0 0 0 0 0 3 0 1 0 0 0 26 0 0 0 4 0 133 129 1 0 0 0 30 0 0 0 3 0 136 129 1 0 0 0 33 0 0 0 3 0 139 28 129 1 0 0 0 36 0 0 0 12 0 0 0 0 0 3 0 0 0 0 0 48 0 0 0 12 0 1 60 0 0 0 12 0 12 72 0 0 0 10 0 16 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0].
	
	list := root at: #list.
	self assert: (list isKindOf: OrderedCollection).
	self assert: list isEmpty.

	set := root at: #set.
	self assert: (set isKindOf: Set).
	self assert: set isEmpty.

	map := root at: #map.
	self assert: (map isKindOf: Dictionary).
	self assert: map isEmpty.

	root := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 98 0 0 0 0 0 0 0 2 0 0 0 4 0 0 0 83 97 109 112 108 101 79 98 106 101 99 116 87 105 116 104 67 111 108 108 101 99 116 105 111 110 108 105 115 116 115 101 116 109 97 112 84 104 105 114 100 83 101 99 111 110 100 70 105 114 115 116 83 97 109 112 108 101 79 98 106 101 99 116 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 0 0 0 0 26 0 0 0 0 0 3 0 1 0 0 0 26 0 0 0 4 0 133 129 1 0 0 0 30 0 0 0 3 0 136 129 1 0 0 0 33 0 0 0 3 0 139 28 129 1 0 0 0 52 0 0 0 12 0 0 0 0 0 3 0 3 0 0 0 64 0 0 0 12 0 1 76 0 0 0 12 0 12 88 0 0 0 10 0 16 4 0 0 0 4 0 0 0 3 0 0 0 3 0 0 0 2 0 0 0 3 0 0 0 2 0 0 0 3 0 0 0 4 0 0 0 3 0 0 0 36 0 0 0 5 0 0 0 2 0 0 0 41 0 0 0 6 0 0 0 3 0 0 0 47 0 0 0 5 0 0 0 4 0 0 0 0 3 0 0 0 0 0 64 64 0 2 0 0 0 0 0 0 64 0 1 0 0 0 0 0 128 63 1 0 0 0].
	
	list := root at: #list.
	self assert: (list isKindOf: OrderedCollection).
	self assert: list size equals: 4.
	
	first := list first.
	self assert: (first at: #integerField) equals: 1.
	self assert: (first at: #floatField) equals: 1.0.

	second := list second.
	self assert: (second at: #integerField) equals: 2.
	self assert: (second at: #floatField) equals: 2.0.

	self assert: list third equals: second.

	third := list fourth.
	self assert: (third at: #integerField) equals: 3.
	self assert: (third at: #floatField) equals: 3.0.
	
	set := root at: #set.
	self assert: (set isKindOf: Set).
	self assert: set size equals: 3.
	self assert: (set includes: first).
	self assert: (set includes: second).
	self assert: (set includes: third).

	map := root at: #map.
	self assert: (map isKindOf: Dictionary).
	self assert: map size equals: 3.
	self assert: (map at: #First) equals: first.
	self assert: (map at: #Second) equals: second.
	self assert: (map at: #Third) equals: third.
]

{ #category : #tests }
CoalMaterializerTest >> testSampleOuterObject [
	| parsedData innerObject |
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 74 0 0 0 0 0 0 0 2 0 0 0 1 0 0 0 83 97 109 112 108 101 79 98 106 101 99 116 79 117 116 101 114 105 110 110 101 114 79 98 106 101 99 116 83 97 109 112 108 101 79 98 106 101 99 116 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 0 0 0 0 17 0 0 0 0 0 1 0 1 0 0 0 17 0 0 0 11 0 129 1 0 0 0 28 0 0 0 12 0 0 0 0 0 3 0 0 0 0 0 40 0 0 0 12 0 1 52 0 0 0 12 0 12 64 0 0 0 10 0 16 0 0 0 0 1 0 0 0].
	self assert: (parsedData at: #innerObject) equals: nil.
	
	parsedData := CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 74 0 0 0 0 0 0 0 2 0 0 0 2 0 0 0 83 97 109 112 108 101 79 98 106 101 99 116 79 117 116 101 114 105 110 110 101 114 79 98 106 101 99 116 83 97 109 112 108 101 79 98 106 101 99 116 98 111 111 108 101 97 110 70 105 101 108 100 105 110 116 101 103 101 114 70 105 101 108 100 102 108 111 97 116 70 105 101 108 100 0 0 0 0 17 0 0 0 0 0 1 0 1 0 0 0 17 0 0 0 11 0 129 1 0 0 0 28 0 0 0 12 0 0 0 0 0 3 0 1 0 0 0 40 0 0 0 12 0 1 52 0 0 0 12 0 12 64 0 0 0 10 0 16 2 0 0 0 1 214 255 255 255 0 0 42 66 1 0 0 0].
	innerObject := parsedData at: #innerObject.
	self assert: (innerObject at: #booleanField) equals: true.
	self assert: (innerObject at: #integerField) equals: -42.
	self assert: (innerObject at: #floatField) equals: 42.5.0.
]

{ #category : #tests }
CoalMaterializerTest >> testSampleShapeList [
	| list box circle |
	list := (CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 36 0 0 0 0 0 0 0 2 0 0 0 1 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 83 104 97 112 101 99 101 110 116 101 114 88 99 101 110 116 101 114 89 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 133 129 1 0 0 0 17 0 0 0 5 0 0 0 0 0 2 0 0 0 0 0 22 0 0 0 7 0 16 29 0 0 0 7 0 16 0 0 0 0 1 0 0 0]) value.
	self assert: list isEmpty.
	
	list := (CoalMaterializer parseGenericData: #[67 79 65 76 1 0 0 0 62 0 0 0 0 0 0 0 4 0 0 0 3 0 0 0 82 111 111 116 86 97 108 117 101 66 111 120 118 97 108 117 101 83 104 97 112 101 99 101 110 116 101 114 88 99 101 110 116 101 114 89 67 105 114 99 108 101 114 97 100 105 117 115 66 111 120 119 105 100 116 104 104 101 105 103 104 116 0 0 0 0 12 0 0 0 0 0 1 0 1 0 0 0 12 0 0 0 5 0 133 129 1 0 0 0 17 0 0 0 5 0 0 0 0 0 2 0 0 0 0 0 22 0 0 0 7 0 16 29 0 0 0 7 0 16 36 0 0 0 6 0 2 0 0 0 1 0 1 0 0 0 42 0 0 0 6 0 16 48 0 0 0 3 0 2 0 0 0 2 0 1 0 0 0 51 0 0 0 5 0 16 56 0 0 0 6 0 16 2 0 0 0 3 0 0 0 2 0 0 0 0 0 160 192 0 0 192 192 0 0 64 64 0 0 0 192 0 0 64 192 0 0 128 63 0 0 0 64 1 0 0 0]) value.
	self assert: list size equals: 2.
	
	box := list first.
	self assert: (box at: #centerX) equals: -2.
	self assert: (box at: #centerY) equals: -3.
	self assert: (box at: #width) equals: 1.
	self assert: (box at: #height) equals: 2.

	circle := list second.
	self assert: (circle at: #centerX) equals: -5.
	self assert: (circle at: #centerY) equals: -6.
	self assert: (circle at: #radius) equals: 3.
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
