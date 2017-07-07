tests
testSerializeAndMaterializeOneStringSignal
	| signal materializedSignal |
	signal := StringSignal log: 'test'.
	materializedSignal := FLMaterializer materializeFromFileNamed: directory files first fullName.
	self assert: (materializedSignal isKindOf: StringSignal)