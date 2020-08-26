//
//  ViewController.swift
//  AR Image Recognition
//
//  Created by Zackary O'Connor on 8/20/20.
//  Copyright © 2020 Zackary O'Connor. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    let configuration = ARImageTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Couldn't load tracking images.")
        }
        
        configuration.trackingImages = trackingImages
        sceneView.session.run(configuration)
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        DispatchQueue.main.async {
            self.present(VoiceRecordingController(), animated: true)
        }
        
        return node
    }
}
