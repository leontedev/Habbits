//
//  HabbitDescription.swift
//  Habbits
//
//  Created by Mihai Leonte on 11/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct HabbitDescription: View {
    @ObservedObject var habbit: Habbit
    
    var body: some View {
        Form {
            Text(habbit.title)
                .font(.headline)
            Text(habbit.description)
            Stepper(value: $habbit.completions, in: 0...100) {
                Text("No of completions: \(habbit.completions)")
            }
        }
    }
}

//struct HabbitDescription_Previews: PreviewProvider {
//    static var previews: some View {
//        HabbitDescription()
//    }
//}
