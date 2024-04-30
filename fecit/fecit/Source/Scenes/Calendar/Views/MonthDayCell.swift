//
//  MonthDayCell.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct MonthDayCellView: View {
    let day: Day
    let events: [Event]?

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(day.isCurrent ? Color("SelectedGray") : .clear)
                .cornerRadius(0)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(
                            Color.clear,
                            lineWidth: 0
                        )
                )
            VStack {
                Text("\(day.number)")
                    .font(.system(size: 14))
                    .frame(width: 25, height: 25)
                    .background(day.isSelected ? Color("MainBlue") : Color.clear)
                    .cornerRadius(20)

                if let events = events {
                    ForEach(events, id: \.id) { event in
                        Text(event.title)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .font(.system(size: 8, weight: .bold, design: .default))
                            .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                            .background(event.color.opacity(0.75))
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
