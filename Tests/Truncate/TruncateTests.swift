//
//  TruncateTests.swift
//  TruncateTests
//
//  Created by Andrew McKnight on 3/27/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import XCTest
@testable import Truncate

class TruncateTests: XCTestCase {

    func testDegenerateCases() {
        let string = "abcdefg"

        XCTAssertTrue(string.truncate(toLength: -1) == "abcdefg")
        XCTAssertTrue(string.truncate(toLength: 0) == "")
        XCTAssertTrue(string.truncate(toLength: 7) == "abcdefg")
        XCTAssertTrue(string.truncate(toLength: 20) == "abcdefg")
    }

    func testTruncateDefault() {
        let string = "abcdefg"
        let truncatedString = string.truncate(toLength: 3)
        let expected = "abc"
        XCTAssertTrue(truncatedString == expected, "expected \(expected) but got \(truncatedString)")
    }

    func testTruncateLeft() {
        let string = "abcdefg"
        let truncatedString = string.truncate(toLength: 3, truncatingFromSide: .Left)
        let expected = "efg"
        XCTAssertTrue(truncatedString == expected, "expected \(expected) but got \(truncatedString)")
    }

    func testTruncateWithIndicatorDefaultSide() {
        let string = "abcdefg"
        let truncatedString = string.truncate(toLength: 3, truncationIndicator: "…")
        let expected = "ab…"
        XCTAssertTrue(truncatedString == expected, "expected \(expected) but got \(truncatedString)")
    }

    func testLeftTruncateWithIndicator() {
        let string = "abcdefg"

        let leftTruncatedString = string.truncate(toLength: 3, truncatingFromSide: .Left, truncationIndicator: "…")
        let expected = "…fg"
        XCTAssertTrue(leftTruncatedString == expected, "expected \(expected) but got \(leftTruncatedString)")
    }

    func testRightTruncateWithIndicator() {
        let string = "abcdefg"

        let rightTruncatedString = string.truncate(toLength: 3, truncatingFromSide: .Right, truncationIndicator: "…")
        let expected = "ab…"
        XCTAssertTrue(rightTruncatedString == expected, "expected \(expected) but got \(rightTruncatedString)")
    }
    
}
