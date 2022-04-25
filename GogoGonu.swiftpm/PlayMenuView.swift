import SwiftUI

struct PlayMenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .border(Color("YellowColor"), width: 15)
                .ignoresSafeArea()
            Header(title: "PlayMenuTitle")
            VStack {
                
                NavigationLink(destination: WoomulGonuView()) {
                    VStack {
                        Image("WoomulImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180)
                            .padding(30)
                        Image("WoomulButton")
                    }
                }.padding(.bottom, 50)
                
                NavigationLink(destination: HobakGonuView()) {
                    VStack {
                        Image("HobakImage")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .padding(30)
                        Image("HobakButton")
                    }
                }
            }
        }.navigationViewStyle(.stack)
            .navigationBarHidden(true)
    }
}
