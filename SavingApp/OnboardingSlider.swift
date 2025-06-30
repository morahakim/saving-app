import SwiftUI

struct OnboardingSlider: View {
    @State private var currentPage = 0
    @State private var bookName = ""
    @State private var selectedImageName: String?
    @State private var accountName = ""
    @State private var balance = ""
    @State private var showSheet = false
    
    let imageNames = ["house", "star", "bolt", "heart", "cloud", "sun.max"]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                // Book Page
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
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top, 180)
                .tag(0)
                .sheet(isPresented: $showSheet) {
                    SheetContent(imageNames: imageNames) { selected in
                        selectedImageName = selected
                        showSheet = false
                    }
                }

                // Setup Account Page
                VStack {
                    Image("save-money")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                    Text("Set up your account")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top)
                    TextField("Enter your account name", text: $accountName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                    TextField("Enter your balance", text: $balance)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 3)

                    Spacer()
                    Button("Finish") {
                        // Action on finish
                    }
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top, 180)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // hide default dots
            
            // Custom page indicator
            HStack(spacing: 8) {
                ForEach(0..<2) { index in
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
