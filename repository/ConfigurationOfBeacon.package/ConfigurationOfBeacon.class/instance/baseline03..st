baselines
baseline03: spec
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/Beacon/main/'.
		spec 
			package: #Beacon;
			package: 'Beacon-Syslog' with: [
				spec requires: #(#Beacon ). ];
			package: #FuelBeacon with: [
				spec requires: #(#Beacon ). ]. ].
