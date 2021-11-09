Class {
	#name : #CoalPrimitiveTypeDescriptor,
	#superclass : #CoalTypeDescriptor,
	#classVars : [
		'FieldSizeTable',
		'ReadFieldBlockTable'
	],
	#category : #'CoalSerialization-Core-Metamodel'
}

{ #category : #initialization }
CoalPrimitiveTypeDescriptor class >> initialize [
	ReadFieldBlockTable := Array new: PrimitiveTypeDescriptorCount.
	FieldSizeTable := Array new: PrimitiveTypeDescriptorCount.
	
	{
		TypeDescriptorKind_Object . { [ :input | input nextInstanceReference ] . 4 } .
		TypeDescriptorKind_Boolean8 . { [ :input | input nextUInt8 ~= 0 ] . 1 } .
		TypeDescriptorKind_Boolean16 . { [ :input | input nextUInt16 ~= 0 ] . 2 } .
		TypeDescriptorKind_Boolean32 . { [ :input | input nextUInt32 ~= 0 ] . 4 } .
		TypeDescriptorKind_Boolean64 . { [ :input | input nextUInt64 ~= 0 ] . 8 } .

		TypeDescriptorKind_UInt8 . { [ :input | input nextUInt8 ] . 1 } .
		TypeDescriptorKind_UInt16 . { [ :input | input nextUInt16 ] . 2 } .
		TypeDescriptorKind_UInt32 . { [ :input | input nextUInt32 ] . 4 } .
		TypeDescriptorKind_UInt64 . { [ :input | input nextUInt64 ] . 8 } .
		TypeDescriptorKind_UInt128 . { [ :input | input nextUInt128 ] . 16 } .

		TypeDescriptorKind_Int8 . { [ :input | input nextInt8 ] . 1 } .
		TypeDescriptorKind_Int16 . { [ :input | input nextInt16 ] . 2 } .
		TypeDescriptorKind_Int32 . { [ :input | input nextInt32 ] . 4 } .
		TypeDescriptorKind_Int64 . { [ :input | input nextInt64 ] . 8 } .
		TypeDescriptorKind_Int128 . { [ :input | input nextInt128 ] . 16 } .

		TypeDescriptorKind_Float16 . { [ :input | input nextFloat16 ] . 2 } .
		TypeDescriptorKind_Float32 . { [ :input | input nextFloat32 ] . 4 } .
		TypeDescriptorKind_Float64 . { [ :input | input nextFloat64 ] . 8 } .
		TypeDescriptorKind_Float128 . { [ :input | input nextFloat128 ] . 16 } .
		TypeDescriptorKind_Float256 . { [ :input | input nextFloat256 ] . 32 } .

		TypeDescriptorKind_Decimal32 . { [ :input | input nextDecimal32 ] . 4 } .
		TypeDescriptorKind_Decimal64 . { [ :input | input nextDecimal64 ] . 8 } .
		TypeDescriptorKind_Decimal128 . { [ :input | input nextDecimal128 ] . 16 } .

		TypeDescriptorKind_Binary_32_8 . { [ :input | input nextBinary_32_8 ] . 5 } .
		TypeDescriptorKind_Binary_32_16 . { [ :input | input nextBinary_32_16 ] . 6 } .
		TypeDescriptorKind_Binary_32_32 . { [ :input | input nextBinary_32_32 ] . 8 } .
		TypeDescriptorKind_UTF8_32_8 . { [ :input | input nextUTF8_32_8 ] . 5 } .
		TypeDescriptorKind_UTF8_32_16 . { [ :input | input nextUTF8_32_16 ] . 6 } .
		TypeDescriptorKind_UTF8_32_32 . { [ :input | input nextUTF8_32_32 ] . 8 } .
		TypeDescriptorKind_UTF16_32_8 . { [ :input | input nextUTF16_32_8 ] . 5 } .
		TypeDescriptorKind_UTF16_32_16 . { [ :input | input nextUTF16_32_16 ] . 6 } .
		TypeDescriptorKind_UTF16_32_32 . { [ :input | input nextUTF16_32_32 ] . 8 } .
		TypeDescriptorKind_UTF32_32_8 . { [ :input | input nextUTF32_32_8 ] . 5 } .
		TypeDescriptorKind_UTF32_32_16 . { [ :input | input nextUTF32_32_16 ] . 6 } .
		TypeDescriptorKind_UTF32_32_32 . { [ :input | input nextUTF32_32_32 ] . 8 } .
		TypeDescriptorKind_BigInt_32_8 . { [ :input | input nextBigInt_32_8 ] . 5 } .
		TypeDescriptorKind_BigInt_32_16 . { [ :input | input nextBigInt_32_16 ] . 6 } .
		TypeDescriptorKind_BigInt_32_32 . { [ :input | input nextBigInt_32_32 ] . 8 } .

		TypeDescriptorKind_Char8 . { [ :input | input nextUInt8 asCharacter ] . 1 } .
		TypeDescriptorKind_Char16 . { [ :input | input nextUInt16 asCharacter ] . 2 } .
		TypeDescriptorKind_Char32 . { [ :input | input nextUInt32 asCharacter ] . 4 } .
		TypeDescriptorKind_Fixed16_16 . { [ :input | input nextFixed16_16 ] . 4 } .
		TypeDescriptorKind_Fixed16_16_Sat . { [ :input | input nextFixed16_16_Sat ] . 4 } .
	} pairsDo: [ :kind :actions |
		ReadFieldBlockTable at: kind + 1 put: actions first.
		FieldSizeTable at: kind + 1 put: actions second.
	]
]

{ #category : #'reading-writing' }
CoalPrimitiveTypeDescriptor >> readFieldWith: readStream [
	^ (ReadFieldBlockTable at: kind + 1) value: readStream
]

{ #category : #'reading-writing' }
CoalPrimitiveTypeDescriptor >> skipFieldWith: readStream [
	^ readStream skip: (FieldSizeTable at: kind + 1)
]
