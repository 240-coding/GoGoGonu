//
//  File.swift
//  GogoGonu
//
//  Created by 이서영 on 2022/04/23.
//

import SwiftUI

struct HowToPlayView: View {
    let text = "Welcome to GOGO Gonu!"
    let howToPlayText = """
        In this app, you can play the representative Gonu games, 'Woomul(well) Gonu' and 'Hobak(pumpkin) Gonu'. The common rules of both Gonu are as follows.
                             
        1. Two people play the game.
        2. Move a piece alternately with your opponent.
        3. You can only move your piece one space at a time.
        4. You win if you make your opponent's pieces unable to move anywhere.
        
        In Hobak Gonu, a rule is added that a piece that leaves the base cannot re-enter it, nor can it enter the opponent's base.
        
        You can enjoy the game whether you are alone or with your friends. Choose single mode if you're alone, or multi mode if you have someone to play with.
        """
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .border(Color("YellowColor"), width: 15)
                .ignoresSafeArea()
            Header(title: "HowToPlayTitle")
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Image("WoomulImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        Spacer()
                        Image("HobakImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                    .frame(width: 500)
                    .padding(.vertical, 50)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Welcome to Go Go Gonu! In this app, you can play a game called Gonu.")
                            Text("🤔 What is Gonu?")
                                .font(.title)
                                .bold()
                            Text("Gonu is a Korean folk board game. It has been popular for a long time because it can be easily enjoyed anywhere by drawing a board on the ground, tree, or stone. Since it is a game that has been handed down for a long time, the types of games vary from region to region. Depending on the type of Gonu, the form of the board and the game rule are different.")
                            Text("🕹 How To Play")
                                .font(.title)
                                .bold()
                            Text(howToPlayText)
                        }.padding(.horizontal, 50)
                    }
                    Text("Hope you enjoy playing the game! 😊👍")
                        .font(.title2)
                        .bold()
                        .padding(.vertical, 30)
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("LetsPlayButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }
                }.frame(height: geometry.size.height * 0.8)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 20)
            }
            
        }.navigationBarHidden(true)
    }
}
