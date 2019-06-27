baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'Beacon-Core';
			package: #'Beacon-Core-GT' with: [
				spec requires: #('Beacon-Core' ). ];
			package: #'Beacon-Core-Tests' with: [
				spec requires: #('Beacon-Core' ). ];
			package: #'Beacon-Syslog';
			package: #'Beacon-File';
			package: #'Beacon-Zinc'.
		spec 
			group: 'Core' with: #('Beacon-Core' );
			group: 'Tests' with: #('Beacon-Core-Tests');
			group: 'GTTools' with: #('Beacon-Core-GT' );
			group: 'default' with: #('Core' 'Tests' 'GTTools' 'Beacon-Syslog' 'Beacon-File' 'FuelBeacon' 'Beacon-Zinc') 
]