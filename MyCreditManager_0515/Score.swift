//
//  File.swift
//  MyCreditManager_0515
//
//  Created by siyeon park on 2023/05/15.
//

import Foundation

enum Score {
    case Aplus,A
    case Bplus,B
    case Cplus,C
    case Dplus,D
    case F

    var value: String {
        switch self {
        case .Aplus:
            return "A+"
        case .A:
            return "A"
        case .Bplus:
            return "B+"
        case .B:
            return "B"
        case .Cplus:
            return "C+"
        case .C:
            return "C"
        case .Dplus:
            return "D+"
        case .D:
            return "D"
        case .F:
            return "F"
        }
    }
}
