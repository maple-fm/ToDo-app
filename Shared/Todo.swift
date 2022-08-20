//
//  Todo.swift
//  Todo
//
//  Created by 出口楓真 on 2022/07/04.
//

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted var name: String // タスク名
    @Persisted var deadline: Date // 期日
    @Persisted var category: Category // カテゴリー
    @Persisted var memo: String // 詳細

    // イニシャライザを設定するとクラッシュが起きる
    init(name: String, deadline: Date, category: Category, memo: String) {
        self.name = name
        self.deadline = deadline
        self.category = category
        self.memo = memo
    }

    convenience override init() {
        self.init(name: "", deadline: Date.now, category: .others, memo: "")
    }
}


enum Category: String, CaseIterable, PersistableEnum {
    case work = "仕事"
    case hobby = "遊び"
    case study = "勉強"
    case others = "その他"
}
