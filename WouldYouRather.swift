import SwiftUI

struct WouldYouRatherView: View {
    @State private var selectedOption: String?
    @State private var progress: Float = 0.00
    @State private var isFirstQuestionAnswered = false
    @State private var isSecondQuestionAnswered = false
    @State private var isThirdQuestionAnswered = false
    @State private var selectedOptions: [String] = []
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Color.darkGrayColor()
                        .edgesIgnoringSafeArea(.horizontal)
                        .frame(height: 150)
         
                    VStack {
                        VStack {
                            HStack {
                                Text("WOULD")
                                    .font(.system(size: 30, weight: .bold))
                                    .fontDesign(.monospaced)

                                Text("YOU")
                                    .fontDesign(.monospaced)
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)

                            }
                            HStack {
                                Text("\u{1F448}")
                                    .font(.system(size: 30))
                                Text("RATHER")
                                    .font(.system(size: 30, weight: .bold))
                                    .fontDesign(.monospaced)

                                Text("\u{1F449}")
                                    .font(.system(size: 30))
                            }
                        }

                        Text("Select what makes the most sense to you")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.darkGrayColor(), lineWidth: 1)
                )

                .padding()
                    
                if !isFirstQuestionAnswered {
                    createButton(text: "Never use a smartphone again 📵", isAnswered: isFirstQuestionAnswered, selectedOption: $selectedOption) {
                        delayAction {
                            selectedOptionChanges(option: "Never use a smartphone again 📵")
                            self.isFirstQuestionAnswered = true
                        }
                    }

                    orDivider()

                    createButton(text: "Never use a laptop again 💻", isAnswered: isFirstQuestionAnswered, selectedOption: $selectedOption) {
                        delayAction {
                            selectedOptionChanges(option: "Never use a laptop again 💻")
                            self.isFirstQuestionAnswered = true
                        }
                    }

                } else if !isSecondQuestionAnswered {
                    createButton(text: "Have the power to teleport 🚀", isAnswered: isSecondQuestionAnswered, selectedOption: $selectedOption) {
                        delayAction {
                            selectedOptionChanges(option: "Have the power to teleport 🚀")
                            self.isSecondQuestionAnswered = true
                        }
                    }

                    orDivider()

                    createButton(text: "Be able to time travel ⏳", isAnswered: isSecondQuestionAnswered, selectedOption: $selectedOption) {
                        delayAction {
                            selectedOptionChanges(option: "Be able to time travel ⏳")
                            self.isSecondQuestionAnswered = true
                        }
                    }
                } else if !isThirdQuestionAnswered {
                    createButton(text: "Always be 10 minutes late ⏰", isAnswered: isThirdQuestionAnswered, selectedOption: $selectedOption) {
                        delayAction {
                            selectedOptionChanges(option: "Always be 10 minutes late ⏰")
                            self.isThirdQuestionAnswered = true
                        }
                    }

                    orDivider()

                    createButton(text: "Always be 10 minutes early ⏰", isAnswered: isThirdQuestionAnswered, selectedOption: $selectedOption) {
                        delayAction {
                            selectedOptionChanges(option: "Always be 10 minutes early ⏰")
                            self.isThirdQuestionAnswered = true
                        }
                    }

                } else {
                    createButton(text: "Say everything twice as fast 🗣️", isAnswered: true, selectedOption: $selectedOption) {
                        selectedOptionChanges(option: "Have to say everything on twice the speed 🗣️")
                    }

                    orDivider()

                    createButton(text: "Say everything on half the speed 🗣️", isAnswered: true, selectedOption: $selectedOption) {
                        selectedOptionChanges(option: "Have to say everything on half the speed 🗣️")
                    }
                }

                ProgressBar(value: $progress, selectedOptions: $selectedOptions)
                    .frame(width: 200, height: 10)
                    .padding()
                
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                    .stroke(Color.lightGrayColor(), lineWidth: 2)
                    .padding(8)
            )
        }
    }
    
    struct ProgressBar: View {
        @Binding var value: Float
        @Binding var selectedOptions: [String]
        @State private var isShowingResultsModal = false
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Color.darkPurpleColor())
                    
                    withAnimation(){
                        
                        Capsule()
                            .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                            .foregroundColor(Color.darkPurpleColor())
                            .onReceive([self.value].publisher.first()) { _ in
                                if self.value >= 1.0 {
                                    self.isShowingResultsModal = true
                                }
                            }
                    }
                }
                .sheet(isPresented: $isShowingResultsModal) {
                    ResultsModal(selectedOptions: $selectedOptions, isShowingModal: $isShowingResultsModal)
                }
                
            }
        }
    }
    
    private func createButton(text: String, isAnswered: Bool, selectedOption: Binding<String?>, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
            if isAnswered {
                selectedOption.wrappedValue = nil
            }
        }) {
            Text(text)
                .padding()
                .padding(.horizontal)
                .foregroundColor(selectedOption.wrappedValue == text ? .gray : .black)
                .background(Color.lighterGrayColor())
                .clipShape(Capsule()) 
        }
    }

    
    private func selectedOptionChanges(option: String) {
        selectedOption = option
        progress += 0.25
        selectedOptions.append(option)
    }

    
    func orDivider() -> some View {
        HStack {
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 1)
            
            Text("OR")
                .padding()
                .bold()
                .foregroundColor(.white)
                .background(Color.darkPurpleColor())
                .clipShape(Capsule())
            
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 1)
        }
    }
    
    private func delayAction(_ action: @escaping () -> Void) {
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
               action()
           }
       }
    
}

struct WouldYouRatherView_Previews: PreviewProvider {
    static var previews: some View {
        WouldYouRatherView()
    }
}
