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
                }.padding(.leading, 50)
                Spacer()
                Image(title)
                    .frame(alignment: .center)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "arrow.forward.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }.padding(.trailing, 50)
                    .hidden()
            }.position(x: geometry.size.width / 2, y: geometry.size.height * 0.075)
        }
        
    }
}
