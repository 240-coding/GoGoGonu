//
//  File.swift
//  GogoGonu
//
//  Created by 이서영 on 2022/04/23.
//

import SwiftUI

struct MainButton: View {
    @State var buttonTitle = ""

    var body: some View {
        Button(self.buttonTitle) {
            print("Tapped")
        }
    }
}
