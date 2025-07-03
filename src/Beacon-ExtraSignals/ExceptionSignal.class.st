"
This signal is useful to log an exception.

Example:
	TranscriptLogger new runDuring: [
		[1/0] on: Error do: [ :error |  error emit].
	]. 
"
Class {
	#name : 'ExceptionSignal',
	#superclass : 'BeaconSignal',
	#instVars : [
		'exception',
		'stack'
	],
	#category : 'Beacon-ExtraSignals',
	#package : 'Beacon-ExtraSignals'
}

{ #category : 'instance creation' }
ExceptionSignal class >> emit: anException [
	^ (self new 
		exception: anException; 
		stack: (anException signalerContext stack collect: [:each | each sourceNodeExecuted])) emit
]

{ #category : 'instance creation' }
ExceptionSignal class >> log: anException [
	self deprecated: 'Should use #emit:'.
	^ self emit: anException
]

{ #category : 'accessing' }
ExceptionSignal >> exception [
	^ exception
]

{ #category : 'accessing' }
ExceptionSignal >> exception: anObject [
	exception := anObject
]

{ #category : 'as yet unclassified' }
ExceptionSignal >> gtInspectorStackIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite fastTable
		title: 'Stack';
		display: [ self stack ];
		column: 'Class' evaluated: [:each | each parents first methodClass ];
		column: 'Method' evaluated: [:each | each parents first selector];
		column: 'Code' evaluated: [:each | each formattedCode]
]

{ #category : 'printing' }
ExceptionSignal >> printOn: stream [
	super printOn: stream.
	stream space.
	self exception printOn: stream 
]

{ #category : 'printing' }
ExceptionSignal >> printOneLineContentsOn: stream [
	self exception printOn: stream 
]

{ #category : 'accessing' }
ExceptionSignal >> stack [
	^ stack
]

{ #category : 'accessing' }
ExceptionSignal >> stack: anObject [
	stack := anObject
]
