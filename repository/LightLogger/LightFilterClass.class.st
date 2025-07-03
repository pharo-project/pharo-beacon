Class {
	#name : 'LightFilterClass',
	#superclass : 'LightFilter',
	#instVars : [
		'filterClass'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'instance creation' }
LightFilterClass class >> newClass: aClass [

	^ self new 
		filterClass: aClass;
		yourself
]

{ #category : 'accessing' }
LightFilterClass >> filterClass [

	^ filterClass
]

{ #category : 'accessing' }
LightFilterClass >> filterClass: aClass [

	filterClass := aClass
]

{ #category : 'testing' }
LightFilterClass >> isTracing: aContext [

	^ aContext methodClass instanceSide = self filterClass
]
