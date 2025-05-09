printing
printOneLineContentsOn: stream

	stream 
		<< self senderClass name  << '>>#' << self senderSelector 
		<< '@';
			print: self sourcePosition first