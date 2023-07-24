import SwiftUI

import SwiftUI
import PhotosUI


struct DottedRectangle: View {
    var body: some View {
        Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
            .frame(width: 120, height: 120)
            .cornerRadius(8)
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundColor(.clear)
            )
    }
}

struct ImageSpace:View {
    
    var image:UIImage?
    
    var body: some View {
        if let img = image {
            Image(uiImage: img)
                .resizable()
                .frame(width: 120,height: 120)
                .cornerRadius(12)
        }
        else {
            DottedRectangle()
        }
    }
}


struct ImagePicker: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @Binding var selectedPhotosData: [Data]
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    PhotosPicker(
                        selection: $selectedItems,
                        maxSelectionCount: 3,
                        matching: .images) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 120,height: 120)
                                    .foregroundColor(Color("PhotoPickerBackground"))
                                Image("Add")
                                    .resizable()
                                    .frame(width: 36,height: 36)
                            }
                        }
                        .onChange(of: selectedItems) { newItems in
                            selectedPhotosData = []
                            for newItem in newItems {
                                Task {
                                    if let data = try? await newItem.loadTransferable(type:Data.self) {
                                        selectedPhotosData.append(data)
                                    }
                                }
                            }
                        }
                    ForEach(0..<3, id: \.self) { i in
                        if selectedPhotosData.count > i{
                            let photoData = selectedPhotosData[i]
                            if let image = UIImage(data: photoData) {
                                ImageSpace(image: image)
                            }
                        } else {
                            ImageSpace()
                        }
                    }
                }
            }
        }
    }
}


struct ImagePickerView: View {
    @Binding var selectedPhotosData:[Data]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fotos")
                .font(.custom("Satoshi-Regular", size: 16))
                .foregroundColor(Color("Cinza"))
                .padding(.horizontal, 20)
            
            ImagePicker(selectedPhotosData: $selectedPhotosData)
                .padding(.horizontal, 20)
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(selectedPhotosData: .constant([]))
            .environmentObject(ImageSelected())
    }
}


