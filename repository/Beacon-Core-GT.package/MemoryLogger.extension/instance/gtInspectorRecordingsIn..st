*beacon-core-gt
gtInspectorRecordingsIn: composite
	<gtInspectorPresentationOrder: 0>
	| live |
	live := true.
	composite fastTable 
		title: 'Recordings';
		display: [ self recordings reverse ];
		column: 'Timestamp' evaluated: [ :each | each timestamp asString ] width: 80;
		column: 'Process' evaluated: [ :each | each processId asString ];
		column: 'Type' evaluated: [ :each | each name ] width: 80;
		column: 'Contents' evaluated: [ :each | String streamContents: [ :s | each printOneLineContentsOn: s ] ];
		showOnly: 50;
"		beMultiple;"
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
			entitled: 'Remove all';
		dynamicActions: [ :t |
			{
				GLMGenericAction new
					action: [ t unregisterFromAllAnnouncements. t pane updateToolbar  ];
					icon: GLMUIThemeExtraIcons glamorousRedCircle;
					title: 'Stop' .
				GLMGenericAction new
					action: [ t pane update ];
					icon: GLMUIThemeExtraIcons glamorousGreenCircle;
					title: 'Play' }]