//
//  SignInView.swift
//  finalproject
//
//  Created by Marc Atienza on 6/15/24.
//

import SwiftUI

@MainActor
final class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "No email or password found."
            return
        }
        
        try await AuthenticationModel.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "No email or password found."
            return
        }
        
        try await AuthenticationModel.shared.signInUser(email: email, password: password)
    }
}

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    @Binding var showSignInView: Bool
    @State private var showSignUpView = false
    
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task {
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                    } catch {
                        viewModel.errorMessage = error.localizedDescription
                    }
                }
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            NavigationLink(
                destination: SignUpView(),
                isActive: $showSignUpView
            ) {
                Button("Don't have an account? Sign Up") {
                    showSignUpView = true
                }
                .padding(.top, 10)
            }
        }
        .padding()
        .navigationTitle("Sign in using email")
    }
}

#Preview {
    NavigationStack {
        SignInView(showSignInView: .constant(false))
    }
}
