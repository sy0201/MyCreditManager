//
//  MenuType.swift
//  MyCreditManager_0515
//
//  Created by siyeon park on 2023/05/15.
//

import Foundation

enum MenuType {
    case addStudent
    case removeStudent
    case addGrade
    case deleteGrade
    case average
    case end

    var code: String {
        switch self {
        case .addStudent:
            return "1"
        case .removeStudent:
            return "2"
        case .addGrade:
            return "3"
        case .deleteGrade:
            return "4"
        case .average:
            return "5"
        case .end:
            return "X"
        }
    }
}
