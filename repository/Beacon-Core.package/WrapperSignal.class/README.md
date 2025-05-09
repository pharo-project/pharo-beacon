This signal is useful to log an arbitrary object.



### Example:

```
TranscriptLogger new 
   runDuring: [ 42 asBeaconSignal emit ]
```	


Indeed on `Object`, `Object>>#asBeaconSignal` is defined as:

```
Object >> asBeaconSignal

	^ WrapperSignal on: self
```	