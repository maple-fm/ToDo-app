//
//  NewCreateModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/07/30.
//

import Foundation

// セーブするロジックを書く
struct NewCreateModel {

    var name: String? // タスク名
    var deadline: String? // 期日
    var category: Int? // カテゴリー
    var description: String? // 詳細

    var canCreate: Bool {
        return false
    }

    var taskList: [Todo] = []

    mutating func createTodo(todo: Todo) -> [Todo]{
        // Todoを作成して、保存する

//
//        var taskList: [Todo] = []

        let task: Todo = todo
        taskList.append(task)

//        var taskList: [Todo] = []
//
//        for num in 0...30 {
//            let task: Todo = todo
//            taskList.append(task)
//
//        }

        print("todoを作成しました")
        print(taskList)
        return taskList


    }
}
