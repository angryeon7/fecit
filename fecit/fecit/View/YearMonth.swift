//
//  struct.swift
//  fecit
//
//  Created by nayeon  on 4/29/24.
//

import Foundation

struct YearMonthDay: Hashable, Comparable {
    var year: Int
    var month: Int
    var day: Int

    static var current: YearMonthDay {
        let today = Date()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: today)
        return YearMonthDay(year: components.year ?? 0, month: components.month ?? 0, day: components.day ?? 0)
    }

    func addDay(value: Int) -> YearMonthDay {
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = value
        if let date = calendar.date(byAdding: components, to: self.date) {
            let newComponents = calendar.dateComponents([.year, .month, .day], from: date)
            return YearMonthDay(year: newComponents.year ?? 0, month: newComponents.month ?? 0, day: newComponents.day ?? 0)
        } else {
            return self
        }
    }

    var date: Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return calendar.date(from: components) ?? Date()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(day)
    }

    static func == (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }

    static func < (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else {
            return lhs.day < rhs.day
        }
    }
}
