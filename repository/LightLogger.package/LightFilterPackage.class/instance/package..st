accessing
package: aPackageOrSymbol

	package := aPackageOrSymbol isPackage
		ifTrue: [ aPackageOrSymbol ]
		ifFalse: [ aPackageOrSymbol asPackage ]