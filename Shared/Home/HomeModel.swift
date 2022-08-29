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
        tasks = Array(realm.objects(Todo.self).sorted(byKeyPath: "deadline"))
    }

    func toString(deadline:Date) -> String{
        dateFormatter.dateFormat = "M月dd日(\(getWeekDay(date:deadline)))"
        return dateFormatter.string(from: deadline)
    }

    func getWeekDay(date: Date) -> String {
        var weekDay = Calendar.current.component(.weekday, from: date)
        if weekDay - 1 == 0 {
            weekDay = 7
        }else {
            weekDay -= 1
        }
        // 曜日がひとつずれるのを治したい
        switch weekDay {
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

    func countDown(date:Date) -> String{
        let date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
        let dateFormatter = DateComponentsFormatter()
        let today = Date.now
        dateFormatter.unitsStyle = .full
        dateFormatter.allowedUnits = [.year, .month, .day]
        let intervalTime = date.timeIntervalSince(today)
        let deadline = dateFormatter.string(from: intervalTime)
        return deadline!
    }
}
