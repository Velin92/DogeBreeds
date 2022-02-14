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
            List(viewModel.breeds, id: \.id) { breed in
                BreedCellView(viewModel: viewModel.getCellViewModel(for: breed))
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
