//

import SwiftUI

struct LocationsScreen: View {
    
    @StateObject private var viewModel: LocationsScreenViewModel
    
    var title: String
    
    var direction: LocationDirection
    
    init(title: String, direction: LocationDirection, locations: [BusLocationDTO]) {
        self.title = title
        self.direction = direction
        _viewModel = StateObject(wrappedValue: LocationsScreenViewModel(initialLocations: locations))
    }
    
    @State private var showScrollToTop = false
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack {
                TopBar(title: title, query: $viewModel.searchQuery) { query in
                    viewModel.searchQuery = query
                }
                
                Spacer()
                
                ZStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.locations, id: \.id) { location in
                                if let locationName = location.name {
                                    LocationItem(location: locationName)
                                }
                            }
                        }
                    }
                    .padding()
                    .ignoresSafeArea()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    LocationsScreen(
        title: "Title",
        direction: LocationDirection.origin,
        locations: []
    )
}

struct TopBar: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var title: String
    
    @Binding var query: String
    
    let onQueryChange: (String) -> Void
    
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

struct ScrollToTopButton: View {
    
    let onButtonClick: () -> Void
    var body: some View {
        Circle()
            .fill(OBiletColors.scrollToTopButtonBackground)
            .frame(width: 42, height: 42)
            .overlay {
                Image(systemName: "chevron.up")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(OBiletColors.primary)
            }
            .onTapGesture {
                onButtonClick()
            }
        
    }
}
