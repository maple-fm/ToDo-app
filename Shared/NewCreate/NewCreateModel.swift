//
//  NewCreateModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/07/30.
//

import Foundation
import RealmSwift
import Combine

// セーブするロジックを書く
struct NewCreateModel {

    var name: String? // タスク名
    var deadline: Date? // 期日
    var category: Category? // カテゴリー
    var description: String? // 詳細
    let canCreate = PassthroughSubject<Bool, Never>()

    mutating func createTodo() {
        // Todoを作成して、保存する
        guard
            let name = name,
            let description = description
        else { return print("error")}

//        let task = Todo()
//        task.name = name
//        task.deadline = deadline ?? Date.now
//        task.category = category ?? .others
//        task.memo = description

        let task = Todo(name: name, deadline: deadline ?? Date.now, category: category ?? .others, memo: description)

        print("todoを作成しました")
        print(task)

        // データを永続化する
//        var config = Realm.Configuration().self
//        config.deleteRealmIfMigrationNeeded = true
        let realm = try! Realm()
        try! realm.write {
            realm.add(task)
        }

        let taskList = realm.objects(Todo.self)
//        print(taskList)
    }

    mutating func validation() {
        guard
            let name = name,
            let description = description
        else { return }

        let isValidName = !name.isEmpty && name.count <= 20
        let isValidDescription = !description.isEmpty

        let canCreate = isValidName && isValidDescription
        self.canCreate.send(canCreate)
    }
}
