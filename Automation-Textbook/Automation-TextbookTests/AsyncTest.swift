//
//  AsyncTest.swift
//  Calc-iosTestTextTests
//
//  Created by kazunori.aoki on 2022/01/31.
//

import XCTest
@testable import Automation_Textbook

class AsyncTest: XCTestCase {

    var asyncClass: AsyncClass!

    override func setUp() {
        super.setUp()
        asyncClass = AsyncClass()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_echo() {
        // 待機
        let exp = expectation(description: "wait for finish")

        asyncClass.echo(message: "Hello") { message in
            XCTAssertEqual(message, "Hello!")

            exp.fulfill()
        }

        // タイムアウト設定
        wait(for: [exp], timeout: 5)
    }
}
