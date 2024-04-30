//
//  CalendarGridView.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct CalendarGridView: View {
    let weeks: [Week]
    let events: [YearMonthDay: [Event]]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(weeks, content: { week in
                WeekView(week: week, events: events[week.days.first?.yearMonthDay ?? YearMonthDay.current], totalWeeksCount: weeks.count)
            })
        }
    }
}

struct WeekView: View {
    let week: Week
    let events: [Event]?
    let totalWeeksCount: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(week.days.indices) { index in
                let day = week.days[index]
                let isFirstDay = index == 0
                let isLastDay = index == week.days.count - 1

                MonthDayCellView(day: day, events: events?.filter { $0.date == day.yearMonthDay })
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height / CGFloat(totalWeeksCount))
                    .foregroundColor(isFirstDay ? .red : (isLastDay ? .blue : .black))
            }
        }
    }
}
