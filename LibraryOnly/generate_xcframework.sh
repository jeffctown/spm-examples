#!/bin/zsh

# print commands
set -x

# clean up
rm -rf LibraryOnly.xcframework
rm -rf archives

# env vars
PROJECT_NAME="LibraryOnly"
SCHEME_NAME="LibraryOnly-Package"
FRAMEWORK_NAME="LibraryOnly"

# Steps to Create XCFramework when we tag a new Package release

swift package generate-xcodeproj
xcodebuild -project "$PROJECT_NAME.xcodeproj" -list

set -o pipefail

platforms=("iOS" "iOS Simulator" "watchOS" "watchOS Simulator" "tvOS" "tvOS Simulator" "macOS")
for platform in "${platforms[@]}"; do
        xcodebuild archive -project "$PROJECT_NAME.xcodeproj" -scheme "$SCHEME_NAME" \
    		-destination "generic/platform=$platform" \
            	-archivePath "archives/$PROJECT_NAME-$platform" \
            	SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty
done

echo "Generating final xcframework..."

xcodebuild -create-xcframework \
         -framework "archives/$PROJECT_NAME-iOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-iOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-watchOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-watchOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-tvOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-tvOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-macOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -output "$FRAMEWORK_NAME.xcframework"

echo "Done."

tree "$FRAMEWORK_NAME.xcframework"
