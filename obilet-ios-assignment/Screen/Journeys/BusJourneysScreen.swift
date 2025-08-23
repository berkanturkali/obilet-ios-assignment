//

import SwiftUI

struct BusJourneysScreen: View {
    
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel: BusJourneysScreenViewModel
    
    init(args: BusJourneysArgs) {
        _viewModel = StateObject(
            wrappedValue: BusJourneysScreenViewModel(
                args: args
            )
        )
    }
    
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            
            VStack(spacing: 12) {
                ZStack {
                    OBiletColors.primary.ignoresSafeArea()
                    ZStack {
                        VStack(spacing: 2) {
                            
                            Text(viewModel.args.originName)
                                .padding(.top)
                            
                            Text(viewModel.args.destinationName)
                     
                        }
                        .foregroundColor(OBiletColors.onPrimary)
                        .font(.custom(Nunito.bold, size: 14))
                        .frame(maxHeight: .infinity, alignment: .top)
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(OBiletColors.onPrimary)
                            .padding(8)
                            .background(
                                Circle().fill(Color.white.opacity(0.44))
                            )
                            .onTapGesture {
                                dismiss()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                        
                    }
                }.frame(height: 80)
                
                ScrollView {
                    LazyVStack(spacing: 14) {
                        ForEach(viewModel.journeys) { journey in
                            JourneyItem(
                                departureDate: viewModel.args.departureDate,
                                journey: journey
                            )
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BusJourneysScreen(
        args: BusJourneysArgs(
            originId: 1,
            destinationId: 1,
            departureDate: "11:02",
            originName: "Izmir",
            destinationName: "Ankara"
        )
    )
}
