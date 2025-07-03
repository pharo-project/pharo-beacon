Class {
	#name : 'ConfigurationOfBeacon',
	#superclass : 'Object',
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfBeacon',
	#package : 'ConfigurationOfBeacon'
}

{ #category : 'development support' }
ConfigurationOfBeacon class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : 'private' }
ConfigurationOfBeacon class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : 'private' }
ConfigurationOfBeacon class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : 'private' }
ConfigurationOfBeacon class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : 'metacello tool support' }
ConfigurationOfBeacon class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : 'loading' }
ConfigurationOfBeacon class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : 'loading' }
ConfigurationOfBeacon class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : 'loading' }
ConfigurationOfBeacon class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : 'accessing' }
ConfigurationOfBeacon class >> project [

	^self new project
]

{ #category : 'development support' }
ConfigurationOfBeacon class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : 'baselines' }
ConfigurationOfBeacon >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/girba/Beacon/main/'.
		spec 
			package: #Beacon;
			package: #FuelBeacon. ].

]

{ #category : 'baselines' }
ConfigurationOfBeacon >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main/'.
		spec 
			package: #Beacon;
			package: #FuelBeacon with: [ spec requires: #(#Beacon) ] . ].

]

{ #category : 'baselines' }
ConfigurationOfBeacon >> baseline03: spec [
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main/'.
		spec 
			package: #Beacon;
			package: 'Beacon-Syslog' with: [
				spec requires: #(#Beacon ). ];
			package: #FuelBeacon with: [
				spec requires: #(#Beacon ). ]. ].

]

{ #category : 'baselines' }
ConfigurationOfBeacon >> baseline04: spec [
	<version: '0.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main/'.
		spec 
			package: #'Beacon-Core';
			package: #'Beacon-Core-GT' with: [
				spec requires: #('Beacon-Core' ). ];
			package: #'Beacon-Core-Tests' with: [
				spec requires: #('Beacon-Core' ). ];
			package: 'Beacon-Syslog'.
		spec 
			group: 'Core' with: #('Beacon-Core' );
			group: 'default' with: #('Beacon-Core' 'Beacon-Core-Tests' 'Beacon-Core-GT' ). ].

]

{ #category : 'baselines' }
ConfigurationOfBeacon >> baseline05: spec [
	<version: '0.5-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main/'.
		spec 
			package: #'Beacon-Core';
			package: #'Beacon-Core-GT' with: [
				spec requires: #('Beacon-Core' ). ];
			package: #'Beacon-Core-Tests' with: [
				spec requires: #('Beacon-Core' ). ];
			package: #'Beacon-Syslog';
			package: #'Beacon-File';
			package: #'FuelBeacon';
			package: #'Beacon-Zinc'.
		spec 
			group: 'Core' with: #('Beacon-Core' );
			group: 'default' with: #('Beacon-Core' 'Beacon-Core-Tests' 'Beacon-Core-GT' 'Beacon-Syslog' 'Beacon-File' 'FuelBeacon' 'Beacon-Zinc'). ].

]

{ #category : 'accessing' }
ConfigurationOfBeacon >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : 'symbolic versions' }
ConfigurationOfBeacon >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.5-baseline'.

]

{ #category : 'accessing' }
ConfigurationOfBeacon >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : 'symbolic versions' }
ConfigurationOfBeacon >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.3'.

]

{ #category : 'versions' }
ConfigurationOfBeacon >> version10: spec [
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'TudorGirba'.
		spec timestamp: '6/15/2014 14:37'.
		spec 
			package: #Beacon with: 'Beacon-TudorGirba.31';
			package: #FuelBeacon with: 'FuelBeacon-TudorGirba.7'. ].

]

{ #category : 'versions' }
ConfigurationOfBeacon >> version11: spec [
	<version: '1.1' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'new baseline to point to the Pharo repo'.
		spec author: 'TudorGirba'.
		spec timestamp: '6/15/2014 14:37'.
		spec 
			package: #Beacon with: 'Beacon-TudorGirba.31';
			package: #FuelBeacon with: 'FuelBeacon-TudorGirba.7'. ].

]

{ #category : 'versions' }
ConfigurationOfBeacon >> version12: spec [
	<version: '1.2' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'NorbertHartl'.
		spec timestamp: '9/8/2016 14:20'.
		spec 
			package: #'Beacon-Core' with: 'Beacon-Core-NorbertHartl.6';
			package: #'Beacon-Core-GT' with: 'Beacon-Core-GT-TudorGirba.1';
			package: #'Beacon-Core-Tests' with: 'Beacon-Core-Tests-NorbertHartl.2';
			package: 'Beacon-Syslog' with: 'Beacon-Syslog-NorbertHartl.9'. ].

]

{ #category : 'versions' }
ConfigurationOfBeacon >> version13: spec [
	<version: '1.3' imports: #('0.5-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 1.3'.
			spec author: 'PhilippeBack'.
			spec timestamp: '30/5/2016 15:14 CSET'.
			spec
				package: #'Beacon-Core'
					with: 'Beacon-Core-PhilippeBack.17';
				package: #'Beacon-Core-GT'
					with: 'Beacon-Core-GT-PavelKrivanek.5';
				package: #'Beacon-Core-Tests'
					with: 'Beacon-Core-Tests-PhilippeBack.6';
				package: 'Beacon-Syslog'
					with: 'Beacon-Syslog-NorbertHartl.10';
				package: 'Beacon-Zinc' with: 'Beacon-Zinc-PhilippeBack.2';
				package: 'FuelBeacon' with: 'FuelBeacon-TudorGirba.11' ]
]
