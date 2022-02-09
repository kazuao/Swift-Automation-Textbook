//
//  DateTime.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/01/31.
//

import Foundation

class DateTime {

    /// 休日判定
    /// - Returns: is休日
    func isHoliday(_ date: Date = Date()) -> Bool {

        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)

        return weekday == 1 || weekday == 7
    }
}

protocol DateProtocol {
    func now() -> Date
}

class DateDefault: DateProtocol {
    func now() -> Date {
        return Date()
    }
}

class CalendarUtil {
    let dateProtocol: DateProtocol

    init(dateProtocol: DateProtocol = DateDefault()) {
        self.dateProtocol = dateProtocol
    }

    func isHoliday() -> Bool {

        let now = dateProtocol.now()

        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: now)

        return weekday == 1 || weekday == 7
    }
}
