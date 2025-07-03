Class {
	#name : 'TraceVariableSignal',
	#superclass : 'TraceObjectSignal',
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'initialization' }
TraceVariableSignal >> fromContext: aContext node: aNode [

	super fromContext: aContext node: aNode.
	traceName := aNode name
]
