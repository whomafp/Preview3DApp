//
//  PreviewModel.swift
//  Preview3DApp
//
//  Created by Miguel Angel Fonseca Perez on 08/02/23.
//

import Foundation
import SwiftUI

enum ModelType: String {
    case Normal = "Normal"
    case Voxelized = "Voxelized"
}

enum TemplateType {
    case FeetObject
    case AnyObject
}

struct ModelTemplate: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var imageName: String
    var type: TemplateType
    var models: [ARModel]
}

struct ARModel {
    var modelName: String
    var type: ModelType
}

struct TemplateList {
    
    static let templates = [
        ModelTemplate(name: "Jupiter", description: "This is an example of Jupiter", imageName: "template", type: .AnyObject, models: [ARModel(modelName: "jupiter.usdz", type: .Normal)]),
        ModelTemplate(name: "Person", description: "This is an example of Person", imageName: "template", type: .AnyObject, models: [ARModel(modelName: "person.usdz", type: .Voxelized)]),
        ModelTemplate(name: "El David", description: "This is an example of El David", imageName: "template", type: .AnyObject, models: [ARModel(modelName: "david.usdz", type: .Normal), ARModel(modelName: "david_voxelized.usdz", type: .Voxelized)]),
        ModelTemplate(name: "Foot", description: "This is an example of foot to diagnose flat foot", imageName: "template", type: .FeetObject, models: [ARModel(modelName: "foot.usdz", type: .Normal), ARModel(modelName: "footpv.usdz", type: .Voxelized)]),
        ModelTemplate(name: "Baby yoda", description: "This is an example of Baby Yoda", imageName: "template", type: .AnyObject, models: [ARModel(modelName: "myYoda.usdz", type: .Normal), ARModel(modelName: "myYodaV.usdz", type: .Voxelized)]),
        ModelTemplate(name: "Cap", description: "This is an example of Cap", imageName: "template", type: .AnyObject, models: [ARModel(modelName: "cap.usdz", type: .Normal)])
    ]
    
}

