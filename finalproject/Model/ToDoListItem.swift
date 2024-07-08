//
//  ToDoListItem.swift
//  finalproject
//
//  Created by Marc Atienza on 7/5/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "title": title,
            "dueDate": dueDate,
            "createdDate": createdDate,
            "isDone": isDone
        ]
    }
}

