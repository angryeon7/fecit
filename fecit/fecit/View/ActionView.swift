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
        }
    }

    public init(viewModel: CalendarViewModel) {
        self.viewModel = viewModel
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
