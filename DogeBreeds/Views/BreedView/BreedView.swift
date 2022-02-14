//
//  BreedView.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 14/02/22.
//

import SwiftUI

import Kingfisher

struct BreedView: View {
    let viewModel: BreedViewModel
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            if !viewModel.subBreeds.isEmpty {
                LazyVStack(alignment: .leading) {
                    Text("Sub Breeds:")
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .font(.headline)
                        .minimumScaleFactor(0.5)
                    ForEach(viewModel.subBreeds, id: \.self) { subBreed in
                        Text(subBreed)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .font(.body)
                            .minimumScaleFactor(0.5)
                    }
                }
                .padding()
            }
            LazyVGrid(columns: columns) {
                ForEach(viewModel.images, id: \.self) { url in
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.title)
    }
}

struct BreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedView(viewModel: BreedViewModel.stub())
    }
}
