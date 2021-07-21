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
    
    // TODO: Retornar um map com os dados. I.E: [Mario: 66, Peach: 30]
    
    static var hasMoreQuestions: Bool = true
    static var result: String {
        let factor = 100.0 / Double(answers.count)
        let grouped = answers.reduce(into: [:]) { result, character in
            result[character, default: 0] += 1
        }.sorted { $0.1 > $1.1 }
                
        var resultText = ""
        grouped.forEach { k, v in
            let answerPercentual = String(format: "%.2f", (Double(v) * factor))
            resultText += "\(k) = \(answerPercentual)% \n"
        }
        
        return "\(resultText.prefix(resultText.count - 2))"
    }
    
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
        Question(title: "Como você se define?",
                 answers: [
                    Answer(title: "Alguém que é capaz de qualquer coisa para conquistar seus objetivos", profile: .four),
                    Answer(title: "Alguém que não se importa de não ser o centro das atenções", profile: .two),
                    Answer(title: "Alguém que gosta de uma aventura", profile: .one),
                    Answer(title: "Alguém que possui muita bondade", profile: .three)
                 ].shuffled()
        ),
        Question(title: "Qual sua principal característica?",
                 answers: [
                    Answer(title: "Persistência", profile: .four),
                    Answer(title: "Coragem", profile: .one),
                    Answer(title: "Companheirismo", profile: .two),
                    Answer(title: "Fé", profile: .three)
                 ].shuffled()
        ),
        Question(title: "Qual frase te define?",
                 answers: [
                    Answer(title: "'Preciso vencer a qualquer custo!'", profile: .four),
                    Answer(title: "'Qual é o próximo desafio?'", profile: .one),
                    Answer(title: "'No que posso ajudar?'", profile: .two),
                    Answer(title: "'Pareço frágil, mas sou muito forte!!'", profile: .three)
                 ].shuffled()
        )
    ].shuffled()
}

// MARK: - Question

struct Question {
    let title: String
    let answers: [Answer]
    
    var one: Answer { answers[0] }
    var two: Answer { answers[1] }
    var three: Answer { answers[2] }
    var four: Answer { answers[3] }
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
