//
//  File.swift
//  GogoGonu
//
//  Created by 이서영 on 2022/04/23.
//

import SwiftUI

struct PlayMenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            Header(title: "PlayMenuTitle")
            VStack {
                NavigationLink(destination: HobakGonu()) {
                    Image("HobakButton")
                }.padding()
                NavigationLink(destination: WoomulGonu()) {
                    Image("WoomulButton")
                }
            }
        }.navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}
