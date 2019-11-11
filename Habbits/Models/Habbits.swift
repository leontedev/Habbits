//
//  Habbits.swift
//  Habbits
//
//  Created by Mihai Leonte on 11/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import Foundation

class Habbits: ObservableObject {
    @Published var items = [Habbit]() {
        didSet {
             let encoder = JSONEncoder()
             if let data = try? encoder.encode(items) {
                 UserDefaults.standard.set(data, forKey: "HabbitItems")
             }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "HabbitItems") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Habbit].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
}

class Habbit: ObservableObject, Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    @Published var completions: Int
    
    init(title: String, description: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.completions = 0
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case completions
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try values.decode(UUID.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        self.description = try values.decode(String.self, forKey: .description)
        self.completions = try values.decode(Int.self, forKey: .completions)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(completions, forKey: .completions)
    }
}
