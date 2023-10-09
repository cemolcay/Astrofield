//
//  AstroScene.swift
//  Astrofield
//
//  Created by Cem Olcay on 10/9/23.
//

import Foundation
import SpriteKit

class AstroScene: SKScene {
    let startRadius: CGFloat = 50
    let endRadius: CGFloat = 800
    
    var innerCircle = SKShapeNode()
    let outerCircle = SKShapeNode()
    let label = SKLabelNode(text: "Astro")
    
    let minAstroSize: CGFloat = 1
    let maxAstroSize: CGFloat = 3
    let minAstroSpeed: CGFloat = 5
    let maxAstroSpeed: CGFloat = 10
    let astroScale: CGFloat = 5

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(label)
        addChild(innerCircle)
        innerCircle.fillColor = .clear
        innerCircle.strokeColor = .red
        innerCircle.lineWidth = 1
        addChild(outerCircle)
        outerCircle.fillColor = .clear
        outerCircle.strokeColor = .yellow
        outerCircle.lineWidth = 1
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        label.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        innerCircle.path = CGPath(ellipseIn: CGRect(x: (size.width/2.0) - (startRadius/2.0), y: (size.height/2.0) - (startRadius/2.0), width: startRadius, height: startRadius), transform: nil)
        outerCircle.path = CGPath(ellipseIn: CGRect(x: (size.width/2.0) - (endRadius/2.0), y: (size.height/2.0) - (endRadius/2.0), width: endRadius, height: endRadius), transform: nil)
    }
    
    func spawnAstro() {
        let astroSize = CGFloat.random(in: minAstroSize ... maxAstroSize)
        let astro = SKShapeNode(ellipseIn: .init(origin: .zero, size: CGSize(width: astroSize, height: astroSize)))
        astro.fillColor = .white
        addChild(astro)
        
        let randomSpeed = CGFloat.random(in: minAstroSpeed ... maxAstroSpeed)
        let randomAngle = CGFloat.random(in: 0 ... (.pi * 2))
        
        let startX = ((startRadius/2.0) * cos(randomAngle)) + (size.width/2.0) - (astroSize/2.0)
        let startY = ((startRadius/2.0) * sin(randomAngle)) + (size.height/2.0) - (astroSize/2.0)
        let endX = ((endRadius/2.0) * cos(randomAngle)) + (size.width/2.0) - (astroSize/2.0)
        let endY = ((endRadius/2.0) * sin(randomAngle)) + (size.height/2.0) - (astroSize/2.0)
        
        astro.position = CGPoint(x: startX, y: startY)
        let action = SKAction.sequence([
            SKAction.group([
                .move(to: CGPoint(x: endX, y: endY), duration: randomSpeed),
                .scale(by: astroScale, duration: randomSpeed)]),
            .removeFromParent()
        ])
        astro.run(action, withKey: "astro")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in 0..<50 {
            spawnAstro()
        }
    }
}
