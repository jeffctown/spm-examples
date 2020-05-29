#!/bin/zsh

PROJECT_NAME="ToolWithlibrary"
FRAMEWORK_NAME="Library"

#-----------------------------------
#
# This is the problem.  
# There is no scheme that is generated to build my library if I have an executable and a library in my package.
#
SCHEME_NAME="ToolWithlibrary-Package"
#
# Here are the targets, build configurations, and schemes we get today.
#
#Command line invocation:
#    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -project ToolWithlibrary.xcodeproj -list
#
#Information about project "ToolWithlibrary":
#    Targets:
#        Executable
#        Library
#        ToolWithlibraryPackageDescription
#        ToolWithlibraryPackageTests
#        ToolWithlibraryTests
#
#    Build Configurations:
#        Debug
#        Release
#
#    If no build configuration is specified and -scheme is not passed then "Release" is used.
#
#    Schemes:
#        Executable
#        ToolWithlibrary-Package
#
#-----------------------------------

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

xcodebuild -create-xcframework \
         -framework "archives/$PROJECT_NAME-iOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-iOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-watchOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-watchOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-tvOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-tvOS Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -framework "archives/$PROJECT_NAME-macOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
         -output "$FRAMEWORK_NAME.xcframework"
