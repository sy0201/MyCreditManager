//
//  main.swift
//  MyCreditManager_0515
//
//  Created by siyeon park on 2023/05/15.
//

import Foundation

var studentList = [Student]()
let gradeValue: [String:Float] = [
    "A+" : 4.5,
    "A"  : 4,
    "B+" : 3.5,
    "B"  : 3,
    "C+" : 2.5,
    "C"  : 2,
    "D+" : 1.5,
    "D"  : 1,
    "F"  : 0
]

func creditManager() {
    print("원하는 기능을 입력해주세요.")

    let inputText = readLine()

    guard let inputText = inputText else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }

    switch inputText as? String {
    case MenuType.addStudent.code:
        print("추가할 학생의 이름을 입력해주세요.")
        addStudent()
        break
    case MenuType.removeStudent.code:
        print("삭제할 학생의 이름을 입력해주세요.")
        removeStudent()
        break
    case MenuType.addGrade.code:
        print("입력예시: 학생이름(Mickey) 과목(Swift) 성적(A+,A,F)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        addGrade()
    case MenuType.deleteGrade.code:
        print("추가할 학생의 이름을 입력해주세요.")
        deleteGrade()
    default:
        break
    }
}

creditManager()

// 1. 학생추가
func addStudent() {
    let name = readLine()

    guard let name = name,!name.isEmpty else { return }

    if studentList.contains(where: { $0.name == name }) {
        return
    }

    var student = Student()
    student.name = name
    studentList.append(student)

    print("\(name) 학생을 추가했습니다.")
}

// 2. 학생삭제
func removeStudent() {
    let name = readLine()

    guard let name = name,!name.isEmpty else { return }

    if studentList.contains(where: { $0.name != name }) { return }
}

// 3. 성적추가
func addGrade() {
    let inputText = readLine()

    guard let inputText = inputText,!inputText.isEmpty else { return }

    let splitedInputText = inputText.split(separator: " ")

    if splitedInputText.count != 3 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }

    let name = splitedInputText[0]
    let scoreName = splitedInputText[1]
    let score = splitedInputText[2]
    print(name, scoreName, score)
}

// 4. 성적삭제
func deleteGrade() {
    let inputText = readLine()

    guard let inputText = inputText,!inputText.isEmpty else {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        return
    }

    if let inputArr = readLine()?.split(separator: " "), inputArr.count == 2,
       let name = inputArr.first,
       let subject = inputArr.last {

        if let index = studentList.firstIndex(where: {
            $0.name ?? "" == name }) {
//            gradeValue.contains(where: { $0.key == score })
        }
    }
}

// 5. 평점보기
func average() {

}


func factorial(_ num: Int) -> Int {
    var result = 1
    for n in 2...num {
        result *= n
    }
    return result
}

print(factorial(3))
print(factorial(5))
