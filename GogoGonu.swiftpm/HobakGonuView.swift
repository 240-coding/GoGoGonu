//
//  File.swift
//  GogoGonu
//
//  Created by 이서영 on 2022/04/23.
//

import SwiftUI

struct HobakGonuView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            Header(title: "HobakGonu")
            ZStack {
                HobakShape()
            }
        }
        .navigationBarHidden(true)
    }
}
