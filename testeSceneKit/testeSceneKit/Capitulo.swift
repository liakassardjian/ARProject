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
    
    init(nome: String, perguntas: [Pergunta]) {
        self.nome = nome
        self.perguntas = perguntas
    }
}
