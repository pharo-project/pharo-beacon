Root of log formatters.

in essence a subclass should answer differently to 
	
	formatLog: aLog on: aStream from: aLogger 
	
and you get a new formatter.