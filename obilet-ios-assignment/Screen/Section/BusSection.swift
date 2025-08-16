//

import SwiftUI

struct BusSection: View {
    
    @Binding var defaultOriginAndTargetDestinations: OriginAndTargetDestionation
    
    @StateObject var viewModel = BusSectionViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                OBiletColors.background
                    .ignoresSafeArea()
                VStack {
                    
                    LocationsCardView(
                        origin: Binding(
                            get: {
                                viewModel.selectedOriginAndTargetDestination?.origin?.cityName ?? ""
                            }, set: { newValue in
                                if(viewModel.selectedOriginAndTargetDestination != nil) {
                                    viewModel.selectedOriginAndTargetDestination!.origin?.cityName = newValue
                                }
                            }
                        ),
                        destination: Binding(
                            get: {
                                viewModel.selectedOriginAndTargetDestination?.target?.cityName ?? ""
                            }, set: { newValue in
                                if(viewModel.selectedOriginAndTargetDestination != nil) {
                                    viewModel.selectedOriginAndTargetDestination!.target?.cityName = newValue
                                }
                            }
                        )
                    ) { origin, target in
                        viewModel.swipeOriginAndTargetDestination()
                    }
                    
                    DateView()
                    
                    Button(action: {
                        // find the ticket
                    }) {
                        Text(LocalizedStrings.findTheTicket)
                            .foregroundColor(.white)
                            .font(.custom(Nunito.bold, size: 16))
                            .padding(.horizontal, 72)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(OBiletColors.button)
                            )
                    }
                    .padding(.top, 24)
                    
                    Text(LocalizedStrings.loremDummy)
                        .foregroundColor(OBiletColors.primaryTextWithHalfOpacity)
                        .font(.custom(Nunito.medium, size: 16))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.top)
            }
        }
        .onAppear {
            if(viewModel.selectedOriginAndTargetDestination?.origin == nil) {
                viewModel.selectedOriginAndTargetDestination = defaultOriginAndTargetDestinations
            }
        }
        .onChange(of: defaultOriginAndTargetDestinations) { oldValue, newValue in
            print("new value is \(String(describing: newValue))")
              viewModel.selectedOriginAndTargetDestination = newValue
          }
    }
}

#Preview {
    BusSection(
        defaultOriginAndTargetDestinations: .constant(
            OriginAndTargetDestionation()
        )
    )
    
}
