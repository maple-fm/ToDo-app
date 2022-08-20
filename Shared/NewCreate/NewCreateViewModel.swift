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
    private var model = NewCreateModel() {
        didSet {
            model.validation()
        }
    }
    // タスク名
    @Published var name = "" {
        didSet {
            model.name = name
        }
    }
    // 期日
    @Published var deadline = Date.now {
        didSet {
            model.deadline = deadline
        }
    }
    // カテゴリー
    @Published var category: Category = .others {
        didSet {
            model.category = category
        }
    }
    // 詳細
    @Published var description = "" {
        didSet {
            model.description = description
        }
    }

    @Published private(set) var canCreate = false

    init() {
        model.canCreate.assign(to: &$canCreate)
    }

    func clickButton(){
        model.createTodo()
    }
}
