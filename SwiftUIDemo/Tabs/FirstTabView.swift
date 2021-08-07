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
                Section(header: header().id("Header")) {
                    ForEach(items,id: \.self) {(item) in
                        Text("Item is \(item)")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .onChange(of: moveToTopIndicator, perform: { _ in
                withAnimation {
                    proxy.scrollTo("Header")
                }
            })
            
        })
    }
    func header() -> some View {
        HStack {
            Text("Header")
                .bold()
            Spacer()
        }.padding([.top,.bottom])
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView(moveToTopIndicator: .constant(false))
    }
}
