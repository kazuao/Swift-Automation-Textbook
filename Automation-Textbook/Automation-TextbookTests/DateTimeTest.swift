//
//  DateTimeTest.swift
//  Calc-iosTestTextTests
//
//  Created by kazunori.aoki on 2022/01/31.
//

import XCTest
@testable import Automation_Textbook

struct MockDateProtocol: DateProtocol {
    var date: Date?

    func now() -> Date {
        return date!
    }
}

class DateTimeTest: XCTestCase {

    var dateTime: DateTime!

    override func setUp() {
        super.setUp()
        dateTime = DateTime()
    }

    func test_holiday_good() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"

        var date: Date!

        // 日曜日
        date = formatter.date(from: "2019/01/06")
        XCTAssertTrue(dateTime.isHoliday(date))

        // 月曜日
        date = formatter.date(from: "2019/01/07")
        XCTAssertFalse(dateTime.isHoliday(date))

        // 金曜日
        date = formatter.date(from: "2019/01/11")
        XCTAssertFalse(dateTime.isHoliday(date))

        // 土曜日
        date = formatter.date(from: "2019/01/12")
        XCTAssertTrue(dateTime.isHoliday(date))
    }

    func test_holiday_good_protocol() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"

        var mock = MockDateProtocol()

        // 日曜日
        mock.date = formatter.date(from: "2019/01/06")
        XCTAssertTrue(CalendarUtil(dateProtocol: mock).isHoliday())

        // 月曜日
        mock.date = formatter.date(from: "2019/01/07")
        XCTAssertFalse(CalendarUtil(dateProtocol: mock).isHoliday())

        // 金曜日
        mock.date = formatter.date(from: "2019/01/11")
        XCTAssertFalse(CalendarUtil(dateProtocol: mock).isHoliday())

        // 土曜日
        mock.date = formatter.date(from: "2019/01/12")
        XCTAssertTrue(CalendarUtil(dateProtocol: mock).isHoliday())
    }
}
