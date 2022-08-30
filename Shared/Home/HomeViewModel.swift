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
    private var homeModel = HomeModel() {
        didSet {
            tasks = homeModel.tasks
        }
    }
    @Published private(set) var tasks: [Todo] = []

    init() {
        tasks = homeModel.tasks
    }

    func redraw() {
        homeModel.updateTodo()

    }

    func dismissActionSheet() {
        redraw()
    }

    func changeString(deadline:Date) -> String {
        return homeModel.toString(deadline: deadline)
    }

    func clickCheckButton(task: Todo) {
        homeModel.isChecked(task: task)
        redraw()
    }

    func comparisonDate(deadline: Date) -> String {
        let countdown = homeModel.countDown(date: deadline)
        return countdown
    }

}
