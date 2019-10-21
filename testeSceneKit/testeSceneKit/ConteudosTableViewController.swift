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
                              perguntas: [Pergunta(titulo: "Pergunta 1", texto: "O que?", alternativas: ["a", "b", "c", "d"], resposta: 2),
                                        Pergunta(titulo: "Pergunta 2", texto: "Onde", alternativas: ["e", "f", "g", "h"], resposta: 3)])]
    
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
    }
}
