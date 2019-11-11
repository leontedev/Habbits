//
//  AddHabbit.swift
//  Habbits
//
//  Created by Mihai Leonte on 11/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct AddHabbit: View {
    @ObservedObject var habbits: Habbits
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habbit Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.habbits.items.append(Habbit(title: self.name,
                                          description: self.description))
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                }
            )
            .navigationBarTitle("Add Habbit")
        }
    }
}

//struct AddHabbit_Previews: PreviewProvider {
//    static var previews: some View {
//        AddHabbit()
//    }
//}
