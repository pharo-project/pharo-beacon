Class {
	#name : 'LightLogger',
	#superclass : 'Object',
	#instVars : [
		'filters'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'actions' }
LightLogger class >> globalName [
		
	^ #logger
]

{ #category : 'actions' }
LightLogger class >> install [
	<script>
	
	self install: EmptyLightLogger uniqueInstance
]

{ #category : 'actions' }
LightLogger class >> install: aLogger [

	^ Smalltalk 
		at: self globalName
		put: aLogger
]

{ #category : 'instance creation' }
LightLogger class >> new [
	
	self error: 'Use #uniqueInstance'
]

{ #category : 'actions' }
LightLogger class >> uninstall [
	<script>
	
	Smalltalk globals
		removeKey: self globalName
		ifAbsent: [ ]
]

{ #category : 'instance creation' }
LightLogger class >> uniqueInstance [

	self = LightLogger ifTrue: [
		self error: 'I''m an abstract class. Use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : 'accessing' }
LightLogger >> disable [

	^ self class install: EmptyLightLogger uniqueInstance
]

{ #category : 'accessing' }
LightLogger >> enable [

	^ self class install: BeaconLightLogger uniqueInstance.
	
]

{ #category : 'tracing' }
LightLogger >> error: aString [

]

{ #category : 'tracing' }
LightLogger >> info: aString [

]

{ #category : 'testing' }
LightLogger >> isEnabled [

	^ self subclassResponsibility
]

{ #category : 'tracing' }
LightLogger >> object: aVariable [
	"trace variable value"
]

{ #category : 'tracing' }
LightLogger >> trace [
	"trace method (and line)"
]

{ #category : 'tracing' }
LightLogger >> trace: aString [
	"trace method (and line)"
]

{ #category : 'tracing' }
LightLogger >> trace: aString message: messageString [
	"trace method (and line)"
]

{ #category : 'tracing' }
LightLogger >> traceStack [

]

{ #category : 'tracing' }
LightLogger >> var: aVariable [
	"trace variable value"
]

{ #category : 'tracing' }
LightLogger >> variable: aVariable [
	"trace variable value"
]
