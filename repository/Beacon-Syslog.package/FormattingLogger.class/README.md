I add the possibility to attach an object responsible for formatting log objects.
This can be important for use case where strings in a specific format should be outputted.

I provide three hooks to my subclasses

	- the defaultFormatterClass
	- the way to store object using the storeObject: message
	- the possibility to convert a Log into something else.
	The formatter is called using formatLog: aLog from: aLogger