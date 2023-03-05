//
//  Preview3DModelsView.swift
//  Preview3DApp
//
//  Created by Miguel Angel Fonseca Perez on 06/02/23.
//

import SwiftUI
import SceneKit

struct Preview3DModelsView: View {
    
    @State private var showNavigationBar = false
    @State private var index = 0
    @State private var isModalPresented: Bool = false
    
    var name: String
    var description: String
    var models: [ARModel]
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10){
            SceneView(scene: SCNScene(named: models[index].modelName ),
                      options: [.autoenablesDefaultLighting, .allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2, alignment: .center)
            
                .onAppear {
                    let rotation = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 5)
                    let _ = SCNAction.repeatForever(rotation)
                    
                }
            
            ZStack{
                HStack{
                    Button(action: {
                        withAnimation{
                            if index > 0{
                                index -= 1
                            }
                        }
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                        .disabled(index == 0 ? true : false)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation{
                            if index < models.count{
                                index += 1
                            }
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == models.count - 1 ? 0.3 : 1)
                    })
                        .disabled(index == models.count - 1 ? true : false)
                }
                HStack{
                    Text(models[index].type.rawValue)
                        .padding()
                        .font(.system(size: 35 , weight: .bold))
                        .foregroundColor(models[index].type == .Voxelized ? .green : .gray)
                    
                    Button(action: {
                        isModalPresented.toggle()
                    }) {
                        Image(systemName: "info.circle")
                    }.sheet(isPresented: $isModalPresented){

                    }
                }
                
                    
            }
            .foregroundColor(.black)
            .padding(.horizontal)
        
            Text(description)
                .font(.title)
                .padding(.all)
            
            Spacer(minLength: 0)
        }.navigationTitle(name)
            .navigationBarTitleDisplayMode(.inline)
    }
    
}
    
struct AboutModelView: View {
    
    let text : String

    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color(UIColor.white))
            .foregroundColor(.white)

            .overlay(
                HStack {

                    Text(text)
                        .foregroundColor(.black)
                    
                }).padding(.all)
    }
}


struct Preview3DModelsView_Previews: PreviewProvider {
    static var previews: some View {
        Preview3DModelsView(name: "Preview", description: "Preview example", models: TemplateList.templates.first!.models)
        
    }
}

