//
//  TodoApp.swift
//  Shared
//
//  Created by 出口楓真 on 2022/06/09.
//

import SwiftUI

@main
struct TodoApp: App {
    init() {
            let coloredNavAppearance = UINavigationBarAppearance()
            coloredNavAppearance.configureWithOpaqueBackground()
            coloredNavAppearance.backgroundColor = UIColor.init(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
            UINavigationBar.appearance().standardAppearance = coloredNavAppearance
//            UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

// マイグレーションの記述はここ
