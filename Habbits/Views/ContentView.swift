//
//  ContentView.swift
//  Habbits
//
//  Created by Mihai Leonte on 11/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habbits = Habbits()
    @State var isPresentedAddSheet = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(self.habbits.items) { item in

                    NavigationLink(destination: HabbitDescription(habbit: item)) {
                        HStack {
                            Text(item.title)
                            Spacer()
                            // TODO: this won't update automatically when edited inside the HabbitDescripton() view
                            Text("\(item.completions)")
                        }
                    }

                }
            }
            .navigationBarTitle("Habbits")
            .navigationBarItems(trailing:
                Button("Add") { self.isPresentedAddSheet = true })
            .sheet(isPresented: $isPresentedAddSheet) {
                AddHabbit(habbits: self.habbits)
            }
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
