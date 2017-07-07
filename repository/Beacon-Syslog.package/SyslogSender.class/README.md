Logger that outputs sysLog messages via UDP.

To add a syslog logger do:

SyslogSender new 
	addHost: 'localhost'.

To send a syslog message use
	
StringSignal new
	message: 'a message to be logged';
	tag: 'syslog-tag';
	level: LogLevel info;
	log

#tag: and #level: are extension methods to StringSignal to be able to use syslog specific parameters