accessing
allLogLevelSelectors
	"Collect all selectors that have a <logLevel> pragma"
	^ self class allMethods 
		select: [ :each | each hasPragmaNamed: #logLevel ] 
		thenCollect: [ :method | method selector]