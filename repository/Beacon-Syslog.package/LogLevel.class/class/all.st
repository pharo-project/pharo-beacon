accessing
all
	"Return all available log levels that are defined within the receiving class"
	^ (self allLogLevelSelectors 
		collect: [ :selector | self perform: selector ])
			sorted