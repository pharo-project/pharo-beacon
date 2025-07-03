Class {
	#name : 'LightFilterPackage',
	#superclass : 'LightFilter',
	#instVars : [
		'package'
	],
	#category : 'LightLogger',
	#package : 'LightLogger'
}

{ #category : 'instance creation' }
LightFilterPackage class >> newPackage: aPackageOrSymbol [

	^ self new 
		package: aPackageOrSymbol;
		yourself
]

{ #category : 'testing' }
LightFilterPackage >> isTracing: aContext [

	^ aContext methodClass package = self package
]

{ #category : 'accessing' }
LightFilterPackage >> package [

	^ package
]

{ #category : 'accessing' }
LightFilterPackage >> package: aPackageOrSymbol [

	package := aPackageOrSymbol isPackage
		ifTrue: [ aPackageOrSymbol ]
		ifFalse: [ aPackageOrSymbol asPackage ]
]
