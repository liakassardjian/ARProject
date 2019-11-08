//
//  ViewController.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var inicioView: UIView! {
        didSet {
            self.inicioView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var inicioLabel: UILabel!
    @IBOutlet var sceneView: ARSCNView!
    
    var capitulo: Capitulo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        var scene: SCNScene
        switch capitulo?.nomeAR {
        case "revFrancesa":
            scene = SCNScene(named: "art.scnassets/box.scn")!
        case "egitoAntigo":
            scene = SCNScene(named: "art.scnassets/pyramid.scn")!
        default:
            scene = SCNScene(named: "art.scnassets/box.scn")!
        }
        
        // Set the scene to the view
        sceneView.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let arImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        configuration.trackingImages = arImages

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
   
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard anchor is ARImageAnchor else { return }
        
        if anchor.name != capitulo?.nomeAR {
            DispatchQueue.main.async {
                self.inicioLabel.text = "Esta imagem não corresponde a esse conteúdo. Posicione a imagem correta em frente à câmera"
                self.inicioLabel.isHidden = false
                self.inicioView.isHidden = false
            }
        } else {
            DispatchQueue.main.async {
                self.inicioLabel.isHidden = true
                self.inicioView.isHidden = true
            }
        }

        // Container
        guard let container = sceneView.scene.rootNode.childNode(withName: "container", recursively: false) else { return }
        container.removeFromParentNode()
        node.addChildNode(container)
        container.isHidden = false
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        if anchor.name != capitulo?.nomeAR {
            DispatchQueue.main.async {
                self.inicioLabel.text = "Esta imagem não corresponde a esse conteúdo. Posicione a imagem correta em frente à câmera"
                self.inicioLabel.isHidden = false
                self.inicioView.isHidden = false
            }
        } else {
            DispatchQueue.main.async {
                self.inicioLabel.isHidden = true
                self.inicioView.isHidden = true
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let questionario = segue.destination as? QuestionarioViewController {
            questionario.capitulo = self.capitulo
        }
    }
}
