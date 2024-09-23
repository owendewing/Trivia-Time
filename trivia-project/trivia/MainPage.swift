//
//  mainPage.swift
//  trivia
//
//  Created by Owen Dewing on 4/29/23.
//

import SwiftUI
import Firebase

struct mainPage: View {
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View{
        VStack{
            Text("Logged in")
            Button("Logout"){
                try? Auth.auth().signOut()
                logStatus = false
            }
        }
    }
}

struct mainPage_Previews: PreviewProvider {
    static var previews: some View {
        mainPage()
    }
}
