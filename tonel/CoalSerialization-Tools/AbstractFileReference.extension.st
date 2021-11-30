Extension { #name : #AbstractFileReference }

{ #category : #'*CoalSerialization-Tools' }
AbstractFileReference >> inspectionCoal [
	<inspectorPresentationOrder: 0 title: 'Coal Object Tree'>
	^ (CoalMaterializer parseGenericData: (self binaryReadStreamDo: [:in | in contents] ))
		inspectionTree
]

{ #category : #'*CoalSerialization-Tools' }
AbstractFileReference >> inspectionCoalContext: aContext [
	aContext active: self isCoal
]

{ #category : #'*CoalSerialization-Tools' }
AbstractFileReference >> isCoal [
	self isFile ifFalse: [ ^ false ].
	^ (self binaryReadStreamDo: [:in | in next: 4]) = 'COAL' asByteArray
]
