//
//  SignUpView.swift
//  finalproject
//
//  Created by Marc Atienza on 6/16/24.
//

import SwiftUI

@MainActor
final class SignUpViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func signUp() async {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required."
            return
        }
        
        do {
            let _ = try await AuthenticationModel.shared.createUser(email: email, password: password)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
            
            Button(action: {
                Task {
                    await viewModel.signUp()
                    if viewModel.errorMessage.isEmpty {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }) {
                Text("Sign Up")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
            }
            .padding(.top, 20)
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Create Account")
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
