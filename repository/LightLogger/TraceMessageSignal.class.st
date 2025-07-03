Class {
	#name : 'TraceMessageSignal',
	#superclass : 'TraceObjectSignal',
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'initialization' }
TraceMessageSignal >> fromContext: aContext node: aNode [

	super fromContext: aContext node: aNode.
	traceName := aNode formattedCode
]
