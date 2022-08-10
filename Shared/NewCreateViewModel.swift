//
//  NewCreateViewModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/07/27.
//

import Foundation
import Combine
import SwiftUI

class NewCreateViewModel: ObservableObject {
    private var model: NewCreateModel = NewCreateModel()
    @Published var name: String{
        didSet {
            model.name = name
            canCreate = model.canCreate
        }
    } // タスク名
    @Published var deadline: Date {
        didSet {
            model.deadline = deadline
        }
    } // 期日
    @Published var category: Int {
        didSet {
            model.category = category
        }
    } // カテゴリー
    @Published var description: String {
        didSet {
            model.description = description
            canCreate = model.canCreate
        }
    } // 詳細

    @Published var canCreate: Bool = false
    @Published private(set) var todoList: [Todo] = []

    init() {
        self.name = ""
        self.deadline = Date.now
        self.category = 0
        self.description = ""
    }


    func clickButton(){

        let todo = Todo(name: self.name, deadline: self.deadline, category: self.category, description: self.description)
        let task = model.createTodo(todo: todo)

        self.todoList.append(contentsOf: task)
    }
}

extension Array {
    subscript (safe index: Index) -> Element? {
        //indexが配列内なら要素を返し、配列外ならnilを返す（三項演算子）
        return indices.contains(index) ? self[index] : nil
    }
}
