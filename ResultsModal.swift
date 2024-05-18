import SwiftUI

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}


struct ResultsModal: View {
    @Binding var selectedOptions: [String]
    @Binding var isShowingModal: Bool
    @State private var chatMessage: String = ""
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    ZStack {
                        Rectangle()
                            .cornerRadius(20, corners: [.topRight, .topLeft])
                            .foregroundColor(Color.darkGrayColor())
                            .frame(height: 100)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                self.isShowingModal = false
                            }) {
                                Text("X")
                            }
                            .padding()
                            .offset(y:-20)
                            .foregroundColor(.white)
                            .bold()
                            .cornerRadius(10)
                        }
                    }
                    
                    ZStack {
                        HStack {
                            Text("WOULD")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.leading, 55)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("YOU")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.trailing, 55)
                        }
                    }
                    
                    HStack {
                        Text("\u{1F448}")
                            .font(.system(size: 40))
                        Text("RATHER")
                            .font(.system(size: 40, weight: .bold))

                        Text("\u{1F449}")
                            .font(.system(size: 40))

                    }
                    Spacer()
                    Spacer()
                    
                    HStack {
                        Text("All")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color.darkPurpleColor())
                            .padding(.leading, 4)
                        
                        Text("options")
                            .font(.system(size: 30))
                            .italic()
                            .foregroundColor(Color.darkPurpleColor())
                            .padding(.trailing, 4)
                    }
                    
                    Text("unlocked!")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.darkPurpleColor())
                        .padding(.trailing, 4)
                    
                    VStack{
                        List {
                            ForEach(selectedOptions.indices, id: \.self) { index in
                                HStack {
                                    Circle()
                                        .foregroundColor(Color.lighterGrayColor())
                                        .frame(width: 32, height: 32)
                                        .overlay(
                                            Text("\(index + 1)")
                                                .font(.title3)
                                                .foregroundColor(Color.darkPurpleColor())
                                                .scaleEffect(0.8)
                                                .bold()
                                        )
                                    
                                    Text(selectedOptions[index])
                                        .font(.callout)
                                        .foregroundColor(Color.darkerGrayColor())
                                        .padding(.leading, 8)
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                        
                        HStack {
                            TextField(
                                "Chat time! Say Hi!",
                                text: $chatMessage
                            )
                            .foregroundColor(chatMessage.isEmpty ? .gray : .black)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                Capsule()
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .overlay(
                                ZStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            self.isShowingModal = false
                                            chatMessage = self.chatMessage
                                            
                                        }) {
                                            ZStack {
                                                Circle()
                                                    .fill(Color.darkPurpleColor())
                                                    .frame(width: 40, height: 40)
                                                    .padding(.trailing, 10)
                                                
                                                Image(systemName: "arrow.up")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 18, height: 24)
                                                    .foregroundColor(.white)
                                                    .padding(.trailing, 10)
                                            }
                                        }
                                    }
                                }
                            )
                            .padding()
                        }
                        
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                )
                .padding()
            }
            
        }
        
    }
}


struct ResultsModal_Preview: PreviewProvider {
    static var previews: some View {
        ResultsModal(selectedOptions: .constant(["test", "test2", "test3", "test4"]), isShowingModal: .constant(true))
    }
}

