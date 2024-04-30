//
//  ActionView.swift
//  fecit
//
//  Created by nayeon  on 4/18/24.
//

import SwiftUI

public struct ActionView: View {
    @ObservedObject public var viewModel: CalendarViewModel
    @State private var offsetY: CGFloat = 0
    
    var informations = [YearMonthDay: [(String, Color)]]()
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                VStack {
                    CalendarHeaderView(viewModel: viewModel)
                        .padding(10)
                    WeekdayView()
                }
                .background(Color("MainBlue"))
                
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            CalendarGridView(weeks: viewModel.current.weeks, informations: informations)
                                .frame(maxWidth: .infinity)
                                .animation(.default)
                                .id("MonthView")
                        }
                    }
                    .onAppear {
                        scrollViewProxy.scrollTo("MonthView", anchor: .top)
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let translation = value.translation.height
                                if offsetY <= 10 && translation > 20 {
                                    viewModel.previousPage()
                                } else if offsetY >= value.translation.height && translation < -20 {
                                    viewModel.nextPage()
                                }
                            }
                    )
                }
            }
            ScheduleCreationButton()
                .padding(.bottom, 10)
        }
    }

    public init(viewModel: CalendarViewModel) {
        self.viewModel = viewModel
        
        // 더미데이터
        var date = YearMonthDay.current
        informations[date] = []
        informations[date]?.append(("Hello", Color.orange))
        informations[date]?.append(("World", Color.blue))

        date = date.addDay(value: 3)
        informations[date] = []
        informations[date]?.append(("Test", Color.pink))
        
        date = date.addDay(value: 8)
        informations[date] = []
        informations[date]?.append(("Play", Color.green))
        
        date = date.addDay(value: 5)
        informations[date] = []
        informations[date]?.append(("Home", Color.red))

        date = date.addDay(value: -23)
        informations[date] = []
        informations[date]?.append(("Meet at 8", Color.purple))
        
        date = date.addDay(value: -5)
        informations[date] = []
        informations[date]?.append(("Home", Color.yellow))

        date = date.addDay(value: -10)
        informations[date] = []
        informations[date]?.append(("Baseball", Color.green))
    }
}

struct ScheduleCreationButton: View {
    var body: some View {
        Button(action: {
            // TODO: - 일정 만들기 로직 작성
        }) {
            HStack {
                Image(systemName: "square.and.pencil")
                Text("New Action")
                Image(systemName: "chevron.up")
                    .padding(.leading,15)
            }
            .foregroundColor(.white)
            .padding([.leading,.trailing],25)
            .padding([.top,.bottom],15)
            .background(Color("MainBlue"))
            .cornerRadius(25)
        }
    }
}


public struct ActionView_Previews: PreviewProvider {
    static public var previews: some View {
        let dayTimeInterval: TimeInterval = 24 * 60 * 60
        let viewModel = CalendarViewModel(heighlighted: [.init(timeIntervalSinceNow: dayTimeInterval)])
        return ActionView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
