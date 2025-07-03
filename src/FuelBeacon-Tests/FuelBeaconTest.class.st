Class {
	#name : 'FuelBeaconTest',
	#superclass : 'TestCase',
	#instVars : [
		'fuelBeacon',
		'directory'
	],
	#category : 'FuelBeacon-Tests',
	#package : 'FuelBeacon',
	#tag : 'Tests'
}

{ #category : 'own services' }
FuelBeaconTest >> deleteDirectory [
	directory exists ifTrue: [
		directory files do: [ :each | each delete ].
		directory delete ]
]

{ #category : 'running' }
FuelBeaconTest >> setUp [
	directory := FileSystem disk workingDirectory / 'testfuelbeacon'.
	self deleteDirectory.
	directory ensureCreateDirectory.
	fuelBeacon := FuelLogger on: directory.
	fuelBeacon start
]

{ #category : 'running' }
FuelBeaconTest >> tearDown [
	fuelBeacon stop.
	self deleteDirectory
]

{ #category : 'tests' }
FuelBeaconTest >> testOneSignalLeadsToOnFile [
	StringSignal log: 'test'.
	self assert: directory files size equals: 1
]

{ #category : 'tests' }
FuelBeaconTest >> testSerializeAndMaterializeOneStringSignal [
	| signal materializedSignal |
	signal := StringSignal log: 'test'.
	materializedSignal := FLMaterializer materializeFromFileNamed: directory files first fullName.
	self assert: (materializedSignal isKindOf: StringSignal)
]

{ #category : 'tests' }
FuelBeaconTest >> testTwoSignalsLeadToTwoFiles [
	StringSignal log: 'test'.
	StringSignal log: 'test2'.
	self assert: directory files size equals: 2
]
