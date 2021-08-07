//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Mahesh sai on 06/08/21.
//

import SwiftUI
enum Tab: String, Codable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case firstTab
    case secondTab
    case thirdTab
}
class TabStateHandler: ObservableObject {
    @Published var tabSelected: Tab = .secondTab {
        didSet {
            if oldValue == tabSelected && tabSelected == .firstTab {
                moveFirstTabToTop.toggle()
            }
        }
    }
    @Published var moveFirstTabToTop: Bool = false
    
}
struct ContentView: View {
    @StateObject var tabStateHandler: TabStateHandler = TabStateHandler()
    var body: some View {
        TabView(selection: $tabStateHandler.tabSelected) {
            FirstTabView(moveToTopIndicator: $tabStateHandler.moveFirstTabToTop)
                .tabItem {
                    Image(systemName: "01.square.fill")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text(Tab.firstTab.rawValue)
                }.tag(Tab.firstTab)
            Text("second tab")
                .tabItem {
                    Image(systemName: "02.square.fill")
                    Text(Tab.secondTab.rawValue)

                }.tag(Tab.secondTab)
            Text("third tab")
                .tabItem {
                    Image(systemName: "03.square.fill")
                    Text(Tab.thirdTab.rawValue)
                }.tag(Tab.thirdTab)
        }
     
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
