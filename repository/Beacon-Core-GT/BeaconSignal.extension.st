Extension { #name : 'BeaconSignal' }

{ #category : '*Beacon-Core-GT' }
BeaconSignal >> gtDisplayOn: stream [
	self printOneLineOn: stream
]

{ #category : '*Beacon-Core-GT' }
BeaconSignal class >> gtExampleEmpty [
	<gtExample>
	<label: 'Empty'>
	
	^ self new
]

{ #category : '*Beacon-Core-GT' }
BeaconSignal >> gtOneLineIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite text
		title: 'One line';
		display: [ self printOneLineString ]
]
