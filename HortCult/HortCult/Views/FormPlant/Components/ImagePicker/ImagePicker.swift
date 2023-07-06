import SwiftUI

struct ImagePicker: View {
    @EnvironmentObject var imagesSelected: ImageSelected
    @State private var emptyPicker = false

    var body: some View {
      
    }
}


struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
            .environmentObject(ImageSelected())
    }
}


