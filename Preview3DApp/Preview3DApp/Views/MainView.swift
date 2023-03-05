//
//  MainView.swift
//  Preview3DApp
//
//  Created by Miguel Angel Fonseca Perez on 05/02/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ModelListView().background(Color.green)
                .tabItem {
                    Label("Preview", systemImage:"cube")
                }
            DeveloperView()
                .tabItem{
                    Label("Developer", systemImage: "person")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
