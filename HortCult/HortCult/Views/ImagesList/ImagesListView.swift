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
                                Image("Tomatinho")
                                    .frame(maxWidth: .infinity)
                                    
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
