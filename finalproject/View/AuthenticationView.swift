//
//  AuthenticationView.swift
//  finalproject
//
//  Created by Marc Atienza on 6/15/24.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                SignInView(showSignInView: $showSignInView)
            } label: {
                Text("Sign in to your account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Welcome")
    }
}

#Preview {
    NavigationStack{
        AuthenticationView(showSignInView: .constant(false))
    }
}
