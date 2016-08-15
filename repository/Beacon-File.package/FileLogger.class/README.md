An implementation of a simple file logger using filename and encoding as parameter. 

It can be used like

FileLogger new
	filename: '/tmp/test.log';
	startFor: StringSignal.
	
and theStringSignal new
	message: 'test message';
	log.
 


