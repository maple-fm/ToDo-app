//
//  HomeModel.swift
//  Todo (iOS)
//
//  Created by 出口楓真 on 2022/08/10.
//

import Foundation
import RealmSwift

struct HomeModel {
    var tasks: [Todo] = []
    let dateFormatter = DateFormatter()
    let realm = try! Realm()

    init() {
        updateTodo()
    }

    mutating func updateTodo() {
        tasks = Array(realm.objects(Todo.self))
    }

    func toString(deadline:Date) -> String{
        dateFormatter.dateFormat = "M月dd日(\(getWeekDay(date:deadline)))"
        return dateFormatter.string(from: deadline)
    }

    func getWeekDay(date: Date) -> String {
        let weekDay = Calendar.current.component(.weekday, from: date)

        // 曜日がひとつずれる
        switch weekDay-1 {
        case 1:
            return "月"
        case 2:
            return "火"
        case 3:
            return "水"
        case 4:
            return "木"
        case 5:
            return "金"
        case 6:
            return "土"
        case 7:
            return "日"
        default:
            return "曜日を取得できませんでした"
        }
    }

    func isChecked(task: Todo){
        try! realm.write {
            task.done.toggle()
        }
    }
}
