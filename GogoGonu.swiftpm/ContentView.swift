import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color("BackgroundColor")
                        .border(Color("RedColor"), width: 15)
                        .ignoresSafeArea()
                    VStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 450)
                        Spacer()
                        NavigationLink(destination: HowToPlayView()) {
                            Image("HowToPlayButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                        }
                        NavigationLink(destination: PlayMenuView()) {
                            Image("MainButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                        }.padding(.bottom, 80)
                    }.frame(height: geometry.size.height * 0.7)
                }
            }
        }.navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}
