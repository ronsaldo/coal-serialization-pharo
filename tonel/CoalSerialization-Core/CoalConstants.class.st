"
I hold common constants in the coal serialization format.
"
Class {
	#name : #CoalConstants,
	#superclass : #SharedPool,
	#classVars : [
		'CoalMagicNumber',
		'CoalVersionMajor',
		'CoalVersionMinor',
		'PrimitiveTypeDescriptorCount',
		'TypeDescriptorKind_Array16',
		'TypeDescriptorKind_Array32',
		'TypeDescriptorKind_Array8',
		'TypeDescriptorKind_BigInt_32_16',
		'TypeDescriptorKind_BigInt_32_32',
		'TypeDescriptorKind_BigInt_32_8',
		'TypeDescriptorKind_Binary_32_16',
		'TypeDescriptorKind_Binary_32_32',
		'TypeDescriptorKind_Binary_32_8',
		'TypeDescriptorKind_Boolean16',
		'TypeDescriptorKind_Boolean32',
		'TypeDescriptorKind_Boolean64',
		'TypeDescriptorKind_Boolean8',
		'TypeDescriptorKind_Char16',
		'TypeDescriptorKind_Char32',
		'TypeDescriptorKind_Char8',
		'TypeDescriptorKind_Decimal128',
		'TypeDescriptorKind_Decimal32',
		'TypeDescriptorKind_Decimal64',
		'TypeDescriptorKind_Fixed16_16',
		'TypeDescriptorKind_Fixed16_16_Sat',
		'TypeDescriptorKind_FixedArray',
		'TypeDescriptorKind_Float128',
		'TypeDescriptorKind_Float16',
		'TypeDescriptorKind_Float256',
		'TypeDescriptorKind_Float32',
		'TypeDescriptorKind_Float64',
		'TypeDescriptorKind_Int128',
		'TypeDescriptorKind_Int16',
		'TypeDescriptorKind_Int32',
		'TypeDescriptorKind_Int64',
		'TypeDescriptorKind_Int8',
		'TypeDescriptorKind_Map16',
		'TypeDescriptorKind_Map32',
		'TypeDescriptorKind_Map8',
		'TypeDescriptorKind_Object',
		'TypeDescriptorKind_Set16',
		'TypeDescriptorKind_Set32',
		'TypeDescriptorKind_Set8',
		'TypeDescriptorKind_Struct',
		'TypeDescriptorKind_TypedObject',
		'TypeDescriptorKind_UInt128',
		'TypeDescriptorKind_UInt16',
		'TypeDescriptorKind_UInt32',
		'TypeDescriptorKind_UInt64',
		'TypeDescriptorKind_UInt8',
		'TypeDescriptorKind_UTF16_32_16',
		'TypeDescriptorKind_UTF16_32_32',
		'TypeDescriptorKind_UTF16_32_8',
		'TypeDescriptorKind_UTF32_32_16',
		'TypeDescriptorKind_UTF32_32_32',
		'TypeDescriptorKind_UTF32_32_8',
		'TypeDescriptorKind_UTF8_32_16',
		'TypeDescriptorKind_UTF8_32_32',
		'TypeDescriptorKind_UTF8_32_8'
	],
	#category : #'CoalSerialization-Core-Format'
}

{ #category : #initialization }
CoalConstants class >> initialize [
	CoalMagicNumber := 16r4C414F43.
	CoalVersionMajor := 1.
	CoalVersionMinor := 0.

	PrimitiveTypeDescriptorCount := 16r2B.
	
	#(
		Object 16r00
		Boolean8 16r01
		Boolean16 16r02
		Boolean32 16r03
		Boolean64 16r04
		UInt8 16r05
		UInt16 16r06
		UInt32 16r07
		UInt64 16r08
		UInt128 16r09
		Int8 16r0A
		Int16 16r0B
		Int32 16r0C
		Int64 16r0D
		Int128 16r0E
		Float16 16r0F
		Float32 16r10
		Float64 16r11
		Float128 16r12
		Float256 16r13
		Decimal32 16r14
		Decimal64 16r15
		Decimal128 16r16
		Binary_32_8 16r17
		Binary_32_16 16r18
		Binary_32_32 16r19
		UTF8_32_8 16r1A
		UTF8_32_16 16r1B
		UTF8_32_32 16r1C
		UTF16_32_8 16r1D
		UTF16_32_16 16r1E
		UTF16_32_32 16r1F
		UTF32_32_8 16r20
		UTF32_32_16 16r21
		UTF32_32_32 16r22
		BigInt_32_8 16r23
		BigInt_32_16 16r24
		BigInt_32_32 16r25
		Char8 16r26
		Char16 16r27
		Char32 16r28
		Fixed16_16 16r29
		Fixed16_16_Sat 16r2A

		Struct 16r80
		TypedObject 16r81
		FixedArray 16r82
		Array8 16r83
		Array16 16r84
		Array32 16r85
		Set8 16r86
		Set16 16r87
		Set32 16r88
		Map8 16r89
		Map16 16r8A
		Map32 16r8B
	) pairsDo: [ :kind :value |
		| enumName |
		enumName := ('TypeDescriptorKind_', kind) asSymbol.
		(self hasClassVarNamed: enumName) ifFalse: [
			self addClassVarNamed: enumName
		].
		self classVarNamed: enumName put: value
	]
]
