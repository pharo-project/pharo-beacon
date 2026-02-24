"
Filters by method (logs just what happens in a single method).
Users can add multiple methods to be filtered.
"
Class {
	#name : 'LightFilterMethod',
	#superclass : 'LightFilter',
	#instVars : [
		'filterMethod'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'instance creation' }
LightFilterMethod class >> newMethod: aMethod [

	^ self new 
		filterMethod: aMethod;
		yourself
]

{ #category : 'accessing' }
LightFilterMethod >> filterMethod [

	^ filterMethod
]

{ #category : 'accessing' }
LightFilterMethod >> filterMethod: aMethod [

	filterMethod := aMethod
]

{ #category : 'testing' }
LightFilterMethod >> isTracing: aContext [

	^ aContext methodClass instanceSide = self filterMethod methodClass
		and: [ aContext selector = self filterMethod selector ]
]
