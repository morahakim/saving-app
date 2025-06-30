//
//  OnboardingSlider.swift
//  SavingApp
//
//  Created by Mora on 28/05/25.
//


import SwiftUI

struct OnboardingSlider: View {
    @StateObject private var onboardingData = OnboardingData()
    @State private var currentPage = 0
    @State private var showSheet = false
    @State private var isNavigation = false
    
    let imageNames = ["house", "star", "bolt", "heart", "cloud", "sun.max"]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                // Page 0: Book setup
                VStack {
                    Image("book")
                    Text("Set up your book first")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    TextField("Enter your book name", text: $onboardingData.bookName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                    
                    HStack(spacing: 20) {
                        if let imageName = onboardingData.selectedImageName {
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
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemGray6)))
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4), lineWidth: 1))
                    .padding()
                    
                    Spacer()
                    Button("Next") {
                        withAnimation {
                            currentPage = 1
                        }
                    }
                    .padding()
                    .background(Color(red: 0.44, green: 0.15, blue: 0.27))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top, 180)
                .tag(0)
                .sheet(isPresented: $showSheet) {
                    SheetContent(imageNames: imageNames) { selected in
                        onboardingData.selectedImageName = selected
                        showSheet = false
                    }
                }

                // Page 1: Account setup
                VStack {
                    Image("save-money")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                    Text("Set up your account")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top)
                    TextField("Enter your account name", text: $onboardingData.accountName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                    TextField("Enter your balance", text: $onboardingData.balance)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 3)

                    Spacer()
                    Button("Next") {
                        withAnimation {
                            currentPage = 2
                        }
                    }
                    .padding()
                    .background(Color(red: 0.44, green: 0.15, blue: 0.27))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top, 180)
                .tag(1)
                
                // Page 2: Confirmation
                VStack {
                    Image("confetti")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                    Text("Manage your money easily with save+")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top)
                   
                    NavigationLink(destination: HomeView(data: onboardingData), isActive: $isNavigation) {
                        EmptyView()
                    }
                    
                    Spacer()
                    Button("Finish") {
                        isNavigation = true
                    }
                    .padding()
                    .background(Color(red: 0.44, green: 0.15, blue: 0.27))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top, 180)
                .tag(2)

            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 8) {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(index == currentPage ? Color.pink : Color.gray.opacity(0.4))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden(true)
    }
}


class OnboardingData: ObservableObject {
    @Published var bookName: String = ""
    @Published var selectedImageName: String?
    @Published var accountName: String = ""
    @Published var balance: String = ""
}
