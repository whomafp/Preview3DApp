//
//  PreviewViewModel.swift
//  Preview3DApp
//
//  Created by Miguel Angel Fonseca Perez on 26/02/23.
//

import Foundation
import SwiftUI

class PreviewViewModel: ObservableObject{
    
//    At the moment, our models are currently in local.
    @Published private (set) var modelList: [ModelTemplate] = []
    
    init() {
        filterAnyObject()
    }
    
    func showAllModels(){
        modelList = TemplateList.templates
//            .sorted(by: {$0.name < $1.name})
    }
    
    func filterFeet(){
        modelList = TemplateList.templates.filter{$0.type == .FeetObject}
    }
    
    func filterAnyObject(){
        modelList = TemplateList.templates.filter{$0.type == .AnyObject}
    }
    
    
}
