//
//  main.swift
//  MyCreditManager_0515
//
//  Created by siyeon park on 2023/05/15.
//

import Foundation

var studentList = [Student]()
var dic: [String:Student] = [:]

func creditManager() {
    print("원하는 기능을 입력해주세요.")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    let inputText = readLine()

    guard let inputText = inputText else {
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
        print("입력예시: 학생이름(Mickey) 과목(Swift) 성적(A+,A,F)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예: Micky Swift F\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        addGrade()
    case MenuType.deleteGrade.code:
        print("성적을 삭제할 학생이름, 과목이름, 성적(A+,A,F)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예: Micky Swift F")
        deleteGrade()
    case MenuType.average.code:
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        average()
    case MenuType.end.code:
        print("프로그램을 종료합니다...")
        end()
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해 주세요.")
        creditManager()
    }
}

creditManager()

// 1. 학생추가
func addStudent() {
    let name = readLine()

    guard let name = name,!name.isEmpty else { return }

    if studentList.contains(where: { $0.name == name }) {
        print("-->>\(studentList.contains(where: { $0.name == name }))")
        print("\(name)이 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {

        let student = Student(name: name)
        studentList.append(student)

        print("\(name) 학생을 추가했습니다.")
    }
    creditManager()
}

// 2. 학생삭제
func removeStudent() {
    let name = readLine()

    guard let name = name,!name.isEmpty else { return }

    // 배열에서 입력된 name이 있는지 찾기
    let hasStudent = studentList.filter {
        print("-->>> \($0.name == name)")
        return $0.name == name
    }
    
    if hasStudent.count == 0 {
        print("\(name)학생을 찾지 못했습니다.")
    } else {
        // 입력된 name 있으니 배열에서 삭제
        studentList[0].name
        print("\(String(describing: studentList[0].name))학생을 삭제하였습니다.")
        studentList = studentList.filter {
            return $0.name != name
        }
    }
    print("-->> \(studentList)")
              
    creditManager()
}

// 3. 성적추가
func addGrade() {
    let inputText = readLine()

    guard let inputText = inputText,!inputText.isEmpty else { return }

    var splitedInputText = inputText.split(separator: " ")

    if splitedInputText.count != 3 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    print(splitedInputText)
    print(inputText)

    let name = String(splitedInputText[0])
    let subject = String(splitedInputText[1])
    let grade = String(splitedInputText[2])

    switch grade {
    case "A+":
        print(4.5)
    case "A":
        print(4)
    case "B+":
        print(3.5)
    case "B":
       print(3)
    case "C+":
        print(2.5)
    case "C":
        print(2)
    case "D+":
        print(1.5)
    case "D":
        print(1)
    case "F":
        print(0)
    default:
        break
    }
    print(name, subject, grade)
    
    // 입력된 학생성적 배열에 추가
    var addStudent = Student(name: String(name), subject: String(subject), grade: Double(grade))
    studentList.append(addStudent)

    print("\(name)학생의 \(subject)과목이 \(grade)로 추가(변경) 되었습니다")
    creditManager()
}

// 4. 성적삭제
func deleteGrade() {
    let inputText = readLine()

    guard let inputText = inputText,!inputText.isEmpty else {
        return
    }
    
    let splitedInputText = inputText.split(separator: " ")
    if splitedInputText.count != 2 {
        print("입력이 잘못되었습니다.다시 확인해주세요")
    }

    let name = splitedInputText[0]
    let subject = splitedInputText[1]
    print(splitedInputText)

    // 이름을 기준으로 이름과 과목을 찾아서 성적 삭제

    let removeStudentGrade = Student(name: String(name), subject: String(subject), grade: nil)
    print("\(name)학생의 \(subject)과목의 성적이 삭제되었습니다.")
    
    creditManager()
}

// 5. 평점보기
func average() {
    let name = readLine()

    guard let name = name,!name.isEmpty else { return }
    
    if studentList.contains(where: { $0.name == name} ) {
        // 이름을 기준으로 리스트에서 subject와 grade 출력
        //print("\(subject): \(grade)")

        // 평점 보여주기
    } else {
        //이름 검색 후 없으면
        let name = Student().name
        print("\(String(describing: name))학생을 찾을 수 없습니다.")
    }

    creditManager()
}

// 6. 종료
func end() {
    let inputText = readLine()
    
    if inputText == "X" || inputText == "x" {
        print("프로그램을 종료합니다...")
        return
    }
}
