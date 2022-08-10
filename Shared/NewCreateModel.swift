//
//  NewCreateModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/07/30.
//

import Foundation

// セーブするロジックを書く
struct NewCreateModel: Codable {

    var name: String? // タスク名
    var deadline: Date? // 期日
    var category: Int? // カテゴリー
    var description: String? // 詳細

    var canCreate: Bool {
        guard
            let name = name,
            let description = description
        else { return false }

        let isValidName = !name.isEmpty && name.count <= 20
        let isValidDescription = !description.isEmpty

        return isValidName && isValidDescription
    }

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
}
