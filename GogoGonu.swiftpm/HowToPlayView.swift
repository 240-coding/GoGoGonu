//
//  File.swift
//  GogoGonu
//
//  Created by 이서영 on 2022/04/23.
//

import SwiftUI

struct HowToPlayView: View {
    let text = "Welcome to GOGO Gonu!"
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            Header(title: "HowToPlayTitle")
            VStack {
                Text("Welcome to GoGo Gonu!")
                Text("Gonu is Korean traditional game.")
                //                    Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("LetsPlayButton")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                }
            }
        }.navigationBarHidden(true)
    }
}
