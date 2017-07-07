An implementation of a simple file logger using filename and encoding as parameter. 

It can be used like

FileLogger new
	filename: '/tmp/test.log';
	runFor: StringSignal during: [ 
		StringSignal emit: 'test message'
		]



 


