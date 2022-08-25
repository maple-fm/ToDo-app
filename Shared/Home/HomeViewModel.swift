//
//  HomeViewModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/08/16.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    private var homeModel = HomeModel()
//    @Published private(set) var isChecked = false
    @Published private(set) var tasks: [Todo] = []

    init() {
        tasks = homeModel.tasks
    }

    func dismissActionSheet() {
        homeModel.updateTodo()
        tasks = homeModel.tasks
    }

    func changeString(deadline:Date) -> String {
        return homeModel.toString(deadline: deadline)
    }

    func clickCheckButton(task: Todo) {
        homeModel.isChecked(task: task)

    }

    
}
