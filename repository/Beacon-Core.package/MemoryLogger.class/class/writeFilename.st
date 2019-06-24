accessing
writeFilename

	^WriteFilename ifNil: [ WriteFilename := String streamContents: [ :stream |
			stream 
				<< self name;
				<< '-';
				print: LibC uniqueInstance currentProcessId;
				<< '.stgz' ] ].