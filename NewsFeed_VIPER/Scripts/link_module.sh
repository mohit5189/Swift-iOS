
# Validate input argument should be module name
if [ $# != 1 ] 
then
	echo "Expect a Module Name as input argument"
	exit 1
fi
MODULE_NAME=$1

# 1. Add new module file paths into Scripts/CuckooInputFiles.xcfilelist for Cuckoo to generate protocol mock 
VIEW_FILE_PATH="\${SRCROOT}/NewsFeed_VIPER/Modules/${MODULE_NAME}/${MODULE_NAME}View.swift"
INTERACTOR_FILE_PATH="\${SRCROOT}/NewsFeed_VIPER/Modules/${MODULE_NAME}/${MODULE_NAME}Interactor.swift"
ROUTER_FILE_PATH="\${SRCROOT}/NewsFeed_VIPER/Modules/${MODULE_NAME}/${MODULE_NAME}Router.swift"
PATHS_TO_ADD=($VIEW_FILE_PATH $INTERACTOR_FILE_PATH $ROUTER_FILE_PATH)

CUCKOO_INPUT_FILE_PATH="Scripts/CuckooInputFiles.xcfilelist"
for i in "${PATHS_TO_ADD[@]}"
do
    if ! grep -q "$i" $CUCKOO_INPUT_FILE_PATH; then
        echo "$i" >> $CUCKOO_INPUT_FILE_PATH
        echo "Added $i into $CUCKOO_INPUT_FILE_PATH"
    else
        echo "ERROR: $i already exists in $CUCKOO_INPUT_FILE_PATH"
    fi
done

APP_ASSEMBLY_FILE_PATH="NewsFeed_VIPER/Module/App/AppAssembly/DependencyManager.swift"
ASSEMBLY_CONTRUCTOR="            ${MODULE_NAME}DIAssembly(),"
if ! grep -q "$ASSEMBLY_CONTRUCTOR" $APP_ASSEMBLY_FILE_PATH; then
	awk "/Assembler\(\[/ { print; print \"$ASSEMBLY_CONTRUCTOR\"; next }1" $APP_ASSEMBLY_FILE_PATH > $APP_ASSEMBLY_FILE_PATH.tmp
	mv $APP_ASSEMBLY_FILE_PATH.tmp $APP_ASSEMBLY_FILE_PATH
    echo "Added $ASSEMBLY_CONTRUCTOR into $APP_ASSEMBLY_FILE_PATH"
else
	echo "ERROR: $ASSEMBLY_CONTRUCTOR already exists in $APP_ASSEMBLY_FILE_PATH"
fi

# Sort project file
python Scripts/xUnique.py -scpv "NewsFeed_VIPER.xcodeproj/project.pbxproj"
