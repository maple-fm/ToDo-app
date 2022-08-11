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
    var category: Int? // カテゴリー
    var description: String? // 詳細

    let canCreate = PassthroughSubject<Bool, Never>()

    var taskList: [Todo] = []

    mutating func createTodo(todo: Todo) -> [Todo]{
        // Todoを作成して、保存する

        let task: Todo = todo
        taskList.append(task)

        print("todoを作成しました")
        print(taskList)

        // データを永続化する

        return taskList
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
