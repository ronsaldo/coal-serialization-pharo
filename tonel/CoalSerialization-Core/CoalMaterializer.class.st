"
I am a parser for a file encoded using the coal serialization format.
"
Class {
	#name : #CoalMaterializer,
	#superclass : #Object,
	#instVars : [
		'readStream',
		'valueTypeCount',
		'clusterCount',
		'objectCount',
		'valueTypes',
		'typeDescriptorContext',
		'clusterTypes',
		'clusterInstanceCounts',
		'typeSolver',
		'instances'
	],
	#pools : [
		'CoalConstants'
	],
	#category : #'CoalSerialization-Core-Materialization'
}

{ #category : #parsing }
CoalMaterializer class >> parseGenericData: aByteArrayOrStream [
	^ self new parseGenericData: aByteArrayOrStream
]

{ #category : #parsing }
CoalMaterializer >> parse [
	^ self
		parseHeaderAndReadBlob;
		parseValueTypeDescriptors;
		parseClusterTypeDescriptors;
		validateAndResolveTypes;
		parseClusterInstances;
		parseTrailer
]

{ #category : #'private - parsing' }
CoalMaterializer >> parseClusterInstances [
	| destIndex |
	instances := Array new: objectCount.
	"Make the instances."
	destIndex := 1.
	clusterTypes doWithIndex: [ :clusterType :clusterIndex |
		| clusterInstanceCount |
		clusterInstanceCount := clusterInstanceCounts at: clusterIndex.
		1 to: clusterInstanceCount do: [ :i |
			instances at: destIndex put: (typeSolver newInstanceForCluster: clusterType).
			destIndex := destIndex + 1
		]
	].

	self assert: destIndex = (objectCount + 1).
	readStream instances: instances.
	
	"Read the instances contents"
	destIndex := 1.
	clusterTypes doWithIndex: [ :clusterType :clusterIndex |
		| clusterInstanceCount |
		clusterInstanceCount := clusterInstanceCounts at: clusterIndex.
		1 to: clusterInstanceCount do: [ :i |
			| instance |
			instance := instances at: destIndex.
			typeSolver readInstance: instance withType: clusterType stream: readStream.
			destIndex := destIndex + 1
		]
	].

]

{ #category : #'private - parsing' }
CoalMaterializer >> parseClusterTypeDescriptors [
	clusterTypes := OrderedCollection new.
	
	1 to: clusterCount do: [ :i |
		| clusterType |
		clusterType := CoalObjectType new.
		clusterTypes add: clusterType.
		typeDescriptorContext addClusterType: clusterType.
	].

	clusterInstanceCounts := OrderedCollection new.
	clusterTypes do: [ :clusterType |
		| superTypeIndex fieldCount instanceCount |
		clusterType name: readStream nextUTF8_32_16.
		superTypeIndex := readStream nextUInt32.
		fieldCount := readStream nextUInt16.	
		instanceCount := readStream nextUInt32.		
		clusterInstanceCounts add: instanceCount.
		
		superTypeIndex > 0 ifTrue: [
			clusterType superType: (clusterTypes at: superTypeIndex)
		].
	
		clusterType fields: ((1 to: fieldCount) collect: [ :each |
			self parseFieldDescription
		])
	].


]

{ #category : #'private - parsing' }
CoalMaterializer >> parseData: aByteArrayOrReadStream [
	^ aByteArrayOrReadStream coalReadStreamDo: [ :theReadStream |
		self readStream: theReadStream.
		self parse
	]
]

{ #category : #'private - parsing' }
CoalMaterializer >> parseFieldDescription [
	^ CoalFieldDescription new
		name: readStream nextUTF8_32_16;
		encoding: readStream nextTypeDescriptor;
		yourself
]

{ #category : #'private - parsing' }
CoalMaterializer >> parseGenericData: aByteArrayOrStream [
	^ self setupForGenericData;
		parseData: aByteArrayOrStream
]

{ #category : #'private - parsing' }
CoalMaterializer >> parseHeaderAndReadBlob [
	| blobSize magicNumber versionMajor versionMinor reserved |
	magicNumber := readStream nextUInt32.
	
	magicNumber = CoalMagicNumber ifFalse: [ 
		self error: 'Not a coal serialized object'.
	].

	versionMajor := readStream nextUInt8.
	versionMinor := readStream nextUInt8.
	reserved := readStream nextUInt16.
	
	(versionMajor = CoalVersionMajor
	and: [ versionMinor = CoalVersionMinor
	and: [ reserved = 0 ] ]) ifFalse: [
		self error: 'Unsupported version of coal serialization format.'
	].

	blobSize := readStream nextUInt32.
	valueTypeCount := readStream nextUInt32.
	clusterCount := readStream nextUInt32.
	objectCount := readStream nextUInt32.
	readStream binaryBlob: (readStream next: blobSize).
]

{ #category : #'private - parsing' }
CoalMaterializer >> parseTrailer [
	| rootObjectIndex |
	rootObjectIndex := readStream nextUInt32.
	rootObjectIndex = 0 ifTrue: [ ^ nil ].
	^ instances at: rootObjectIndex
]

{ #category : #'private - parsing' }
CoalMaterializer >> parseValueTypeDescriptors [
	typeDescriptorContext := CoalTypeDescriptorContext new.
	valueTypes := OrderedCollection new.
	readStream typeDescriptorContext: typeDescriptorContext.
	
	1 to: valueTypeCount do: [ :i |
		| valueType fieldCount |
		valueType := CoalStructureType new.
		valueType name: readStream nextUTF8_32_16.
		fieldCount := readStream nextUInt16.
		
		valueType fields: ((1 to: fieldCount) collect: [ :each |
			self parseFieldDescription
		]).

		typeDescriptorContext addValueType: valueType.
		valueTypes add: valueType.
	].

]

{ #category : #accessing }
CoalMaterializer >> readStream [

	^ readStream
]

{ #category : #accessing }
CoalMaterializer >> readStream: aStream [
	readStream := aStream asCoalReadStream
]

{ #category : #setup }
CoalMaterializer >> setupForGenericData [
	typeSolver := CoalGenericObjectMaterializationTypeSolver new.
]

{ #category : #'private - parsing' }
CoalMaterializer >> validateAndResolveTypes [
	valueTypes do: [ :each |
		typeSolver solveStructureType: each; solveTypeFields: each.
	].

	clusterTypes do: [ :each |
		typeSolver solveClusterType: each
	].
	clusterTypes do: [ :each |
		typeSolver solveTypeFields: each
	]
]
