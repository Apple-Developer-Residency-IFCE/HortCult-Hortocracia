//
//  Splash.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Splash: View {
    
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    @Environment (\.colorScheme) var colorScheme
    
    @State var isActive: Bool = false
    @State var size = 0.8
    @State var opacity = 0.5
    var body: some View {
        Group{
            
            if isActive {
                Onboarding01()
            }else {
                VStack {
                    VStack {
                        Image("Logo_Clara")
                            .resizable()
                            .frame(width: 257, height: 47.26)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                            
                            
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }.onAppear {
            if(colorScheme == .light){
                selectedTheme = .Claro
            }else{
                selectedTheme = .Escuro
            }
        }
    }
    
    
    struct Splash_Previews: PreviewProvider {
        static var previews: some View {
            Splash()
        }
    }
}
