versions
version11: spec
	<version: '1.1' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'new baseline to point to the Pharo repo'.
		spec author: 'TudorGirba'.
		spec timestamp: '6/15/2014 14:37'.
		spec 
			package: #Beacon with: 'Beacon-TudorGirba.31';
			package: #FuelBeacon with: 'FuelBeacon-TudorGirba.7'. ].
