"
This beacon saves each signal into a Fuel file in the current folder.

Example:
	self new runDuring: [ 
		StringSignal log: 'This is a message'.
		StringSignal log: 'This is another message'. ].

"
Class {
	#name : 'FuelLogger',
	#superclass : 'SignalLogger',
	#instVars : [
		'directory'
	],
	#category : 'FuelBeacon-Core',
	#package : 'FuelBeacon',
	#tag : 'Core'
}

{ #category : 'instance creation' }
FuelLogger class >> on: aDirectoryReference [
	^ self new directory: aDirectoryReference
]

{ #category : 'accessing' }
FuelLogger >> directory [
	^ directory
]

{ #category : 'accessing' }
FuelLogger >> directory: aFileReference [
	directory := aFileReference 
]

{ #category : 'registering' }
FuelLogger >> handle: aSignal [
	self directory ensureCreateDirectory.
	aSignal serializeInDirectory: self directory
]

{ #category : 'initialize' }
FuelLogger >> initialize [
	super initialize.
	directory := FileSystem disk workingDirectory / 'fuelbeacon'
]
