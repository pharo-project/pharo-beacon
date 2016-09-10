operations
nextPutSerialized: aString

	hosts do: [:host | self send: aString to: host key port: host value]