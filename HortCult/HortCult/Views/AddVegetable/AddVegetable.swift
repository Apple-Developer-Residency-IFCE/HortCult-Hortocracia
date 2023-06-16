//
//  AddVegetable.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 06/06/23.
//

import SwiftUI

struct AddVegetable: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical){                
                AddEditTitle(addEdit: true)
                NameDescription()
                AddEditPhotos()
            }
            .toolbar(){
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Topbar")
                }
            }
        }
    }
}

struct AddVegetable_Previews: PreviewProvider {
    static var previews: some View {
        AddVegetable()
    }
}



