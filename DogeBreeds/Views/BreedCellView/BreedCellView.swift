//
//  BreedCellView.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import SwiftUI

import Kingfisher

struct BreedCellView: View {
    let viewModel: BreedCellViewModel
    
    var body: some View {
        HStack {
            KFImage(viewModel.imageUrl)
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
            VStack {
                Text(viewModel.breedText)
                    .font(.title)
                Text(viewModel.subBreedsText)
                    .font(.body)
            }
            .padding()
            Spacer()
            Button {
                viewModel.favouriteTapped?()
            } label: {
                Image(systemName: viewModel.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .padding()
        }
    }
}

struct BreedCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BreedCellView(viewModel: .stub())
            BreedCellView(viewModel: .stub())
                .previewLayout(.fixed(width: 500, height: 200))
            BreedCellView(viewModel: .stub(isFavourite: true))
                .previewLayout(.fixed(width: 500, height: 200))
        }
    }
}
