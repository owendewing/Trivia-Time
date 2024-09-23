//
//  signupPage.swift
//  trivia
//
//  Created by Owen Dewing on 4/29/23.
//

import SwiftUI
import Firebase

struct signupPage: View {
    @StateObject var loginModel: LoginViewModel = LoginViewModel()
    @State private var userLogIn = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Sign Up Now")
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
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.black)
                                .shadow(radius: 10)
                        )
                        .foregroundColor(.white)
                        .padding(.top,20)
                }
                .disabled(loginModel.email == "" || loginModel.password == "")
                .opacity(loginModel.email == "" || loginModel.password == "" ? 0.5 : 1)
                NavigationLink(destination: titlePage().navigationBarBackButtonHidden(true)){
                    Text("Back to log-in")
                        .padding(.top,40)
                }
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: loginModel.email, password: loginModel.password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct signupPage_Previews: PreviewProvider {
    static var previews: some View {
        signupPage()
    }
}
