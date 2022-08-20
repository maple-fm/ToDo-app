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
    mutating func getTodo() {
        let realm = try! Realm()

        tasks = Array(realm.objects(Todo.self))
//        let task = tasks[index]
//        let todo = Todo(name: task.name, deadline: task.deadline, category: task.category, memo: task.memo)

        print(tasks)
//        return tasks
    }
}
