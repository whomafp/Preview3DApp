//
//  DeveloperView.swift
//  Preview3DApp
//
//  Created by Miguel Angel Fonseca Perez on 05/02/23.
//

import SwiftUI

struct DeveloperView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isDetailPresented: Bool = false
    
    var body: some View {
        ZStack {
            colorScheme == .dark ? Color.gray.ignoresSafeArea() : Color(red: 0.21, green: 0.23, blue: 0.28, opacity: 1).ignoresSafeArea()
            VStack {
                Image("miguel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 170)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3))
                Text("Miguel Ángel Fonseca Pérez")
                    .font(.system( size: 40))
                    .bold()
                    .foregroundColor(.white)
                HStack(spacing: 20){
                    Spacer()
                    Text("iOS Software Developer.")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    Button {
                        isDetailPresented.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }.sheet(isPresented: $isDetailPresented){
                        AboutModelView(text: "This app was created by Miguel Ángel Fonseca Pérez at 12 as a preview for residence project")
                    }
                    Spacer()

                }
                Divider()
                InfoView(text: "+52 477-383-1658", imageName: "phone.fill")
                InfoView(text: "migueeelfoonseca@gmail.com", imageName: "envelope.fill")
                InfoView(text: "18240659@leon.tecnm.mx", imageName: "envelope.badge.shield.leadinghalf.fill")
                
            }
            
        }

    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}

struct InfoView: View {
    @Environment(\.colorScheme) var colorScheme
    let text : String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color(UIColor.systemBackground))
            .foregroundColor(.white)
            .frame(height: 40)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.blue)
                    Text(text)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    
                }).padding(.all)
    }
}
