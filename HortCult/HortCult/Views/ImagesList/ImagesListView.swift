//
//  ImagesListView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ImagesListView: View {
    @State var imagesData:[Data]
    @EnvironmentObject var imageListViewModel:ImageListViewModel
    
    func dataToUI(data: Data) -> UIImage{
        return UIImage(data: data) ?? UIImage()
    }

    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(imageListViewModel.data.indices, id: \.self) { id in
                Image(uiImage: dataToUI(data: imageListViewModel.data[id]))
                    .resizable()
                    .tag(id)
                    .tabItem {
                        Text("Tab \(id + 1)")
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .ignoresSafeArea()
        .onAppear(perform: { imageListViewModel.getImage() })
    }
}
//
//struct ImagesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagesListView()
//    }
//}
