"
A wrapper for ZnLogEvents

Usage:

((FileLogger new
    filename: FileLocator imageDirectory / 'test.log')
	runFor: ZnLogEventSignal during: [
		ZnEasy get: 'http://pharo.org'
		 ];
	stream) close



"
Class {
	#name : 'ZnLogEventSignal',
	#superclass : 'BeaconSignal',
	#instVars : [
		'target'
	],
	#category : 'Beacon-Zinc',
	#package : 'Beacon-Zinc'
}

{ #category : 'instance creation' }
ZnLogEventSignal class >> emit: aTargetObject [
	^ (self on: aTargetObject) emit
]

{ #category : 'instance creation' }
ZnLogEventSignal class >> log: aTargetObject [
	self deprecated: 'Should use #emit:'.
	^ self emit: aTargetObject 
]

{ #category : 'instance creation' }
ZnLogEventSignal class >> on: aTargetObject [
	^ self new 
		target: aTargetObject 
]

{ #category : 'accessing' }
ZnLogEventSignal >> name [
	^ 'ZnLogEventSignal on ', self target class name
]

{ #category : 'printing' }
ZnLogEventSignal >> printOneLineContentsOn: stream [
	self target printOneLineContentsOn: stream 
]

{ #category : 'accessing' }
ZnLogEventSignal >> target [
	^ target
]

{ #category : 'accessing' }
ZnLogEventSignal >> target: anObject [
	target := anObject
]
