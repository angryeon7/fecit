//
//  MonthDayCell.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct MonthDayCellView: View {
    let day: Day
    let informations: [YearMonthDay: [(String, Color)]]

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(day.isCurrent ? Color("SelectedGray") : .clear)
                .cornerRadius(0)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(
                            day.isSelected ? Color.blue : Color.clear,
                            lineWidth: day.isSelected ? 1 : 0
                        )
                )
            VStack {
                Text("\(day.number)")
                    .font(.system(size: 14))
                    .padding(.top, 5)

                if let dayInformations = informations[day.yearMonthDay] {
                    ForEach(dayInformations, id: \.0) { info, color in
                        Text(info)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .font(.system(size: 8, weight: .bold, design: .default))
                            .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                            .background(color.opacity(0.75))
                            .cornerRadius(4)
                    }
                }
                Spacer()
            }
        }
        .background(Color.clear)
        .opacity(day.isEnabled ? 1 : 0.25)
        .onTapGesture(perform: day.onSelect)
    }
}
