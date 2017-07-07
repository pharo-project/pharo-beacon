versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'TudorGirba'.
		spec timestamp: '6/15/2014 14:37'.
		spec 
			package: #Beacon with: 'Beacon-TudorGirba.31';
			package: #FuelBeacon with: 'FuelBeacon-TudorGirba.7'. ].
