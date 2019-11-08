//
//  Capitulo.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import Foundation
    
class Capitulo {
    var nome: String
    var perguntas: [Pergunta]
    var progresso: Int
    var nomeAR: String
    
    init(nome: String, nomeAR: String, perguntas: [Pergunta]) {
        self.nome = nome
        self.nomeAR = nomeAR
        self.perguntas = perguntas
        self.progresso = 0
    }
    
    public func calculaProgresso() {
        var certas: Int = 0
        for p in perguntas {
            if p.acertada {
                certas += 1
            }
        }
        
        progresso = certas * 100 / perguntas.count
    }
}
