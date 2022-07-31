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
    @Published var model: NewCreateModel = NewCreateModel()    
    @Published var name: String // タスク名
    @Published var deadline: String // 期日
    @Published var category: Int // カテゴリー
    @Published var description: String // 詳細

    @Published var canCreate: Bool = false

    init() {
        self.name = ""
        self.deadline = ""
        self.category = 0
        self.description = ""

        let nameValidation = $name.map({ !$0.isEmpty && $0.utf16.count <= 20}).eraseToAnyPublisher()
        let deadlineValidation = $deadline.map({ !$0.isEmpty }).eraseToAnyPublisher()
        let descriptionValidation = $description.map({ !$0.isEmpty }).eraseToAnyPublisher()

        Publishers.CombineLatest3(nameValidation, deadlineValidation, descriptionValidation)
                    .map({ [$0.0, $0.1, $0.2] }) //3つの条件(bool)を１つの配列にまとめます
                    .map({ $0.allSatisfy{ $0 } }) //配列になった3つの条件(bool)が全てtrueの時に、結果がtrueとなります
                    .assign(to: &$canCreate) //結果をcanCreateに格納します。

    }

    func clickButton() {
//        todo.name = self.name
//        todo.deadline = self.deadline
//        todo.category = self.category
//        todo.description = self.description
        let todo = Todo(name: self.name, deadline: self.deadline, category: self.category, description: self.description)
        print("タスク名: \(self.name)")
        print("期日: \(self.deadline)")
        print("カテゴリー: \(self.category)")
        print("詳細: \(self.description)")

        let task = model.createTodo(todo: todo)

        if task[safe: 1] == nil {
            print("タスクが存在しません")
        } else {
            print(task[1].name)
        }
    }
    

}

extension Array {
    subscript (safe index: Index) -> Element? {
        //indexが配列内なら要素を返し、配列外ならnilを返す（三項演算子）
        return indices.contains(index) ? self[index] : nil
    }
}
