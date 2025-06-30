//
//  HomeView.swift
//  SavingApp
//
//  Created by Mora on 28/05/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var data: OnboardingData

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.44, green: 0.15, blue: 0.27))
                    .frame(height: 150)
                    .padding(.horizontal)
                    .padding(.top, 40)
                HStack {
                    VStack {
                        if let icon = data.selectedImageName {
                            Image(systemName: icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        } else {
                            Image("book")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        Text(data.accountName.isEmpty ? "Your Book" : data.accountName)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.bottom)
                        
                        Text("Rp.\(data.balance.isEmpty ? "0" : data.balance)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Total Expense")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 30)
                    Spacer()
                }
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .ignoresSafeArea()
                
                Text("No transactions in this period!")
                    .foregroundColor(.white)
            }
        }
        .background(Color(red: 0.2, green: 0.07, blue: 0.1))
        .navigationBarBackButtonHidden(true)
    }
}


