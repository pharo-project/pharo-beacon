accessing - output
sendToFile: aFile

	FileLogger new 
		stream: (ZnNewLineWriterStream on: aFile);
		start