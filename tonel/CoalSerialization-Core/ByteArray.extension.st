Extension { #name : #ByteArray }

{ #category : #'*CoalSerialization-Core' }
ByteArray >> coalReadStream [
	^ CoalByteArrayReadStream new data: self
]

{ #category : #'*CoalSerialization-Core' }
ByteArray >> coalReadStreamDo: aBlock [
	^ aBlock value: self coalReadStream
]
