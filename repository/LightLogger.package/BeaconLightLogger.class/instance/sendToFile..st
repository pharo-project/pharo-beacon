as yet unclassified
sendToFile: aFile

	FileLogger new 
		stream: (ZnNewLineWriterStream on: aFile);
		start