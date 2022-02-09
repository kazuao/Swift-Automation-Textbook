//
//  Calc_iosTestTextTests.swift
//  Calc-iosTestTextTests
//
//  Created by kazunori.aoki on 2022/01/29.
//

import XCTest
@testable import Automation_Textbook

class Calc_iosTestTextTests: XCTestCase {

    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_add() {
        let result = calculator.add(1, 2)
        XCTAssertEqual(result, 3)
    }

    func test_subtract() {
        XCTAssertEqual(calculator.subtract(3, 1), 2)
    }

    func test_multiple() {
        XCTAssertEqual(calculator.multiple(2, 3), 6)
    }

    func test_division() {
        XCTAssertEqual(calculator.division(6, 2), 3)
    }

//    func test_download_error() {
//        let download = Download()
//
//        XCTAssertThrowsError(try download.downloadContent()) { (error: Error) -> Void in // throwされたエラー
//            XCTAssertEqual(error as? DownloadError, DownloadError.connectionError)
//        }
//    }

    func test_system_error() {
        let download = Download()

        XCTAssertThrowsError(try download.throwsSystemError()) { (error: Error) -> Void in
            guard let systemError = error as? SystemError else {
                XCTFail() // system errorじゃなかったら失敗
                return
            }

            XCTAssertEqual(systemError.message, "memory access error")
        }
    }

    func error_message_sample() {
        XCTAssertEqual(calculator.add(1, 2), 4)
        // >XCTAssertEqual failed:("3")isnotequalto("4")

        XCTAssertEqual(calculator.add(1, 2), 4, "1 + 2 = 3 であること")
        // XCTAssertEqual failed:("3")isnotequalto("4")1+2=3であること
    }

    func assertEmpty(_ string: String, file: StaticString = #file, line: UInt = #line) {
        XCTAssertTrue(string.isEmpty, "\"\(string)\" is not empty", file: file, line: line)
    }

    func test_safe_division() {
        XCTContext.runActivity(named: "通常の割り算") { _ in
            XCTAssertEqual(calculator.safeDivision(6, 3), 2)
            XCTAssertEqual(calculator.safeDivision(6, 2), 3)
        }

        XCTContext.runActivity(named: "0助産") { _ in
            XCTAssertNil(calculator.safeDivision(6, 0))
        }
    }
}
