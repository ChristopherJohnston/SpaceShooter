//
//  TitleScene.swift
//  SpaceShooter
//
//  Created by Christopher Johnston on 04/11/2018.
//  Copyright © 2018 Christopher Johnston. All rights reserved.
//

import Foundation
import SpriteKit

var gameTitle: SKLabelNode?
var btnPlay: SKLabelNode?

class TitleScene : SKScene {
    override func sceneDidLoad() {
        gameTitle = self.childNode(withName: "gameTitle") as? SKLabelNode
        btnPlay = self.childNode(withName: "btnPlay") as? SKLabelNode
    }
    
    func playTheGame() {
        self.view?.presentScene(GameScene(), transition: SKTransition.doorway(withDuration: 0.4))
        btnPlay?.removeFromParent()
        gameTitle?.removeFromParent()
        
        if let scene = GameScene(fileNamed: "GameScene") {
            let skView = self.view! as SKView
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
            skView.presentScene(scene, transition: SKTransition.flipVertical(withDuration: 1.0))
            // Copy gameplay related content over to the scene
//            scene.entities = scene.entities
//            scene.graphs = scene.graphs
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if (btnPlay?.contains(touchLocation))! {
            self.playTheGame()
        }
    }
}
