//
//  Pergunta.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import Foundation

class Pergunta {
    var titulo: String
    var texto: String
    var alternativas:[String]
    var resposta: Int
    
    init(titulo: String, texto: String, alternativas: [String], resposta: Int) {
        self.titulo = titulo
        self.texto = texto
        self.alternativas = alternativas
        self.resposta = resposta
    }
}
