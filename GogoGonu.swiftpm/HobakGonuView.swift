//
//  File.swift
//  GogoGonu
//
//  Created by 이서영 on 2022/04/23.
//

import SwiftUI

struct HobakGonuView: View {
    @ObservedObject var hobakData = HobakGonuData()

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            Header(title: "HobakGonu")
            HobakShape()
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                let radius = width * 0.3
                let lineSpace: CGFloat = 120
                
//                width2 = radius
                ZStack {
                    let stonesOffset = [[-radius-lineSpace, -radius-lineSpace], [0, -radius-lineSpace], [radius+lineSpace, -radius-lineSpace], [0, 0], [0, -radius], [-radius, 0], [radius, 0], [0, radius], [-radius-lineSpace, radius+lineSpace], [0, radius+lineSpace], [radius+lineSpace, radius+lineSpace]]
                    ForEach(0..<11) { index in
                        HobakStone(position: index, hobakData: self.hobakData)
                            .offset(x: stonesOffset[index][0], y: stonesOffset[index][1])
                    }
                }
                    .position(x: width / 2, y: height / 2)
            }
//            HobakStone()
//                .offset(x: 0, y: 100)
        }
        .navigationBarHidden(true)
    }
}
