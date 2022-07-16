//
//  Todo.swift
//  Todo
//
//  Created by 出口楓真 on 2022/07/04.
//

import Foundation
import UIKit

struct Todo{
    var name: String // タスク名
    var deadline: Date // 期日
//    var category: String 
    var description: String // 詳細
    
    class DateUtils {
        class func dateFromString(string: String, format: String) -> Date {
            let formatter: DateFormatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = format
            return formatter.date(from: string)!
        }

        class func stringFromDate(date: Date, format: String) -> String {
            let formatter: DateFormatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = format
            return formatter.string(from: date)
        }
    }
}


