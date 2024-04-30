//
//  CalendarGridView.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct CalendarGridView: View {
    let weeks: [Week]
    let informations: [YearMonthDay: [(String, Color)]]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(weeks, content: { week in
                WeekView(week: week, informations: informations,totalWeeksCount: weeks.count)
            })
        }
    }
}

struct WeekView: View {
    let week: Week
    let informations: [YearMonthDay: [(String, Color)]]
    let totalWeeksCount: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(week.days.indices) { index in
                let day = week.days[index]
                let isFirstDay = index == 0
                let isLastDay = index == week.days.count - 1

                MonthDayCellView(day: day, informations: informations)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height / CGFloat(totalWeeksCount))
                    .foregroundColor(isFirstDay ? .red : (isLastDay ? .blue : .black))
            }
        }
    }
}
