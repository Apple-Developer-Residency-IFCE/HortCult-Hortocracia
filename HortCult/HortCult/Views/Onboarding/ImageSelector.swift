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
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 57)
                .padding(.top, 39)
                .padding(.bottom, 40)
        }else{
            EmptyView()
            Spacer()
        }
    }
}

