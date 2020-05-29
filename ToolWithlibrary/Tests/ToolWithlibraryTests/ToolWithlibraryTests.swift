import XCTest
@testable import ToolWithlibrary

final class ToolWithlibraryTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ToolWithlibrary().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
