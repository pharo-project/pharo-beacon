versions
version13: spec
	<version: '1.3' imports: #('0.5-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 1.3'.
			spec author: 'PhilippeBack'.
			spec timestamp: '30/5/2016 15:14 CSET'.
			spec
				package: #'Beacon-Core'
					with: 'Beacon-Core-PhilippeBack.17';
				package: #'Beacon-Core-GT'
					with: 'Beacon-Core-GT-PavelKrivanek.5';
				package: #'Beacon-Core-Tests'
					with: 'Beacon-Core-Tests-PhilippeBack.6';
				package: 'Beacon-Syslog'
					with: 'Beacon-Syslog-NorbertHartl.10';
				package: 'Beacon-Zinc' with: 'Beacon-Zinc-PhilippeBack.2';
				package: 'FuelBeacon' with: 'FuelBeacon-TudorGirba.11' ]