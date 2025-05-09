saving
fromStonFile: aFileReference

	| logger |

	logger := aFileReference asFileReference binaryReadStreamDo: [ :bstream |
		STON fromStream: (ZnCharacterReadStream
			on: (GZipReadStream on: bstream)
			encoding: 'utf8') ].
	^logger