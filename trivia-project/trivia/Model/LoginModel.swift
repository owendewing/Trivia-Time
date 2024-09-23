//
//  loginModel.swift
//  trivia
//
//  Created by Owen Dewing on 4/29/23.
//

import SwiftUI
import Firebase
import LocalAuthentication

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @AppStorage("log_status") var logStatus: Bool = false
    
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""
    
    func loginUser(email:String = "",password: String = "")async throws{
        
        let  _ = try await Auth.auth().signIn(withEmail: email != "" ? email : self.email, password: password != "" ? password : self.password)
        
        DispatchQueue.main.async {
            if self.email == ""{
                self.email = self.email
                self.password = self.password
            }
            self.logStatus = true
        }
    }
}
