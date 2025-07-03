Extension { #name : 'Beacon' }

{ #category : '*Beacon-Core-GT' }
Beacon class >> gtExampleEmpty [
	<gtExample>
	<label: 'Empty'>
	
	^ self new
]

{ #category : '*Beacon-Core-GT' }
Beacon >> gtInspectorAnnouncementsIn: composite context: aGTContext [
	<gtInspectorPresentationOrder: 30>
	self announcer gtInspectorAnnouncementsIn: composite context: aGTContext
]

{ #category : '*Beacon-Core-GT' }
Beacon >> gtInspectorSubscriptionsIn: composite [
	<gtInspectorPresentationOrder: 30>
	self announcer gtInspectorSubscriptionsIn: composite
]
