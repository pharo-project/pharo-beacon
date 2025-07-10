Class {
	#name : 'TraceStringSignal',
	#superclass : 'TraceSignal',
	#instVars : [
		'message'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'instance creation' }
TraceStringSignal class >> fromContext: aContext message: aString [

	^ (self fromContext: aContext) 
		message: aString;
		yourself
]

{ #category : 'accessing' }
TraceStringSignal >> message [

	^ message ifNil: [ 'No message' ]
]

{ #category : 'accessing' }
TraceStringSignal >> message: aString [

	message := aString
]

{ #category : 'printing' }
TraceStringSignal >> printOneLineContentsOn: stream [
	| stream |

	super printOneLineContentsOn: stream.
	stream << self message
]
