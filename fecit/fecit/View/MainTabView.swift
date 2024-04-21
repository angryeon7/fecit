//
//  MainTabView.swift
//  fecit
//
//  Created by nayeon  on 4/18/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 2
    
    init() {
      UITabBar.appearance().scrollEdgeAppearance = .init()
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MemoView()
                .tabItem {
                    Image(systemName: "sparkle")
                    Text("Achieve")
                }
                .tag(0)
            ActionView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Action")
                }
                .tag(1)
            MemoView()
                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("Memo")
                }
                .tag(2)
            MemoView()
                .tabItem {
                    Image(systemName: "archivebox")
                    Text("Library")
                }
                .tag(3)
            ActionView()
                .tabItem {
                    Image(systemName: "square.split.2x2")
                    Text("Achieve")
                }
                .tag(4)
        }
        .font(.headline)
        .accentColor(.blue)
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

enum TapType {
    case memo
    case action
}

#Preview {
    MainTabView()
}

