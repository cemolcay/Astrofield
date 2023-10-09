//
//  ViewController.swift
//  Astrofield
//
//  Created by Cem Olcay on 10/9/23.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    let scene = SKView()
    let astroScene = AstroScene(size: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scene)
        scene.translatesAutoresizingMaskIntoConstraints = false
        scene.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scene.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scene.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scene.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scene.presentScene(astroScene)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        astroScene.size = scene.frame.size
    }
}
