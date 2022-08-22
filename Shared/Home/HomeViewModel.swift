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
    //    @Published var name = ""
//    @Published var deadline = Date.now
//    @Published var category = Category.others
//    @Published var description = ""
    @Published private(set) var tasks: [Todo] = []

    init() {
        getTodo()

    }

    func getTodo() {
        homeModel.getTodo()
        tasks = homeModel.tasks
    }

    func changeString(deadline:Date) -> String {
        return homeModel.toString(deadline: deadline)
    }

    
}
