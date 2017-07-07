initialize
initialize
	super initialize.
	"by default we hook to the central ==Beacon== instance"
	beacon := Beacon instance.
	name := 'unnamed'