ston persistence
saveStonFile: aFileReference

	"Save the receiver to the supplied file name"

	| stream |
	stream := ZnCharacterWriteStream
		          on: (GZipWriteStream on: aFileReference asFileReference nextVersion binaryWriteStream)
		          encoding: 'utf8'.
	[ STON put: self onStreamPretty: stream ] ensure: [ stream close ]