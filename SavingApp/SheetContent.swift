//
//  BookPage.swift
//  SavingApp
//
//  Created by Mora on 26/05/25.
//

import SwiftUI

struct BookPage: View {
    
    @State private var bookName = ""
    @State private var showSheet = false
    @State private var selectedImageName: String?
    let imageNames = ["house", "star", "bolt", "heart", "cloud", "sun.max"]
    
    var body: some View {
        VStack {
            Image("book")
            Text("Set up your book first")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top)
            TextField("Enter your book name", text: $bookName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 3)
            
            VStack {
                HStack(spacing: 20) {
                    if let imageName = selectedImageName {
                        Image(systemName: imageName)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding()
                    } else {
                        Text("No image selected")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button("Choose Icon") {
                        showSheet = true
                    }
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemGray6))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .padding()
            }
            .sheet(isPresented: $showSheet) {
                SheetContent(imageNames: imageNames) { selected in
                    selectedImageName = selected
                    showSheet = false
                }
            }
            Spacer()
            
            Button("Next") {
                showSheet = true
            }
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            
        }
        .padding(.top, 180)
        .navigationBarBackButtonHidden(true)
    }
}

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

#Preview {
    BookPage()
}
