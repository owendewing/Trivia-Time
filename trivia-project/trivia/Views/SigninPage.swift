//
//  signinPage.swift
//  trivia
//
//  Created by Owen Dewing on 4/29/23.
//

import SwiftUI
import Firebase

struct signinPage: View {
    @StateObject var loginModel: LoginViewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                Text("Sign In Now")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.system(size: 45.0).bold())
                TextField("Email", text: $loginModel.email)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                loginModel.email == "" ? Color.black.opacity(0.05) : Color("Green")
                            )
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.top, 20)
                SecureField("password", text: $loginModel.password)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                loginModel.password == "" ? Color.black.opacity(0.05) : Color("Green")
                            )
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.top, 20)
                Button{
                    Task{
                        do{
                            try await loginModel.loginUser()
                        }
                        catch{
                            loginModel.errorMsg = error.localizedDescription
                            loginModel.showError.toggle()
                        }
                    }
                } label: {
                    Text("Login")
                        .bold()
                        .frame(width: 200, height: 10)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.black))
                                .shadow(radius: 10)
                        .foregroundColor(.white)
                }
                .padding(.vertical,35)
                .disabled(loginModel.email == "" || loginModel.password == "")
                .opacity(loginModel.email == "" || loginModel.password == "" ? 0.5 : 1)
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: loginModel.email, password: loginModel.password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct signinPage_Previews: PreviewProvider {
    static var previews: some View {
        signinPage()
    }
}
