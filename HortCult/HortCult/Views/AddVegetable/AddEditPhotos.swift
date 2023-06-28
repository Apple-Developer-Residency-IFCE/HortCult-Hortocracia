//
//  AddEditPhotos.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 15/06/23.
//

import SwiftUI

struct AddEditPhotos: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Fotos")
                .foregroundColor(Color("Cinza"))
                .fontWeight(.light)
                .font(Font.custom("Satoshi-Regular", size: 16))
            ImagePickerView()
        }.padding(.leading, 20)
    }
}

struct AddEditPhotos_Previews: PreviewProvider {
    static var previews: some View {
        AddEditPhotos()
    }
}
