A wrapper for ZnLogEvents

Usage:

((FileLogger new
    filename: FileLocator imageDirectory / 'test.log')
	runFor: ZnLogEventSignal during: [
		ZnEasy get: 'http://pharo.org'
		 ];
	stream) close


