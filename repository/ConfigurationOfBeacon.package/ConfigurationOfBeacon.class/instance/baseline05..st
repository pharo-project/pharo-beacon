baselines
baseline05: spec
	<version: '0.5-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main/'.
		spec 
			package: #'Beacon-Core';
			package: #'Beacon-Core-GT' with: [
				spec requires: #('Beacon-Core' ). ];
			package: #'Beacon-Core-Tests' with: [
				spec requires: #('Beacon-Core' ). ];
			package: #'Beacon-Syslog';
			package: #'Beacon-File';
			package: #'FuelBeacon';
			package: #'Beacon-Zinc'.
		spec 
			group: 'Core' with: #('Beacon-Core' );
			group: 'default' with: #('Beacon-Core' 'Beacon-Core-Tests' 'Beacon-Core-GT' 'Beacon-Syslog' 'Beacon-File' 'FuelBeacon' 'Beacon-Zinc'). ].
