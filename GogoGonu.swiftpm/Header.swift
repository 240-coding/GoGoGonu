//
//  File.swift
//  GogoGonu
//
//  Created by 이서영 on 2022/04/23.
//

import SwiftUI

struct Header: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var title = ""

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .foregroundColor(Color("BlackColor"))
                }.padding(.leading, 30)
                Spacer()
                Image(title)
                    .frame(alignment: .center)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "arrow.forward.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }.padding(.trailing)
                    .hidden()
            }.position(x: geometry.size.width / 2, y: geometry.size.height * 0.05)
        }
        
    }
}
