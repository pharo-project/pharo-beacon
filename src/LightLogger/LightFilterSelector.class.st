"
Filters by method selector (logs just what happens in any method with the same name).
Users can add multiple selectors to be filtered.
"
Class {
	#name : 'LightFilterSelector',
	#superclass : 'LightFilter',
	#instVars : [
		'filterSelector'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'instance creation' }
LightFilterSelector class >> newSelector: aSelector [

	^ self new 
		filterSelector: aSelector;
		yourself
]

{ #category : 'accessing' }
LightFilterSelector >> filterSelector [

	^ filterSelector
]

{ #category : 'accessing' }
LightFilterSelector >> filterSelector: aSelector [

	filterSelector := aSelector
]

{ #category : 'testing' }
LightFilterSelector >> isTracing: aContext [

	^ aContext selector = self filterSelector
]
