//
//  ContentView.swift
//  Preview3DApp
//
//  Created by Miguel Angel Fonseca Perez on 05/02/23.
//

import SwiftUI

struct ModelListView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var vm = PreviewViewModel()
    @State var showingAlert: Bool = false
    
    var body: some View {
        
        NavigationView{
            
            List(vm.modelList, id: \.id){ model in
                NavigationLink(destination: Preview3DModelsView(name: model.name, description: model.description, models: model.models)) {
                    ModelCell(model: model)
                }
                
            }.navigationTitle("Models")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu("Filter"){
                            Button{ vm.showAllModels() } label: {Text("Show all models")}
                            Button{ vm.filterFeet() } label: {Text("Show feet models")}
                            Button{ vm.filterAnyObject() } label: {Text("Show normal models")}
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button {
                            showingAlert.toggle()
                        } label: {
                            Image(systemName: "camera")
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text("Capture sample is not available."),
                                  message: Text("The app is not embedded yet, please wait."),
                                  dismissButton: .default(Text("Okay")))
                        }

                    }
                    
                    
                }
            
                .onAppear {
                    //                    UIView.appearance().backgroundColor = .white
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ModelListView()
//            ModelListView()
        }
    }
}

struct ModelCell: View {
    let model: ModelTemplate
    
    var body: some View {
        HStack{
            Image(model.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 4)
            VStack(alignment: .leading, spacing: 5){
                Text(model.name)
                    .font(.title)
                    .bold()
                    .lineLimit(2)
                Text(model.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .minimumScaleFactor(0.5)
                    .lineLimit(5)
            }
        }
//        .background(Color(UIColor.systemBackground))
    }
}
