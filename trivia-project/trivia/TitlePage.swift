//
//  titlePage.swift
//  trivia
//
//  Created by Owen Dewing on 4/28/23.
//

import SwiftUI
import Firebase

struct titlePage: View {
    var body: some View {
        NavigationView{
        ZStack{
            Color.cyan
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Trivia Time")
                    .foregroundColor(.white)
                    .font(.system(size:60).bold())
                    .padding(.bottom,500)
                Text("Answer questions as fast as you can!")
                    .foregroundColor(.white)
                    .font(.system(size:20).bold())
                    .padding(.top,-450)
                    VStack{
                                NavigationLink(destination: signupPage().navigationBarBackButtonHidden(true)){
                                    
                                Text("sign up")
                                        .foregroundColor(.white)
                                    
                                    .bold()
                                    .frame(width: 200, height: 40)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.black)
                                            .shadow(radius: 10)
                                    )
                        }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.top, -200)
                                .foregroundColor(.black)
                                       }
                }
                Text("Already have an account?")
                    .padding(.top,420)
                    VStack{
                        NavigationLink(destination: signinPage().navigationBarBackButtonHidden(true)){
                            Text("log in")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.black)
                                    .shadow(radius: 10)
                            )
                            .padding(.top, 500)
                            .foregroundColor(.white)
                    }
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct titlePage_Previews: PreviewProvider {
    static var previews: some View {
        titlePage()
    }
}
