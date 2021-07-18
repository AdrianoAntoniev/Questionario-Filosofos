//
//  Question.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 16/07/21.
//

import Foundation

// MARK: - Questions

struct Questions {
    fileprivate static var answers: [String] = []
    fileprivate static var currentQuestionIndex: Int = 0
    static var hasMoreQuestions: Bool = true
    
    static func resetAnswers() {
        answers = []
    }
    
    static func sendAnswer(_ answer: Profile) {
        answers.append(answer.rawValue)        
    }
    
    static func getCurrentQuestion() -> Question {
        hasMoreQuestions =  currentQuestionIndex < values.count - 1
        let currentQuestion = values[currentQuestionIndex]
        
        currentQuestionIndex = hasMoreQuestions ? currentQuestionIndex + 1 : 0
        
        return currentQuestion
    }
    
    private static let values: [Question] = [
        Question(title: "Questao 1",
                 answers: [
                    Answer(title: "Questao 1.1", profile: .four),
                    Answer(title: "Questao 2.1", profile: .one),
                    Answer(title: "Questao 3.1", profile: .two),
                    Answer(title: "Questao 4.1", profile: .three)
                 ]
                         ),
        Question(title: "Questao 2",
                 answers: [
                    Answer(title: "Questao 1.2", profile: .four),
                    Answer(title: "Questao 2.2", profile: .one),
                    Answer(title: "Questao 3.2", profile: .two),
                    Answer(title: "Questao 4.2", profile: .three)
                 ]
                 
        ),
        Question(title: "Questao 3",
                 answers: [
                    Answer(title: "Questao 1.3", profile: .four),
                    Answer(title: "Questao 2.3", profile: .one),
                    Answer(title: "Questao 3.3", profile: .two),
                    Answer(title: "Questao 4.3", profile: .three)
                 ]                 
        )
    ]
}

// MARK: - Question

struct Question {
    let title: String
    let answers: [Answer]    
    
    var one: Answer {
        answers[0]
    }
    
    var two: Answer {
        answers[1]
    }
    
    var three: Answer {
        answers[2]
    }
    
    var four: Answer {
        answers[3]
    }    
}

// MARK: - Answer

struct Answer {
    let title: String
    let profile: Profile
}

// MARK: - Profile

enum Profile: String {
    case one
    case two
    case three
    case four
    
    var rawValue: String {
        switch self {
        case .one:
            return "Mario"
        case .two:
            return "Luigi"
        case .three:
            return "Peach"
        case .four:
            return "Bowser"
        }
    }
}
