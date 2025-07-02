accessing - filtering
filterByClasses: aCollection

	aCollection do: [ :each | self filterByClass: each ]