Class {
	#name : 'BaselineOfLightLogger',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfLightLogger',
	#package : 'BaselineOfLightLogger'
}

{ #category : 'accessing' }
BaselineOfLightLogger >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [
		spec postLoadDoIt: #postLoad.
		spec package: 'Beacon-SerializingLoggers'.
		spec package: 'Beacon-File' with: [ spec requires: #('Beacon-SerializingLoggers') ].
		spec package: 'LightLogger'.
		spec package: 'LightLogger-Tests' ].
]

{ #category : 'doits' }
BaselineOfLightLogger >> postLoad [

	(Smalltalk classNamed: #LightLogger)
		ifNotNil: [ :aClass | aClass install ]
]
