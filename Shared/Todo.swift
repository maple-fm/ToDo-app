//
//  Todo.swift
//  Todo
//
//  Created by 出口楓真 on 2022/07/04.
//

import Foundation

struct Todo{
    var name: String // タスク名
    var deadline: String // 期日
    var category: Int // カテゴリー
    var description: String // 詳細

    init(name: String = "", deadline: String = "", category: Int = 0, description: String = "") {
        self.name = name
        self.deadline = deadline
        self.category = category
        self.description = description
    }

}


