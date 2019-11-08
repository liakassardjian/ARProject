//
//  ConteudosTableViewController.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit

class ConteudosTableViewController: UITableViewController {

    let capitulos = [Capitulo(nome: "Revolução Francesa",
                              nomeAR: "revFrancesa",
                              perguntas:
        [Pergunta(titulo: "Pergunta 1", texto: "Quando ocorreu a queda da Bastilha?", alternativas: ["14 de julho de 1915", "14 de julho de 1789", "14 de janeiro de 1803", "14 de junho de 1412"], resposta: 2),
         Pergunta(titulo: "Pergunta 2", texto: "Qual era o lema da Revolução Francesa?", alternativas: ["Liberdade, Igualdade e Fraternidade", "Ordem de Progresso", "Independência e Virtude", "Desenvolvimento, progresso e liberdade"], resposta: 1),
         Pergunta(titulo: "Pergunta 3", texto: "Como a sociedade francesa estava dividida?", alternativas: ["Senhor feudal e servo", "Alto clero e baixo clero", "Classe alta, classe média e classe baixa", "Clero, nobreza e burguesia"], resposta: 4),
         Pergunta(titulo: "Pergunta 4", texto: "Quais foram as medidas tomadas pela monarquia para sustentar seus gastos?", alternativas: ["Aumento de impostos", "Venda de indulgências", "Comércio de escravos", "Divisão de terras e incentivo agrário."], resposta: 1),
         Pergunta(titulo: "Pergunta 5", texto: "O que foi o voto censitário?", alternativas: ["Voto baseado na idade", "Voto baseado na cor da pele", "Voto baseado na renda", "Voto baseado na quantidade de filhos"], resposta: 3)]),
    
                     Capitulo(nome: "Egito Antigo",
                     nomeAR: "egitoAntigo",
                     perguntas:
        [Pergunta(titulo: "Pergunta 1", texto: "Como era a religião do povo egípcio?", alternativas: ["Politeísta", "Monoteísta", "Panteístas", "Ateístas"], resposta: 3),
         Pergunta(titulo: "Pergunta 2", texto: "Qual o rio mais importante do território do Egito?", alternativas: ["Rio Gangis", "Rio Negro", "Rio Nilo", "Rio Jordão"], resposta: 3),
         Pergunta(titulo: "Pergunta 3", texto: "Qual foi o último faraó do Egito?", alternativas: ["Cleópatra", "Tutan", "Menés", "Hórus"], resposta: 1),
         Pergunta(titulo: "Pergunta 4", texto: "Segundo a mitologia egípcia, qual o deus dos mortos?", alternativas: ["Rah", "Osíris", "Susano", "Zeus"], resposta: 1),
         Pergunta(titulo: "Pergunta 5", texto: " Qual era a base da economia do Egito Antigo?", alternativas: ["Metalurgia", "Criação de ovelhas", "Indústria", "Agricultura"], resposta: 4)])]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return capitulos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "conteudo", for: indexPath) as? ConteudoTableViewCell else { return UITableViewCell() }
        cell.tituloLabel.text = capitulos[indexPath.row].nome
        cell.marcadorImage.image = UIImage(named: "\(capitulos[indexPath.row].nomeAR)Preview")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    @IBAction func voltarMenu(_ sender: UIStoryboardSegue) {
        // dismiss
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let arVC = segue.destination as? ARViewController {
            if let selecionado = tableView.indexPathForSelectedRow {
                arVC.capitulo = self.capitulos[selecionado.row]
            }
        }
        
        if let progresso = segue.destination as? ProgressoTableViewController {
            progresso.capitulos = self.capitulos
        }
    }
}
