//
//  Document.swift
//  SimpleTextEditorSwiftUI 2.0
//
//  Created by Yurii Sameliuk on 06/03/2021.
//

import SwiftUI

struct EditorMenuView: View {
    
    @State private var file = ""
    @State private var isChange = false
    @State private var isChangeColor = false
    @State private var isChangeFont = false
    @State private var isChangeStyle = false
    @State private var isChangePosition = false
    @State private var isHide = false
    @State private var changesColor: Color = .black
    @State private var tap = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 10) {
                VStack(spacing: 10) {
                    header
                    HStack {
                        Text("Chose Your Modified Option")
                            .font(.system(size: 20, weight: .light, design: .serif)).italic()
                            .foregroundColor(Color(.black))
                            .shadow(color: Color.white, radius: 20, x: 15, y: 15)
                        
                        Button(action: {
                            tap.toggle()
                        }, label: {
                            Image(systemName: "chevron.up")
                                .foregroundColor(.black)
                                .rotationEffect(tap ? .degrees(-180) : .zero)
 
                        })
                    }
                    
                    Divider()
                    
                }
                .frame(height: tap ? nil : 60, alignment: .top)
                .anchorPreference(key: LocationPreferenceKey.self, value: .bottomTrailing, transform: {
                    [LocationPreferenceKey.Data(isSelected: false, anchorPoint: $0)]
                    
                })
                
                if tap {
                    HStack(spacing: 20) {
                        VStack {
                            Text("Font")
                                .font(.system(size: 15, weight: .light, design: .serif)).italic()
                                .foregroundColor(Color(.black))
                                .shadow(color: Color.white, radius: 20, x: 15, y: 15)
                                .padding(.bottom, 2)
                            
                            Button(action: {
                                isChange.toggle()
                            }) {
                                ZStack {
                                    Text("Bold")
                                        .opacity(isChange ? 0.1 : 1)
                                        .foregroundColor(Color.black.opacity(0.3))
                                        .scaleEffect( 0.7)
                                    
                                    Text("Bold")
                                        .clipShape(Rectangle().offset(y: isChange ? 0 : 75))
                                        .animation(.easeInOut(duration: 0.4))
                                        .foregroundColor(Color.black.opacity(1))
                                        .opacity(isChange ? 1: 0.1)
                                        .scaleEffect(0.7)
                                }
                            }
                            .buttonStyle(CustomButtonStyle(isSelected: isChange))
                        }
                        
                        VStack {
                            Text("Italic")
                                .font(.system(size: 15, weight: .light, design: .serif)).italic()
                                .foregroundColor(Color(.black))
                                .shadow(color: Color.white, radius: 20, x: 15, y: 15)
                                .padding(.bottom, 2)
                            
                            Button(action: {
                                isChangeColor.toggle()
                            }) {
                                ZStack {
                                    
                                    Text("Italic")
                                        .opacity(isChangeColor ? 0.1 : 1)
                                        .foregroundColor(Color.black.opacity(0.3))
                                        .scaleEffect( 0.7)
                                    
                                   Text("Italic")
                                       .clipShape(Rectangle().offset(y: isChangeColor ? 0 : 75))
                                       .animation(.easeInOut(duration: 0.4))
                                        .foregroundColor(Color.black.opacity(1))
                                       .opacity(isChangeColor ? 1: 0)
                                        .scaleEffect(0.7)
                                }
                            }
                            .buttonStyle(CustomButtonStyle(isSelected: isChangeColor))
                        }
                        VStack {
                            Text("Straight")
                                .font(.system(size: 15, weight: .light, design: .serif)).italic()
                                .foregroundColor(Color(.black))
                                .shadow(color: Color.white, radius: 20, x: 15, y: 15)
                                .padding(.bottom, 2)
                            
                            Button(action: {
                                isChangeFont.toggle()
                            }) {
                                ZStack {
                                    Text("⎯")
                                        .opacity(isChangeFont ? 0.1 : 1)
                                        .foregroundColor(Color.black.opacity(0.3))
                                        .scaleEffect(0.7)
                                    
                                   Text("⎯")
                                       .clipShape(Rectangle().offset(y: isChangeFont ? 0 : 75))
                                       .animation(.easeInOut(duration: 0.4))
                                        .foregroundColor(Color.black.opacity(1))
                                       .opacity(isChangeFont ? 1: 0)
                                    .scaleEffect(0.7)
                                }
                            }
                            .buttonStyle(CustomButtonStyle(isSelected: isChangeFont))
                        }
                       
                        VStack {
                        Text("Circle")
                            .font(.system(size: 15, weight: .light, design: .serif)).italic()
                            .foregroundColor(Color(.black))
                            .shadow(color: Color.white, radius: 20, x: 15, y: 15)
                            .padding(.bottom, 2)
                            Button(action: {
                                isChangeStyle.toggle()
                            }) {
                                ZStack {
                                    Text("𝝤")
                                        .opacity(isChangeStyle ? 0.1 : 1)
                                        .foregroundColor(Color.black.opacity(0.3))
                                        .scaleEffect(0.8)
                                    
                                   Text("𝝤")
                                       .clipShape(Rectangle().offset(y: isChangeStyle ? 0 : 75))
                                       .animation(.easeInOut(duration: 0.4))
                                        .foregroundColor(Color.black.opacity(1))
                                       .opacity(isChangeStyle ? 1: 0)
                                    .scaleEffect(0.8)
                                }
                            }
                            .buttonStyle(CustomButtonStyle(isSelected: isChangeStyle))
                        }
                        
                        VStack {
                        Text("Semi")
                            .font(.system(size: 15, weight: .light, design: .serif)).italic()
                            .foregroundColor(Color(.black))
                            .shadow(color: Color.white, radius: 20, x: 15, y: 15)
                            .padding(.bottom, 2)
                        Button(action: {
                            isChangePosition.toggle()
                        }) {
                            ZStack {
                                Text("(")
                                    .opacity(isChangePosition ? 0.1 : 1)
                                    .foregroundColor(Color.black.opacity(0.3))
                                    .scaleEffect(0.9)
                                
                               Text("(")
                                   .clipShape(Rectangle().offset(y: isChangePosition ? 0 : 75))
                                   .animation(.easeInOut(duration: 0.4))
                                    .foregroundColor(Color.black.opacity(1))
                                   .opacity(isChangePosition ? 1: 0)
                                .scaleEffect(0.9)
                            }
                            .rotationEffect(Angle(degrees: 90))
                        }
                        .buttonStyle(CustomButtonStyle(isSelected: isChangePosition))
                        }
                    }
                    .transition(EditorMenuView.height.animation(.linear(duration: 0.2)))
                        }
                        
                }
                Spacer()
                ColorPicker("Color", selection: $changesColor)
                
            }
        .frame(maxWidth: .infinity, maxHeight: tap ? 250 : 150)
            .background(Color(#colorLiteral(red: 0.7856134772, green: 0.8419756293, blue: 0.9575102925, alpha: 1)).edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.all)
            .overlayPreferenceValue(LocationPreferenceKey.self) { _ in }
        }
        
    }

private extension EditorMenuView {
    var header: some View {
        HStack(spacing: 10) {
            Text("Your Simple Editor")
                .font(.system(size: 22, weight: .ultraLight, design: .serif)).italic()
                .padding(.leading, 15)
                .foregroundColor(Color(.black))
                .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) , radius: 20, x: 15, y: 15)
            Spacer()
            Image(systemName: "highlighter")
                .renderingMode(.template)
                .font(.system(size: 25, weight: .bold))
                .offset(y: -5)
                .shadow(color: .white, radius: 20, x: 15, y: 15)
        }
        .frame(width: UIScreen.main.bounds.width, height: 70)
        .background(
            ZStack {
                Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .foregroundColor(.white)
                    .blur(radius: 4)
                    .offset(x: -8, y: -8)
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8293729424, green: 0.8888757229, blue: 1, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .foregroundColor(Color(#colorLiteral(red: 0.8293729424, green: 0.8888757229, blue: 1, alpha: 1)))
                    .padding(2)
                    .blur(radius: 2)
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
    }
}

private extension EditorMenuView {
    struct LocationPreferenceKey : PreferenceKey {
        typealias Value = [Data]
        
        static var defaultValue: [Data] = []
        
        static func reduce(value: inout [Data], nextValue: () -> [Data]) {
            value.append(contentsOf: nextValue())
        }
        
        struct Data {
            var isSelected: Bool
           var anchorPoint: Anchor<CGPoint>
        }
    }
}

private extension EditorMenuView {
        static let height = AnyTransition.modifier(active: HeightTransition(scale: 0.0),
                                                   identity: HeightTransition(scale: 1.0))
        
        struct HeightTransition: ViewModifier {
            var scale: CGFloat
            
            func body(content: Content) -> some View {
                content.scaleEffect(CGSize(width: 1.0, height: scale),
                                    anchor: .center)
            }
        }
    }

struct Document_Previews: PreviewProvider {
    static var previews: some View {
        EditorMenuView()
            .previewLayout(.sizeThatFits)
    }
}
