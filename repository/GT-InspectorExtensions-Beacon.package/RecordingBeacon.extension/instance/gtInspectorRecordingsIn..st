*GT-InspectorExtensions-Beacon
gtInspectorRecordingsIn: composite
	<gtInspectorPresentationOrder: 40>
	composite table 
		title: 'Recordings';
		display: [ self recordings reverse ];
		column: 'Timestamp' evaluated: [ :each | each timestamp asString ];
		column: 'Type' evaluated: [ :each | each class name ];
		column: 'Contents' evaluated: [ :each | String streamContents: [ :s | each printOneLineContentsOn: s ] ];
		showOnly: 50;
		updateOn: Announcement from: [ self announcer ]