writing
writeEncodedString: aString on: aStream
	"according to RFC 5424 a BOM needs to be written if the encoded string
	is utf-8 encoded"
	"removed for now. This is a mismatch between RFC3164 and RFC5424. As those two
	are not compatible this should be separated in two different formatters. Now we just
	encode utf-8 to be able to transport proper strings"
	"self hasUtf8Converter ifTrue: [
		converter class writeBOMOn: aStream ]."
	"in order to support proper utf-8 encoding we need to workaround that 
	TextConverter>>#nextPutByteString:toStream: does not work for WideStrings. So we put 
	every single characters ourselves on the stream"
	aStream nextPutAll: (converter convertToSystemString: aString)