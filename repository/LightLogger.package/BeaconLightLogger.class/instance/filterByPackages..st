accessing - filtering
filterByPackages: aCollection
	aCollection do: [ :each | self filterByPackage: each ]