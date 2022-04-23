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
        GeometryReader { geometry in
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack {
                    Image("HowToPlayTitle")
                    Text("Welcome to GoGo Gonu!")
                    Text("Gonu is Korean traditional game.")
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("LetsPlayButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height * 0.9)
            }
        }.navigationBarHidden(true)
    }
}
