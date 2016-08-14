baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main/'.
		spec 
			package: #'Beacon-Core';
			package: #'Beacon-Core-Tests' with: [ spec requires: 'Beacon-Core' ];
			package: #'Beacon-Core-GT' with: [ spec requires: 'Beacon-Core' ].
		spec group: 'default' with: #(Beacon-Core Beacon-Core-Tests Beacon-Core-GT).
		spec group: 'Core' with: #(Beacon-Core)  ].
