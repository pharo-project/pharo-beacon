Root of log formatters.

in essence a subclass should answer differently to 
	
	serializeSignal: aSignal logger: aLogger 

and you get a new formatter.	
	
	serializeSignal: aSignal on: aStream logger: aLogger 
	
will be useful to call into for writing to a given stream of the logger
	
