//
//  SwiftUIView.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct ImageSelectorView: View {
    @Environment(\.colorScheme) var colorScheme
    var ImageTrue: Bool
    let MainImage: String
    var body: some View {
        if ImageTrue{
            Image(colorScheme == .dark ? "\(MainImage)Dark" : MainImage)
                .resizable()
                .frame(width: 276, height: 249.38)
                .padding(.bottom, 39.62)
        }else{
            EmptyView()
        }
    }
}

