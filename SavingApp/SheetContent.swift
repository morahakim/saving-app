//
//  SheetContent.swift
//  SavingApp
//
//  Created by Mora on 26/05/25.
//

import SwiftUI

struct SheetContent: View {
    let imageNames: [String]
    var onImageSelected: (String) -> Void

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(imageNames, id: \.self) { name in
                    Button(action: {
                        onImageSelected(name)
                    }) {
                        Image(systemName: name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 30)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

