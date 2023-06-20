//
//  ImagesListView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ImagesListView: View {
    
    @Binding  var userImages: [UIImage]
//    = [
//                       UIImage(named: "Tomatinho")!,
//                       UIImage(named: "Tomatinho")!,
//                       UIImage(named: "Tomatinho")!
//                   ]

    
    var body: some View {
        NavigationView {
            
                    ScrollView(.horizontal) { // <1>
                        
                        HStack(spacing: 0) { // <2>
                            
                            ForEach(userImages, id: \.self) { image in
                                ZStack{
                                   
                                    Image(uiImage: image)
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
        Teste5()
    }
}

struct Teste5: View {
    @State var teste5: [UIImage] = [
                       UIImage(named: "Tomatinho")!,
                       UIImage(named: "Tomatinho")!,
                       UIImage(named: "Tomatinho")!
                       ]
    
    var body: some View {
        
                       
        ImagesListView(userImages: $teste5)
        
    }
}

