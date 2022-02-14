//
//  ContentView.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import SwiftUI

struct BreedsListView: View {
    @ObservedObject private var viewModel = BreedsListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredBreeds, id: \.id) { breed in
                NavigationLink(
                    destination: BreedView(
                        viewModel: viewModel.getDetailViewModel(for: breed)
                    )
                ) {
                    BreedCellView(viewModel: viewModel.getCellViewModel(for: breed))
                }
            }
            .navigationTitle("Doge Breeds")
            .toolbar {
                Button(action: {
                    viewModel.isFilterEnabled.toggle()
                }, label: {
                    Image(systemName: viewModel.isFilterEnabled ? "star.fill" : "star" )
                })
            }
            .onAppear(perform: self.viewModel.onAppear)
        }
    }
}

struct BreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsListView()
    }
}
