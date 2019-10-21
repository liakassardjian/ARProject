//
//  QuestionarioViewController.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit

class QuestionarioViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var anteriorButton: UIButton!
    @IBOutlet weak var proximoButton: UIButton!
    
    var pageViewController: PageViewController?
    var horario:DateComponents?
    var primeiroTutorial:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.anteriorButton.isHidden = true
        
        pageControl.numberOfPages = 2
    }
    
    @IBAction func voltarPagina(_ sender: Any) {
        if let index = pageViewController?.indexAtual {
            switch index {
            case 1:
                pageViewController?.voltarPagina()
               
            default:
                break
            }
        }
        self.atualizaInterface()
    }
    
    @IBAction func avancarPagina(_ sender: Any) {
        if let index = pageViewController?.indexAtual {
            switch index {
            case 0:
                pageViewController?.avancarPagina()
               
            default:
                break
            }
        }
        self.atualizaInterface()
    }
    
    func atualizaInterface() {
        if let index = pageViewController?.indexAtual {
            switch index {
            case 0:
                anteriorButton.isHidden = true
                proximoButton.isHidden = false

            case 1:
                anteriorButton.isHidden = false
                proximoButton.isHidden = true

            default:
                break
            }
            pageControl.currentPage = index
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination
        if let pVC = destino as? PageViewController {
            pageViewController = pVC
            pVC.questionarioViewController = self
        }
    }

}
