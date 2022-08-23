//
//  HomeModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/08/10.
//

import Foundation
import RealmSwift

struct HomeModel {
    var tasks: [Todo] = []
    let dateFormatter = DateFormatter()
    let realm = try! Realm()

    init() {
        updateTodo()
    }

    mutating func updateTodo() {
        tasks = Array(realm.objects(Todo.self))
    }

    func toString(deadline:Date) -> String{
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: deadline)
    }

    func deleteTodo() {
        
    }
}
