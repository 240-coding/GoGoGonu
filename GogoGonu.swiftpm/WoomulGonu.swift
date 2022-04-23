import SwiftUI

struct WoomulGonu: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            Header(title: "WoomulGonu")
            ZStack {
                WoomulShape()
            }
        }
            .navigationBarHidden(true)
    }
}
