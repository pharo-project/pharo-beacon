accessing
encoding
	^ encoding ifNil: [ 
		encoding := self defaultEncoding ] 