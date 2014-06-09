*GT-InspectorExtensions-Beacon
gtInspectorRecordingsIn: composite
	<gtInspectorPresentationOrder: 40>
	composite list 
		title: 'Recordings';
		display: [ self recordings reverse ];
		showOnly: 50;
		updateOn: Announcement from: [ self announcer ]