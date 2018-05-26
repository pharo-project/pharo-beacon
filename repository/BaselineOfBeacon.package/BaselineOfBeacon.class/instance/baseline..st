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
			group: 'default' with: #('Beacon-Core' 'Beacon-Core-Tests' 'Beacon-Core-GT' 'Beacon-Syslog' 'Beacon-File' 'Beacon-Zinc'). ].
