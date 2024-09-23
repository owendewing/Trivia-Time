//
//  transition.swift
//  trivia
//
//  Created by Owen Dewing on 4/29/23.
//

import SwiftUI
import Firebase

struct transition: View {
    @AppStorage("log_status") var logStatus: Bool = false

    var body: some View{
        NavigationView{
            if logStatus {
                ContentView()
            }
            else{
                titlePage()
                    .navigationBarHidden(true)
            }
        }
    }
}

struct transition_Previews: PreviewProvider {
    static var previews: some View {
        transition()
    }
}
