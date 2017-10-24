//
//  UserPositionService.swift
//  6dof-vr
//
//  Created by Bartłomiej Nowak on 24/10/2017.
//  Copyright © 2017 Bartłomiej Nowak. All rights reserved.
//

import Foundation
import ARKit

final class UserPositionService: NSObject {
    
    var onPositionUpdate: ((SCNVector3) -> Void)?
    
    var positionOffset = SCNVector3(0.0, 0.0, 0.0)
    
    private let session: ARSession
    private let configuration = ARWorldTrackingConfiguration()
    
    init(session: ARSession) {
        self.session = session
    }
    
    func startPositionUpdates() {
        session.delegate = self
        session.run(configuration)
    }
}

extension UserPositionService: ARSessionDelegate {
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let translationColumn = frame.camera.transform.columns.3
        
        onPositionUpdate?(
            SCNVector3(translationColumn.x, translationColumn.y, translationColumn.z) + positionOffset)
        
//        leftCameraNode.position =
//            SCNVector3(
//                translationColumn.x - Float(Distance.pupillary / 2.0),
//                translationColumn.y,
//                translationColumn.z)
//            + viewportPosition
//        rightCameraNode.position =
//            SCNVector3(
//                translationColumn.x + Float(Distance.pupillary / 2.0),
//                translationColumn.y,
//                translationColumn.z)
//            + viewportPosition
    }
}