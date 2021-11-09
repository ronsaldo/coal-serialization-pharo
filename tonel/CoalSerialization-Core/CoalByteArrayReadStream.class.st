"
I am a coal read stream that is optimized for reading in-memory data which is present in a byte array.
"
Class {
	#name : #CoalByteArrayReadStream,
	#superclass : #CoalReadStream,
	#instVars : [
		'data',
		'position'
	],
	#category : #'CoalSerialization-Core-Stream'
}

{ #category : #accessing }
CoalByteArrayReadStream >> data [

	^ data
]

{ #category : #accessing }
CoalByteArrayReadStream >> data: anObject [

	data := anObject
]

{ #category : #initialization }
CoalByteArrayReadStream >> initialize [
	super initialize.
	position := 1.
]

{ #category : #accessing }
CoalByteArrayReadStream >> next: count [
	| result |
	result := data copyFrom: position to: position + count - 1.
	position := position + count.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextInt16 [
	| result |
	result := data signedShortAt: position.
	position := position + 2.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextInt32 [
	| result |
	result := data signedLongAt: position.
	position := position + 4.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextInt64 [
	| result |
	result := data signedLongLongAt: position.
	position := position + 8.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextInt8 [
	| result |
	result := data signedByteAt: position.
	position := position + 1.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextUInt16 [
	| result |
	result := data unsignedShortAt: position.
	position := position + 2.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextUInt32 [
	| result |
	result := data unsignedLongAt: position.
	position := position + 4.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextUInt64 [
	| result |
	result := data unsignedLongLongAt: position.
	position := position + 8.
	^ result
]

{ #category : #'accessing - bytes' }
CoalByteArrayReadStream >> nextUInt8 [
	| result |
	result := data unsignedByteAt: position.
	position := position + 1.
	^ result
]

{ #category : #accessing }
CoalByteArrayReadStream >> position [

	^ position
]

{ #category : #accessing }
CoalByteArrayReadStream >> position: anObject [

	position := anObject
]
