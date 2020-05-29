import XCTest
@testable import LibraryOnly

final class LibraryOnlyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LibraryOnly().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
