//
//  ResultViewData.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 19/07/21.
//

import Foundation

struct ResultViewData {
    let newGameButtonTitle: String
    let exitGameButtonTitle: String
    let resultLabelTitle: String
    
    init() {        
        self.newGameButtonTitle = "Novo jogo"
        self.exitGameButtonTitle = "Sair"
        self.resultLabelTitle = "Resultado:"
    }
}
