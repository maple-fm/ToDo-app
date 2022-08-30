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
    let calendar = Calendar(identifier: .gregorian)
    let realm = try! Realm()

    init() {
        updateTodo()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
    }

    mutating func updateTodo() {
        tasks = Array(realm.objects(Todo.self).sorted(byKeyPath: "deadline"))
    }

    func toString(deadline:Date) -> String{
        dateFormatter.dateFormat = "M月dd日(\(getWeekDay(date:deadline)))"
        return dateFormatter.string(from: deadline)
    }

    func getWeekDay(date: Date) -> String {
        let jpTime = dateFormatter.string(from: date)
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
        let dateFormatter = DateComponentsFormatter()
        let today = Date()
        let year = calendar.component(.year, from: today)
        let month = calendar.component(.month, from: today)
        let day = calendar.component(.day, from: today)
        let endOfToday = calendar.date(from: DateComponents(year: year, month: month, day:day, hour: 23, minute: 59, second: 59))
        let intervalTime = date.timeIntervalSince(endOfToday!)/24/60/60
        let deadline = dateFormatter.string(from: intervalTime)
        return deadline!
    }
}
