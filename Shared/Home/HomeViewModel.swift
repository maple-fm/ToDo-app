//
//  HomeViewModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/08/16.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published private(set) var homeModel = HomeModel()
    //    @Published var name = ""
//    @Published var deadline = Date.now
//    @Published var category = Category.others
//    @Published var description = ""
    @Published private(set) var tasks: [Todo] = []

    init() {
        homeModel.getTodo()
        tasks = homeModel.tasks

    }

    
}
