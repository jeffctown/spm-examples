`jeff@jeffs-2018-mbp ToolWithLibrary % ./generate_xcframework.sh > README.md 2>&1`

Results in:

```
+./generate_xcframework.sh:7> rm -rf Library.xcframework
+./generate_xcframework.sh:8> rm -rf archives
+./generate_xcframework.sh:11> PROJECT_NAME=ToolWithLibrary 
+./generate_xcframework.sh:12> FRAMEWORK_NAME=Library 
+./generate_xcframework.sh:16> swift package generate-xcodeproj
generated: ./ToolWithLibrary.xcodeproj
+./generate_xcframework.sh:17> xcodebuild -project ToolWithLibrary.xcodeproj -list
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -project ToolWithLibrary.xcodeproj -list

Information about project "ToolWithLibrary":
    Targets:
        Executable
        Library
        ToolWithLibraryPackageDescription
        ToolWithLibraryPackageTests
        ToolWithlibraryTests

    Build Configurations:
        Debug
        Release

    If no build configuration is specified and -scheme is not passed then "Release" is used.

    Schemes:
        Executable
        ToolWithLibrary-Package

+./generate_xcframework.sh:19> set -o pipefail
+./generate_xcframework.sh:22> xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme ToolWithLibrary-Package -destination 'generic/platform=iOS' -archivePath archives/ToolWithLibrary-iOS 'SKIP_INSTALL=NO' 'BUILD_LIBRARY_FOR_DISTRIBUTION=YES'
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme ToolWithLibrary-Package -destination generic/platform=iOS -archivePath archives/ToolWithLibrary-iOS SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

User defaults from command line:
    IDEArchivePathOverride = /Users/jeff/spm-examples/ToolWithLibrary/archives/ToolWithLibrary-iOS

Build settings from command line:
    BUILD_LIBRARY_FOR_DISTRIBUTION = YES
    SKIP_INSTALL = NO

note: Using new build system
note: Building targets in parallel
note: Planning build
note: Constructing build description
error: unable to resolve product type 'com.apple.product-type.tool' for platform 'iphoneos' (in target 'Executable' from project 'ToolWithLibrary')
error: unable to resolve product type 'com.apple.product-type.tool' for platform 'iphoneos' (in target 'Executable' from project 'ToolWithLibrary')
2020-05-29 17:14:57.051 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming:                                             REAL        USER         SYS  PAGEIN  /    OUT
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: Build operation                     :     0.8398r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build operation setup               :     0.0011r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming:   | Builder creation                    :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build                               :     0.8381r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming:   | Builder Executable                  :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming:     | Build tasks                         :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build operation finishing           :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build operation cleanup             :     0.0002r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: Log emission                        :     0.0003r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming:                                             REAL        USER         SYS  PAGEIN  /    OUT
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: Build operation                     :     0.8398r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build operation setup               :     0.0011r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming:   | Builder creation                    :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build                               :     0.8381r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming:   | Build tasks (1 builders)            :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build operation finishing           :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: | Build operation cleanup             :     0.0002r     0.0000u     0.0000s                
2020-05-29 17:14:57.052 xcodebuild[12436:1056240] [MT] IDEBuildOperationTiming: Log emission                        :     0.0003r     0.0000u     0.0000s                

** ARCHIVE FAILED **

+./generate_xcframework.sh:28> xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme Executable -destination 'generic/platform=iOS' -archivePath archives/ToolWithLibrary-iOS 'SKIP_INSTALL=NO' 'BUILD_LIBRARY_FOR_DISTRIBUTION=YES'
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild archive -project ToolWithLibrary.xcodeproj -scheme Executable -destination generic/platform=iOS -archivePath archives/ToolWithLibrary-iOS SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

User defaults from command line:
    IDEArchivePathOverride = /Users/jeff/spm-examples/ToolWithLibrary/archives/ToolWithLibrary-iOS

Build settings from command line:
    BUILD_LIBRARY_FOR_DISTRIBUTION = YES
    SKIP_INSTALL = NO

note: Using new build system
note: Building targets in parallel
note: Planning build
note: Constructing build description
error: unable to resolve product type 'com.apple.product-type.tool' for platform 'iphoneos' (in target 'Executable' from project 'ToolWithLibrary')
error: unable to resolve product type 'com.apple.product-type.tool' for platform 'iphoneos' (in target 'Executable' from project 'ToolWithLibrary')
2020-05-29 17:14:58.908 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming:                                             REAL        USER         SYS  PAGEIN  /    OUT
2020-05-29 17:14:58.908 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: Build operation                     :     0.8260r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build operation setup               :     0.0015r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming:   | Builder creation                    :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build                               :     0.8239r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming:   | Builder Executable                  :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming:     | Build tasks                         :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build operation finishing           :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build operation cleanup             :     0.0002r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: Log emission                        :     0.0004r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming:                                             REAL        USER         SYS  PAGEIN  /    OUT
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: Build operation                     :     0.8260r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build operation setup               :     0.0015r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming:   | Builder creation                    :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build                               :     0.8239r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming:   | Build tasks (1 builders)            :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build operation finishing           :     0.0000r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: | Build operation cleanup             :     0.0002r     0.0000u     0.0000s                
2020-05-29 17:14:58.909 xcodebuild[12444:1056456] [MT] IDEBuildOperationTiming: Log emission                        :     0.0002r     0.0000u     0.0000s                

** ARCHIVE FAILED **

```
