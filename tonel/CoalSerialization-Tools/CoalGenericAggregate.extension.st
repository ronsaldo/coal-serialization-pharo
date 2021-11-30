Extension { #name : #CoalGenericAggregate }

{ #category : #'*CoalSerialization-Tools' }
CoalGenericAggregate >> inspectionTree [
	<inspectorPresentationOrder: 0 title: 'Tree'>
	^ SpTreeTablePresenter new
			roots: self asFieldNameValueAssociationList;
			children: [:node |
				| value |
				value := node value.
				value isCoalGenericAggregate ifTrue: [
					value asFieldNameValueAssociationList
				] ifFalse: [
					value isDictionary ifTrue: [
						value associations
					] ifFalse: [
						value isCollection ifTrue: [
							value asArray collectWithIndex: [ :child :index |
								index -> child
							] 
						] ifFalse: [
							#()
						] ].
				]
			];
			addColumn: (SpStringTableColumn title: 'Field' evaluated: [:association | association key]);
			addColumn: (SpStringTableColumn title: 'Value' evaluated: [:association |
				(association value isCoalGenericAggregate or: [ association value isCollection and: [ association value allSatisfy: [ :each | each isCoalGenericAggregate ] ] ])
					ifTrue: [ '' ]
					ifFalse: [ association value ]
			]);
			yourself
]
