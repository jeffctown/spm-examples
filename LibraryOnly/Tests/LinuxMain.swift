import XCTest

import LibraryOnlyTests

var tests = [XCTestCaseEntry]()
tests += LibraryOnlyTests.allTests()
XCTMain(tests)
