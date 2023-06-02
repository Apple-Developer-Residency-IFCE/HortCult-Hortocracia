import SwiftUI

struct TabBar: View {
    @State private var selectedTab: Int = 0
    
    struct TabBarButton: View {
        let tabIcon: String
        let isSelected: Bool
        let action: () -> Void
        var body: some View {
            Button(action: action) {
                VStack {
                    Image(tabIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .foregroundColor(isSelected ? Color("VerdeClaro") : Color("Cinza"))
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case 0:
                Onboarding01()
            case 1:
                Onboarding02()
            default:
                EmptyView()
            }
            Spacer()
            ZStack(alignment: .center) {
                Color.white
                    .frame(height: 80)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                
                HStack(spacing: 0) {
                    Spacer()
                    TabBarButton(tabIcon: "Home", isSelected: selectedTab == 0) {
                        selectedTab = 0
                    }
                    Spacer()
                    TabBarButton(tabIcon: "Settings", isSelected: selectedTab == 1) {
                        selectedTab = 1
                    }
                    Spacer()
                }
            }
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
