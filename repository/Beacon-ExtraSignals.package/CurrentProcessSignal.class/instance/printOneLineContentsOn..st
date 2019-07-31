printing
printOneLineContentsOn: stream

	stream 
		print: preemptedName;
		<< ', ';
		print: nextReadyName