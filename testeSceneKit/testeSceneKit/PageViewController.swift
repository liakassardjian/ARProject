//
//  PageViewController.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var capitulo: Capitulo?
    
    lazy var ordemViewControllers: [UIViewController] = {
        var controllers: [UIViewController] = []
        
        guard let perguntas = self.capitulo?.perguntas else { return [UIViewController()] }
        
        for p in perguntas {
            controllers.append(self.novaVC(viewController: "pergunta"))
        }
        
        return controllers
    }()
    
    var indexAtual = 0
    var questionarioViewController: QuestionarioViewController?
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index:Int
        
        guard let indexViewController = ordemViewControllers.firstIndex(of: viewController) else {
                return nil
            
        }
        index = indexViewController
        
        let indexAnterior = index - 1
        
        return self.conteudoViewControler(at: indexAnterior)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index:Int
        
        guard let indexViewController = ordemViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        index = indexViewController
        
        let indexPosterior = index + 1
        
        return self.conteudoViewControler(at: indexPosterior)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        popularViews()
        
        if let primeiraViewController = ordemViewControllers.first {
                setViewControllers([primeiraViewController],
                                   direction: .forward,
                                   animated: true,
                                   completion: nil)
        }
        
        self.delegate = self
    }
    
    func novaVC(viewController: String) -> UIViewController {
        guard let novaVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController) as? PerguntaViewController else {
            return UIViewController()
        }
        
        return novaVC
    }
    
    func popularViews() {
        for i in 0..<ordemViewControllers.count {
            guard let vc = ordemViewControllers[i] as? PerguntaViewController else { return }
            guard let pergunta = capitulo?.perguntas[i] else { return }
            
            vc.pergunta = pergunta
            vc.capitulo = capitulo
        }
    }
    
    func conteudoViewControler(at index: Int) -> UIViewController? {
        if index < 0 || index >= ordemViewControllers.count {
                return nil
        }
        return ordemViewControllers[index]
    }
    
    func avancarPagina() {
        indexAtual += 1
        if let proximaViewController = self.conteudoViewControler(at: indexAtual) {
            setViewControllers([proximaViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func voltarPagina() {
        indexAtual -= 1
        if let anteriorViewController = self.conteudoViewControler(at: indexAtual) {
            setViewControllers([anteriorViewController], direction: .reverse, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let vC = pageViewController.viewControllers {
            let paginaAtualViewController = vC[0]
            
            if let index = ordemViewControllers.firstIndex(of: paginaAtualViewController) {
                self.indexAtual = index
            }
        }
        
        if let qVC = questionarioViewController {
            qVC.atualizaInterface()
        }
    }

}
