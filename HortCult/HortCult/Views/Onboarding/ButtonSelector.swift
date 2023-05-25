//
//  ButtonSelector.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct ButtonSelector: View {
    var buttonColor: Bool
    var symbolTrue: Bool
    var buttonText: String
    var body: some View {
        if buttonColor{
            if symbolTrue{
                Button(action: {
                    print(buttonText)
                }) {
                    HStack{
                        Text(buttonText)
                        Image("Arrow-Right")
                            .foregroundColor(.white)
                    }
                }
                .foregroundColor(.white)
                .padding()
                .frame(width: 277, height: 42)
                .background(Color("H1Color"))
                .cornerRadius(40)
            } else{
                Button(action: {
                    print(buttonText)
                }) {
                    HStack{
                        Text(buttonText)
                    }
                }
                .foregroundColor(.white)
                .padding()
                .frame(width: 277, height: 42)
                .background(Color("H1Color"))
                .cornerRadius(40)
            }
        } else{
            if symbolTrue{
                Button(action: {
                    print(buttonText)
                }) {
                    HStack{
                        Text(buttonText)
                        Image("Arrow-Right")
                            .foregroundColor(.white)
                    }
                }
                .foregroundColor(Color("H1Color"))
                .padding()
                .frame(width: 277, height: 42)
                .background(Color.white)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("H1Color"), lineWidth: 2)
                )
                
            } else{
                Button(action: {
                    print(buttonText)
                }) {
                    HStack{
                        Text(buttonText)
                    }
                }
                .foregroundColor(Color("H1Color"))
                .padding()
                .frame(width: 277, height: 42)
                .background(Color.white)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("H1Color"), lineWidth: 2)
                )
            }
        }
        
        
    }
}

