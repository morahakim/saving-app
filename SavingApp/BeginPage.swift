//
//  BeginPage.swift
//  SavingApp
//
//  Created by Mora on 26/05/25.
//

import SwiftUI

struct BeginPage: View {
    
    @State var isNavigation = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Image("money")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()

                Text("Save+")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)

                Text("A Simple Money Manager")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
                Spacer()
                
                NavigationLink(destination: OnboardingSlider(), isActive: $isNavigation) {
                                    EmptyView()
                                }

                Button(action: {
                    isNavigation = true
                }) {
                    Text("Let's Begin")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.44, green: 0.15, blue: 0.27))
                        .cornerRadius(30)
                }
                .padding(.horizontal)

               
            }
            .padding()
        }
       
    }
}

#Preview {
    BeginPage()
}

