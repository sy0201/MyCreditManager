//
//  Student.swift
//  MyCreditManager_0515
//
//  Created by siyeon park on 2023/05/15.
//

import Foundation

struct Student {
    var name: String?
    var score: [Score]
}

struct Score {
    var subject: String?
    var grade: Double?
}
