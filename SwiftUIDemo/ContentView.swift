//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Mahesh sai on 06/08/21.
//

import SwiftUI
enum Tab: String, Codable {
    case firstTab
    case secondTab
    case thirdTab
}
class TabStateHandler: ObservableObject {
    @Published var tabSelected: Tab = .secondTab
    @Published var selected = 1
    {
        didSet {
            print(oldValue)
            if oldValue == selected && selected == 1 {
                moveFirstTabToTop.toggle()
            }
        }
    }
    @Published var moveFirstTabToTop: Bool = false
    
}
struct ContentView: View {
 
    @StateObject var tabStateHandler: TabStateHandler = TabStateHandler()
    @State var selected = Tab.firstTab
    var body: some View {
        TabView(selection: $tabStateHandler.selected) {
            FirstTabView(moveToTopIndicator: $tabStateHandler.moveFirstTabToTop)
                .tabItem {
                    Image(systemName: "01.square.fill")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text(Tab.firstTab.rawValue)
                }.tag(1)
            Text("2 tab")
                .tabItem {
                    Image(systemName: "02.square.fill")
                    Text(Tab.secondTab.rawValue)

                }.tag(2)
            Text("3 tab")
                .tabItem {
                    Image(systemName: "03.square.fill")
                    Text(Tab.thirdTab.rawValue)

                }.tag(3)
        }
//        .onChange(of: tabSelected, perform: { [tabSelected] value in
//            print(value)
//            moveFirstTabToTop.toggle()
//            print(tabSelected)
//            if tabSelected == value && value == .firstTab {
//                moveFirstTabToTop.toggle()
//            }
//        })
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
