"
A signal to print a valuable. Useful when you have complex construcitions to log and you do not want to slowdown the system when beacon is disabled.
"
Class {
	#name : 'ValuableSignal',
	#superclass : 'BeaconSignal',
	#instVars : [
		'valuable'
	],
	#category : 'Beacon-ExtraSignals',
	#package : 'Beacon-ExtraSignals'
}

{ #category : 'instance creation' }
ValuableSignal class >> emit: aValuable [

	^ (self on: aValuable) emit
]

{ #category : 'instance creation' }
ValuableSignal class >> on: aValuable [
	
	^ self new 
		valuable: aValuable;
		yourself
]

{ #category : 'printing' }
ValuableSignal >> printOneLineContentsOn: stream [

	self valuable value printOn: stream 
]

{ #category : 'accessing' }
ValuableSignal >> valuable [

	^ valuable
]

{ #category : 'accessing' }
ValuableSignal >> valuable: aValuable [

	valuable := aValuable
]
