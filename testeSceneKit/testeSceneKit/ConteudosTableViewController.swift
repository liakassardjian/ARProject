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
                              perguntas:
        [Pergunta(titulo: "Pergunta 1", texto: "Quando ocorreu a queda da Bastilha?", alternativas: ["14 de julho de 1915", "14 de julho de 1789", "14 de janeiro de 1803", "14 de junho de 1412"], resposta: 2),
         Pergunta(titulo: "Pergunta 2", texto: "Qual era o lema da Revolução Francesa?", alternativas: ["Liberdade, Igualdade e Fraternidade", "Ordem de Progresso", "Independência e Virtude", "Desenvolvimento, progresso e liberdade"], resposta: 3)])]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "conteudo", for: indexPath)

        cell.textLabel?.text = capitulos[indexPath.row].nome

        return cell
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
