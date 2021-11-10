"
I am an utility that is used to facilitate the reading of coal streams.
"
Class {
	#name : #CoalReadStream,
	#superclass : #Object,
	#instVars : [
		'binaryBlob',
		'typeDescriptorContext',
		'instances'
	],
	#category : #'CoalSerialization-Core-Stream'
}

{ #category : #converting }
CoalReadStream >> asCoalReadStream [
	^ self
]

{ #category : #accessing }
CoalReadStream >> binaryBlob [

	^ binaryBlob
]

{ #category : #accessing }
CoalReadStream >> binaryBlob: anObject [

	binaryBlob := anObject
]

{ #category : #accessing }
CoalReadStream >> instances [

	^ instances
]

{ #category : #accessing }
CoalReadStream >> instances: anObject [

	instances := anObject
]

{ #category : #accessing }
CoalReadStream >> next: count [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextBigInt_32_16 [
	| offset sizeAndSign |
	offset := self nextUInt32.
	sizeAndSign := self nextInt16.
	^ self readBigIntegerAt: offset sizeAndSize: sizeAndSign
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextBigInt_32_32 [
	| offset sizeAndSign |
	offset := self nextUInt32.
	sizeAndSign := self nextInt32.
	^ self readBigIntegerAt: offset sizeAndSize: sizeAndSign
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextBigInt_32_8 [
	| offset sizeAndSign |
	offset := self nextUInt32.
	sizeAndSign := self nextInt8.
	^ self readBigIntegerAt: offset sizeAndSize: sizeAndSign
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextBinary_32_16 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt16.
	^ self readBinaryBlobAt: offset size: size
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextBinary_32_32 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt32.
	^ self readBinaryBlobAt: offset size: size
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextBinary_32_8 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt8.
	^ self readBinaryBlobAt: offset size: size
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextFixed16_16 [
	^ self nextInt32 / 65536
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextFixed16_16_Sat [
	| value |
	value := self nextInt32.
	value = 16r7FFFFFFF ifTrue: [ ^ Float infinity ].
	value = -16r80000000 ifTrue: [ ^ Float negativeInfinity ].
	^ value / 65536
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextFloat32 [
	^ Float fromIEEE32Bit: self nextUInt32
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextFloat64 [
	^ Float fromIEEE64Bit: self nextUInt64
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextInstanceReference [
	| instanceIndex |
	instanceIndex := self nextUInt32.
	instanceIndex = 0 ifTrue: [ ^ nil ].
	^ instances at: instanceIndex
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextInt128 [
	^ (self nextInt64 << 64) | self nextUInt64
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextInt16 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextInt32 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextInt64 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextInt8 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextTypeDescriptor [
	^ typeDescriptorContext readNextTypeDescriptorWith: self
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUInt128 [
	^ (self nextUInt64 << 64) | self nextUInt64
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUInt16 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUInt32 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUInt64 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUInt8 [
	self subclassResponsibility
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF16_32_16 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt16.
	^ (self readBinaryBlobAt: offset size: size) decodeWith: ZnUTF16Encoder new beLittleEndian
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF16_32_32 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt32.
	^ (self readBinaryBlobAt: offset size: size) decodeWith: ZnUTF16Encoder new beLittleEndian
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF16_32_8 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt8.
	^ (self readBinaryBlobAt: offset size: size) decodeWith: ZnUTF16Encoder new beLittleEndian
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF32_32_16 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt16.
	^ (self readBinaryBlobAt: offset size: size) decodeWith: ZnUTF32Encoder new beLittleEndian
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF32_32_32 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt32.
	^ (self readBinaryBlobAt: offset size: size) decodeWith: ZnUTF32Encoder new beLittleEndian
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF32_32_8 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt8.
	^ (self readBinaryBlobAt: offset size: size) decodeWith: ZnUTF32Encoder new beLittleEndian
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF8_32_16 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt16.
	^ (self readBinaryBlobAt: offset size: size) utf8Decoded
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF8_32_32 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt32.
	^ (self readBinaryBlobAt: offset size: size) utf8Decoded
]

{ #category : #'accessing - bytes' }
CoalReadStream >> nextUTF8_32_8 [
	| offset size |
	offset := self nextUInt32.
	size := self nextUInt8.
	^ (self readBinaryBlobAt: offset size: size) utf8Decoded
]

{ #category : #'accessing - bytes' }
CoalReadStream >> readBigIntegerAt: offset sizeAndSize: sizeAndSign [
	| data bigInteger |
	data := self readBinaryBlobAt: offset size: sizeAndSign abs.
	bigInteger := (sizeAndSign < 0
		ifTrue: [ LargeNegativeInteger ]
		ifFalse: [ LargePositiveInteger ]) adoptInstance: data.
	^ bigInteger normalize
]

{ #category : #'accessing - bytes' }
CoalReadStream >> readBinaryBlobAt: offset size: size [
	^ binaryBlob copyFrom: offset + 1 to: offset + size
]

{ #category : #accessing }
CoalReadStream >> typeDescriptorContext [

	^ typeDescriptorContext
]

{ #category : #accessing }
CoalReadStream >> typeDescriptorContext: anObject [

	typeDescriptorContext := anObject
]
