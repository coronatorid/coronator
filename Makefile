ENV = $(shell cat .env | grep '^[A-Z]' | perl -ne 'print "--dart-define=$$_"' | xargs)

run:
	@flutter run $(ENV)

release:
	@flutter run --release $(ENV)

build_apk:
	@flutter build apk --split-per-abi --obfuscate --split-debug-info=$(shell pwd)/obfuscation $(ENV)
