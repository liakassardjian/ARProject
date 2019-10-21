//
//  PerguntaViewController.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit

class PerguntaViewController: UIViewController {

    @IBOutlet weak var respostaView: UIView! {
        didSet {
            self.respostaView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var respostaLabel: UILabel!
    @IBOutlet weak var respostaImagem: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var perguntaLabel: UILabel!
    @IBOutlet var alternativasButton: [UIButton]!
    
    var capitulo: Capitulo?
    var pergunta: Pergunta?
//
//    var resposta: Int = 0
//    var titulo: String = ""
//    var pergunta: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let pergunta = pergunta else { return }
        tituloLabel.text = pergunta.titulo
        perguntaLabel.text = pergunta.texto
        
        respostaView.layer.opacity = 0
        
        for b in 0..<alternativasButton.count {
            alternativasButton[b].layer.cornerRadius = 8
            alternativasButton[b].titleLabel?.text = pergunta.alternativas[b]
        }
    }
    
    @IBAction func selecionarBotao(_ sender: Any) {
        guard let botao = sender as? UIButton else { return }
        if botao.tag == pergunta?.resposta {
            botao.backgroundColor = .systemGreen
            respostaLabel.text = "Resposta correta"
            respostaImagem.image = UIImage(named: "correto")
            
            for b in alternativasButton {
                b.isUserInteractionEnabled = false
            }
            
            pergunta?.acertada = true
            capitulo?.calculaProgresso()
            
        } else {
            botao.backgroundColor = .systemRed
            respostaLabel.text = "Resposta incorreta"
            respostaImagem.image = UIImage(named: "incorreto")
        }
        
        UIView.animate(withDuration: 1.5, animations: {
            self.respostaView.layer.opacity = 1.0
        }, completion: {
            (finished: Bool) -> Void in
            
            UIView.animate(withDuration: 1.5, animations: {
                self.respostaView.layer.opacity = 0
            })
        })
    }
    
    

}
