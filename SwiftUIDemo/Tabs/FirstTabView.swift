//
//  FirstTabView.swift
//  SwiftUIDemo
//
//  Created by Mahesh sai on 06/08/21.
//

import SwiftUI



struct FirstTabView: View {
    let items = (0..<40)
    @Binding var moveToTopIndicator: Bool
    var body: some View {
        ScrollViewReader(content: { proxy in
            
            
            List {
//                Text(String(moveToTopIndicator))
//                    .id("Header")
                Section(header: header().id("Header")) {
                    ForEach(items,id: \.self) {(item) in
                        Text("Item is \(item)")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .onChange(of: moveToTopIndicator, perform: { _ in
                print("c")
                proxy.scrollTo("Header")
            })
        })
    }
    func header() -> some View {
        HStack {
            Text("Header")
                .bold()
                
            Spacer()
        }.padding([.top,.bottom])
//        .background(Color.green)
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView(moveToTopIndicator: .constant(false))
    }
}
