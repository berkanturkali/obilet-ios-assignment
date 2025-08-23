//

import SwiftUI

struct FlightSectionSelectPassenger: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var viewModel = FlightSectionSelectPassengerViewModel()
    
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack {
                HStack(spacing: 8) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 20))
                    
                    Text(LocalizedStrings.passenger)
                        .font(.custom(Nunito.bold, size: 16))
                    
                    Spacer()
                    
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 20))
                        .onTapGesture {
                            viewModel.saveFilters()
                            dismiss()
                        }
                    
                }
                .foregroundColor(OBiletColors.onPrimary)
                .padding(.horizontal, 10)
                .padding()
                .background(OBiletColors.primary)
                
                ForEach(viewModel.passengerFilters.indices, id: \.self) { index in
                    self.passengerFilterItem(
                        title: viewModel.passengerFilters[index].filter.title,
                        count: viewModel.passengerFilters[index].count,
                        increaseButtonEnabled: viewModel.passengerFilters[index].canIncrease,
                        decreaseButtonEnabled: viewModel.passengerFilters[index].canDecrease,
                        onIncreaseButtonClick: { newCount in
                            viewModel.passengerFilters[index].count = newCount
                        },
                        onDecreaseButtonClick: { newCount in
                            viewModel.passengerFilters[index].count = newCount
                        }) {
                            let filterItem = viewModel.passengerFilters[index]
                            var adultList = viewModel.createAdultListFromFilterList(filterList: viewModel.passengerFilters)
                            let sumOfAdults = viewModel.getSumOfAdultsInTheAdultList(adultList: adultList)
                            
                            var updatedFilters = viewModel.passengerFilters
                            
                            if let index = viewModel.passengerFilters.firstIndex(where: { $0.id == filterItem.id }) {
                                var mutableItem = viewModel.passengerFilters[index]
                                
                                if mutableItem.filter == .baby {
                                    let canDecrease = viewModel.setBabyItemCanDecreaseIfCountOfTheBabyItemGreaterThanZero(
                                        babyItem: mutableItem
                                    )
                                    let canIncrease = viewModel.setBabyItemCanIncreaseIfCountOfTheBabyItemLessThanSumOfAdults(babyItem: mutableItem, sumOfAdults: sumOfAdults)
                                    mutableItem
                                        .updateCanDecrease(
                                            canDecrease: canDecrease
                                        )
                                    mutableItem.updateCanIncrease(canIncrease: canIncrease)
                                    let indexOfBaby = viewModel.findTheIndexOfBabyItemFromTheList(
                                        filterList: updatedFilters,
                                        babyItem: filterItem
                                    )
                                    viewModel
                                        .saveTheModifiedItemToTheFilterList(
                                            filterList: &updatedFilters,
                                            indexOfItem: indexOfBaby,
                                            item: mutableItem
                                        )
                                    viewModel
                                        .setTheAdultItemsCanIncreaseDecrease(
                                            adultList: &adultList,
                                            filterList: &updatedFilters,
                                            sumOfAdults: sumOfAdults,
                                            babyItem: mutableItem
                                        )
                                    viewModel.passengerFilters = updatedFilters
                                    
                                } else {
                                    let sumOfItemsExceptBaby = viewModel.getSumOfItemsFromFilterListExceptBabyItem(updatedFilters)
                                    for index in updatedFilters.indices {
                                        var item = updatedFilters[index]
                                        
                                        if item.filter != .baby {
                                            item.canDecrease = item.filter.isAdult
                                            ? adultList.reduce(0) { $0 + $1.count } > 1
                                            : item.count > 0
                                            
                                            item.canIncrease = sumOfItemsExceptBaby < 4
                                        } else {
                                            item.canIncrease = viewModel.setBabyItemCanIncreaseIfCountOfTheBabyItemLessThanSumOfAdults(
                                                babyItem: item,
                                                sumOfAdults: sumOfAdults
                                            )
                                            item.canDecrease = viewModel.setBabyItemCanDecreaseIfCountOfTheBabyItemGreaterThanZero(
                                                babyItem: item
                                            )
                                        }
                                        
                                        viewModel.saveTheModifiedItemToTheFilterList(filterList: &updatedFilters, indexOfItem: index, item: item)
                                    }
                                    
                                    viewModel.passengerFilters = updatedFilters
                                }
                            }
                        }
                }
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    private func passengerFilterItem(
        title: String,
        count: Int,
        increaseButtonEnabled: Bool,
        decreaseButtonEnabled: Bool,
        onIncreaseButtonClick: @escaping (
            Int
        ) -> Void,
        onDecreaseButtonClick: @escaping (
            Int
        ) -> Void,
        setIncreaseDecreaseStatusOfButtons: @escaping () -> Void
    ) -> some View {
        VStack {
            HStack(alignment: .center, spacing: 8) {
                Text(title)
                    .font(.custom(Nunito.medium, size: 14))
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button(action: {
                        if count > 0 && decreaseButtonEnabled {
                            viewModel.isIncrementing = false
                            withAnimation {
                                onDecreaseButtonClick(count - 1)
                                setIncreaseDecreaseStatusOfButtons()
                            }
                            
                        }
                    }) {
                        Text("-")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(
                                decreaseButtonEnabled ? OBiletColors.onPrimary : .white.opacity(
                                    0.5
                                )
                            )
                    }
                    
                    Circle().fill(
                        Color.white.opacity(
                            0.2
                        )
                    )
                    .frame(width: 24, height: 24, alignment: .center)
                    .overlay {
                        AnimatedCounterView(
                            count: count,
                            isIncrementing: viewModel.isIncrementing
                        )
                    }
                    
                    Button(action: {
                        if(increaseButtonEnabled) {
                            viewModel.isIncrementing = true
                            withAnimation {
                                onIncreaseButtonClick(count + 1)
                                setIncreaseDecreaseStatusOfButtons()
                            }
                        }
                    }) {
                        Text("+")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(
                                increaseButtonEnabled ? OBiletColors.onPrimary : .white.opacity(
                                    0.5
                                )
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                .foregroundColor(OBiletColors.onPrimary)
                .background(OBiletColors.primary)
                .clipShape(Capsule())
                .shadow(radius: 4)
                
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}

struct AnimatedCounterView: View {
    let count: Int
    let isIncrementing: Bool
    
    var body: some View {
        Text("\(count)")
            .font(.system(size: 14, weight: .bold))
            .transition(
                .asymmetric(
                    insertion: .move(edge: isIncrementing ? .top : .bottom),
                    removal: .move(edge: isIncrementing ? .bottom : .top)
                )
            )
            .id(count)
            .animation(.easeInOut(duration: 0.2), value: count)
    }
}

#Preview {
    FlightSectionSelectPassenger()
}
