//

import SwiftUI

struct LocationsScreen: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack {
                TopBar(title: title)
                
                Spacer()
                
                
                
            }
        }
    }
}

#Preview {
    LocationsScreen(
        title: "Title"
    )
}

struct TopBar: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var title: String
    
    @State var query: String = ""
    var body: some View {
        ZStack {
            OBiletColors.primary.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack {
                    Text(title)
                        .foregroundColor(OBiletColors.onPrimary)
                        .font(.custom(Nunito.bold, size: 20))
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top)
                    
                    Image(systemName: "chevron.left")
                        .foregroundColor(OBiletColors.onPrimary)
                        .padding(10)
                        .background(
                            Circle().fill(Color.white.opacity(0.44))
                        )
                        .onTapGesture {
                            dismiss()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                    
                }
                
                SearchBar(text: $query)
                
            }
            
        }
        .frame(height: 100)
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = LocalizedStrings.search
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(OBiletColors.searchbarBackground)
                .shadow(radius: 8, y: 4)
                .padding(.horizontal)
                .frame(height: 42)
            
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                
                TextField(
                    placeholder,
                    text: $text
                )
                .font(.custom(Nunito.regular, size: 14))
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .tint(OBiletColors.primary)
                
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) { text = "" }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(OBiletColors.primary)
                .opacity(text.isEmpty ? 0 : 1)
                .offset(x: text.isEmpty ? 12 : 0)
                .allowsHitTesting(!text.isEmpty)
                .padding(.horizontal)
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .move(edge: .trailing)
                ))
                
                
            }
            .padding(.horizontal, 16)
            .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
        }
        .padding(.bottom)
    }
}
