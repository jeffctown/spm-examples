+./generate_xcframework.sh:7> rm -rf Library.xcframework
+./generate_xcframework.sh:8> rm -rf archives
+./generate_xcframework.sh:11> PROJECT_NAME=ToolWithLibrary 
+./generate_xcframework.sh:12> FRAMEWORK_NAME=Library 
+./generate_xcframework.sh:16> swift package generate-xcodeproj
generated: ./ToolWithlibrary.xcodeproj
+./generate_xcframework.sh:17> xcodebuild -project ToolWithLibrary.xcodeproj -list
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -project ToolWithLibrary.xcodeproj -list

Information about project "ToolWithlibrary":
    Targets:
        Executable
        Library
        ToolWithlibraryPackageDescription
        ToolWithlibraryPackageTests
        ToolWithlibraryTests

    Build Configurations:
        Debug
        Release

    If no build configuration is specified and -scheme is not passed then "Release" is used.

    Schemes:
        Executable
        ToolWithlibrary-Package

+./generate_xcframework.sh:19> set -o pipefail
+./generate_xcframework.sh:22> xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme ToolWithLibrary-Package -destination 'generic/platform=iOS' -archivePath archives/ToolWithLibrary-iOS 'SKIP_INSTALL=NO' 'BUILD_LIBRARY_FOR_DISTRIBUTION=YES'
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme ToolWithLibrary-Package -destination generic/platform=iOS -archivePath archives/ToolWithLibrary-iOS SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

User defaults from command line:
    IDEArchivePathOverride = /Users/jeff/spm-examples/ToolWithlibrary/archives/ToolWithLibrary-iOS

Build settings from command line:
    BUILD_LIBRARY_FOR_DISTRIBUTION = YES
    SKIP_INSTALL = NO

xcodebuild: error: The project named "ToolWithlibrary" does not contain a scheme named "ToolWithLibrary-Package". The "-list" option can be used to find the names of the schemes in the project.
+./generate_xcframework.sh:28> xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme Executable -destination 'generic/platform=iOS' -archivePath archives/ToolWithLibrary-iOS 'SKIP_INSTALL=NO' 'BUILD_LIBRARY_FOR_DISTRIBUTION=YES'
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme Executable -destination generic/platform=iOS -archivePath archives/ToolWithLibrary-iOS SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

User defaults from command line:
    IDEArchivePathOverride = /Users/jeff/spm-examples/ToolWithlibrary/archives/ToolWithLibrary-iOS

Build settings from command line:
    BUILD_LIBRARY_FOR_DISTRIBUTION = YES
    SKIP_INSTALL = NO

note: Using new build system
note: Building targets in parallel
note: Planning build
note: Constructing build description
error: unable to resolve product type 'com.apple.product-type.tool' for platform 'iphoneos' (in target 'Executable' from project 'ToolWithlibrary')
error: unable to resolve product type 'com.apple.product-type.tool' for platform 'iphoneos' (in target 'Executable' from project 'ToolWithlibrary')
2020-05-29 17:09:16.044 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming:                                             REAL        USER         SYS  PAGEIN  /    OUT
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: Build operation                     :     0.8935r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build operation setup               :     0.0010r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming:   | Builder creation                    :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build                               :     0.8919r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming:   | Builder Executable                  :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming:     | Build tasks                         :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build operation finishing           :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build operation cleanup             :     0.0002r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: Log emission                        :     0.0005r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming:                                             REAL        USER         SYS  PAGEIN  /    OUT
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: Build operation                     :     0.8935r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build operation setup               :     0.0010r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming:   | Builder creation                    :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build                               :     0.8919r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming:   | Build tasks (1 builders)            :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build operation finishing           :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: | Build operation cleanup             :     0.0002r     0.0000u     0.0000s                
2020-05-29 17:09:16.045 xcodebuild[11893:1049921] [MT] IDEBuildOperationTiming: Log emission                        :     0.0002r     0.0000u     0.0000s                

** ARCHIVE FAILED **

