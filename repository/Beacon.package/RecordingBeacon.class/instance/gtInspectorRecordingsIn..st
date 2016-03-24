ui
gtInspectorRecordingsIn: composite
	<gtInspectorPresentationOrder: 0>
	composite table 
		title: 'Recordings';
		display: [ self recordings reverse ];
		column: 'Timestamp' evaluated: [ :each | each timestamp asString ];
		column: 'Process' evaluated: [ :each | each processId asString ];
		column: 'Type' evaluated: [ :each | each name ];
		column: 'Contents' evaluated: [ :each | String streamContents: [ :s | each printOneLineContentsOn: s ] ];
		showOnly: 50;
		beMultiple;
		send: [ :selection | 
			(selection isNil or: [ selection size > 1 ] )
				ifFalse: [selection first] ifTrue: [selection]] ;
		updateOn: Announcement from: [ self announcer ];
		selectionAct: [ :table | 
			recordings := self recordings \ table selection.
			table update ]
			icon: GLMUIThemeExtraIcons glamorousRemove
			entitled: 'Remove';
		act: [ :table |
			self reset.
			table update ]
			icon: GLMUIThemeExtraIcons glamorousRemove
			entitled: 'Remove all'