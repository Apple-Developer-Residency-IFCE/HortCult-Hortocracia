//
//  ImagesListView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ImagesListView: View {
    var body: some View {
        NavigationView {
            
                    ScrollView(.horizontal) { // <1>
                        
                        HStack(spacing: 0) { // <2>
                            
                            ForEach(0..<3) { index in
                                ZStack{
                                   
                                    Image("Tomatinho")
                                        .frame(maxWidth: .infinity)
                                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .center)
                                        .edgesIgnoringSafeArea(.all).allowsHitTesting(false)
                                }
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    
        }
       
    }
}

struct ImagesListView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesListView()
    }
}
