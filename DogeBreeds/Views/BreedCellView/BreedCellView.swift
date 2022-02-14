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
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            VStack {
                Text(viewModel.breedText)
                    .lineLimit(1)
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                Text(viewModel.subBreedsText)
                    .lineLimit(1)
                    .font(.body)
                    .minimumScaleFactor(0.5)
            }
            .padding()
            Spacer()
            Button {
                viewModel.favouriteTapped?()
            } label: {
                Image(systemName: viewModel.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 30, height: 30)
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
