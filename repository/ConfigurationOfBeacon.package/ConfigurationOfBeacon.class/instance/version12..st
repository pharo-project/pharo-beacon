versions
version12: spec
	<version: '1.2' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'NorbertHartl'.
		spec timestamp: '9/8/2016 14:20'.
		spec 
			package: #'Beacon-Core' with: 'Beacon-Core-NorbertHartl.6';
			package: #'Beacon-Core-GT' with: 'Beacon-Core-GT-TudorGirba.1';
			package: #'Beacon-Core-Tests' with: 'Beacon-Core-Tests-NorbertHartl.2';
			package: 'Beacon-Syslog' with: 'Beacon-Syslog-NorbertHartl.9'. ].
