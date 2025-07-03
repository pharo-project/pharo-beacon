Extension { #name : 'Beacon' }

{ #category : '*GT-InspectorExtensions-Beacon' }
Beacon >> gtInspectorAnnouncementsIn: composite [
	<gtInspectorPresentationOrder: 30>
	self announcer gtInspectorAnnouncementsIn: composite
]

{ #category : '*GT-InspectorExtensions-Beacon' }
Beacon >> gtInspectorSubscriptionsIn: composite [
	<gtInspectorPresentationOrder: 30>
	self announcer gtInspectorSubscriptionsIn: composite
]
