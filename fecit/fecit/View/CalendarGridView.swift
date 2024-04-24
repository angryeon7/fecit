//
//  CalendarGridView.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct CalendarGridView: View {
    @Binding var currentDate: Date
    private let weekdays = 7

    var body: some View {
        let daysOfMonth = numberOfDays()
        let firstWeekDay = firstWeekdayOfMonth(in: currentDate)

        LazyVGrid(columns: Array(repeating: GridItem(), count: weekdays), spacing: 0, content: {
            ForEach(0 ..< daysOfMonth + firstWeekDay, id: \.self) { index in
                let isBeforeFirstWeekDay = index < firstWeekDay
                
                if isBeforeFirstWeekDay {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.clear)
                } else {
                    MonthDayCellView(day: index - firstWeekDay + 1)
                        .frame(height: UIScreen.main.bounds.height / CGFloat(weekdays))
                }
            }
        })
    }

    func numberOfDays() -> Int {
        return Calendar.current.range(of: .day, in: .month, for: currentDate)?.count ?? 0
    }

    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!

        return Calendar.current.component(.weekday, from: firstDayOfMonth) - 1
    }
}

#Preview() {
    CalendarGridView(currentDate: .constant(Date()))
}

