ENV = $(shell cat .env | grep '^[A-Z]' | perl -ne 'print "--dart-define=$$_"' | xargs)

run:
	flutter run $(ENV)