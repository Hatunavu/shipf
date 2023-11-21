if [ "$1" == "clean" ]
then 
	flutter clean
	flutter pub get
fi
flutter pub run build_runner build
export error=$?
if [ $error -ne 0 ]
then 
	flutter pub run build_runner build --delete-conflicting-outputs
fi
echo "Generate completed"