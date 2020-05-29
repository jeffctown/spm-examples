#!/bin/zsh

# print commands
set -x

# clean up
rm -rf Library.xcframework
rm -rf archives

# env vars
PROJECT_NAME="ToolWithLibrary"
FRAMEWORK_NAME="Library"

# Steps to Create XCFramework when we tag a new Package release

swift package generate-xcodeproj
xcodebuild -project "$PROJECT_NAME.xcodeproj" -list

set -o pipefail

# The next xcodebuild command Fails!
xcodebuild archive -project "$PROJECT_NAME.xcodeproj" -scheme "ToolWithLibrary-Package" \
    		-destination "generic/platform=iOS" \
            	-archivePath "archives/$PROJECT_NAME-iOS" \
            	SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# So does this!
xcodebuild archive -project "$PROJECT_NAME.xcodeproj" -scheme "Executable" \
                -destination "generic/platform=iOS" \
                -archivePath "archives/$PROJECT_NAME-iOS" \
                SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#echo "Generating final xcframework..."
#
#xcodebuild -create-xcframework \
#         -framework "archives/$PROJECT_NAME-iOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
#         -framework "archives/$PROJECT_NAME-iOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
#         -framework "archives/$PROJECT_NAME-watchOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
#         -framework "archives/$PROJECT_NAME-watchOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
#         -framework "archives/$PROJECT_NAME-tvOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
#         -framework "archives/$PROJECT_NAME-tvOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
#         -framework "archives/$PROJECT_NAME-macOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
#         -output "$FRAMEWORK_NAME.xcframework"
#
#echo "Done."
##
#tree "$FRAMEWORK_NAME.xcframework"
