//
//  SwiftUIView.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct ImageSelectorView: View {
    var ImageTrue: Bool
    let MainImage: String
    var body: some View {
        if ImageTrue{
            Image(MainImage)
                .resizable()
                .frame(width: 276, height: 249.38)
                .padding(.bottom, 39.62)
        }else{
            EmptyView()
        }
    }
}

