//
//  main.swift
//  MyCreditManager_0515
//
//  Created by siyeon park on 2023/05/15.
//

import Foundation

var studentList = [Student]()
var dic: [String:[String:Double]] = [:]

func creditManager() {
    print("""
    원하는 기능을 입력해주세요.
    1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
    """)

    guard let inputText = readLine() else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }

    switch inputText {
    case MenuType.addStudent.code:
        print("추가할 학생의 이름을 입력해주세요.")
        addStudent()
        break
    case MenuType.removeStudent.code:
        print("삭제할 학생의 이름을 입력해주세요.")
        removeStudent()
        break
    case MenuType.addGrade.code:
        print("""
        입력예시: 학생이름(Mickey) 과목(Swift) 성적(A+,A,F)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예: Micky Swift F\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """)
        addGrade()
    case MenuType.deleteGrade.code:
        print("""
        성적을 삭제할 학생이름, 과목이름, 성적(A+,A,F)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예: Micky Swift F
        """)
        deleteGrade()
    case MenuType.average.code:
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        average()
    case MenuType.end.code:
        print("프로그램을 종료합니다...")
        end()
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해 주세요.")
    }
}

while(true) {
    creditManager()
}

// 1. 학생추가
func addStudent() {
    guard let name = readLine(),
          !name.isEmpty else { return }

    if studentList.contains(where: { $0.name == name }) {
        print("-->>\(studentList.contains(where: { $0.name == name }))")
        print("\(name)이 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {

        let student = Student(name: name, score: [])
        studentList.append(student)

        print("\(name) 학생을 추가했습니다.")
    }
}

// 2. 학생삭제
func removeStudent() {
    guard let name = readLine(),
          !name.isEmpty else { return }

    // 배열에서 입력된 name이 있는지 찾기
    let hasStudent = studentList.filter {
        return $0.name == name
    }
    
    if hasStudent.count == 0 {
        print("\(name)학생을 찾지 못했습니다.")
    } else {
        // 입력된 name 있으니 배열에서 삭제
        print("\(name)학생을 삭제하였습니다.")
        studentList = studentList.filter {
            return $0.name != name
        }
    }
}

// 3. 성적추가
func addGrade() {
    guard let inputText = readLine(),
          !inputText.isEmpty else { return }

    var splitedInputText = inputText.split(separator: " ")

    if splitedInputText.count != 3 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    print(splitedInputText)
    print(inputText)

    let name = String(splitedInputText[0])
    let subject = String(splitedInputText[1])
    let grade = String(splitedInputText[2])
    var gradeNum: Double = 0

    switch grade {
    case "A+":
        print(4.5)
        gradeNum = 4.5
    case "A":
        print(4)
        gradeNum = 4.0
    case "B+":
        print(3.5)
        gradeNum = 3.5
    case "B":
       print(3)
        gradeNum = 3.0
    case "C+":
        print(2.5)
        gradeNum = 2.5
    case "C":
        print(2)
        gradeNum = 2.0
    case "D+":
        print(1.5)
        gradeNum = 1.5
    case "D":
        print(1)
        gradeNum = 1.0
    case "F":
        print(0)
        gradeNum = 0
    default:
        break
    }

    print(name, subject, grade)

    guard let nameIndex = studentList.firstIndex(where: { $0.name == name }) else {
        // 학생이 없음
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }

    let score = studentList[nameIndex].score

    if let gradeIndex = score.firstIndex(where: {$0.subject == subject}) {
        // 점수가 있음
        studentList[nameIndex].score[gradeIndex].grade = gradeNum
    } else {
        let newScore = Score(subject: subject, grade: gradeNum)
        studentList[nameIndex].score.append(newScore)
    }

    print("\(name)학생의 \(subject)과목이 \(grade)로 추가(변경) 되었습니다")
}

// 4. 성적삭제
func deleteGrade() {
    guard let inputText = readLine(),
          !inputText.isEmpty else { return }
    
    let splitedInputText = inputText.split(separator: " ")

    if splitedInputText.count == 1 {
        print("입력이 잘못되었습니다.다시 확인해주세요")
    }

    let name = splitedInputText[0]
    let subject = splitedInputText[1]

    guard let nameIndex = studentList.firstIndex(where: { $0.name ?? "" == name }) else {
        // 이름이 없으면
        print("입력이 잘못되었습니다.다시 확인해주세요")
        return
    }

    // 이름이 있으면 grade 삭제

    print(splitedInputText)
}

// 5. 평점보기
func average() {
    guard let name = readLine(),
          !name.isEmpty else { return }
    
    if studentList.contains(where: { $0.name == name} ) {
        // 평점 보여주기
    } else {
        //이름 검색 후 없으면
    }
}

// 6. 종료
func end() {
    if readLine() == "X"{
        print("프로그램을 종료합니다...")
        exit(0)
    }
}
