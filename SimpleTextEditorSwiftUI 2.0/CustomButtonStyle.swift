//
//  CustomButtonStyle.swift
//  SimpleTextEditorSwiftUI 2.0
//
//  Created by Yurii Sameliuk on 06/03/2021.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var isSelected: Bool
    var height: CGFloat? = 45
    var width: CGFloat? = 45
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body)
            .frame(height: height, alignment: .center)
            .frame(width: width, alignment: .center)
            .scaleEffect(isSelected ? 1.2 : 1)
            .background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(isSelected ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) :  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) )]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                    Circle()
                        .stroke(Color.clear, lineWidth: 10)
                        .shadow(color: Color(isSelected ? #colorLiteral(red: 0.8293729424, green: 0.8888757229, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 3, x: -3, y: -3)
                    Circle()
                        .stroke(Color.clear, lineWidth: 10)
                        .shadow(color: Color(isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8293729424, green: 0.8888757229, blue: 1, alpha: 1)), radius: 3, x: 3, y: 3)
                }
            )
             .clipShape(Circle())
            .shadow(color: Color(isSelected ? #colorLiteral(red: 0, green: 0.8852791786, blue: 0, alpha: 1) : .white).opacity(0.5), radius: 5, x: 3, y: 3)
            .shadow(color: Color(isSelected ? #colorLiteral(red: 0, green: 0.8852791786, blue: 0, alpha: 1) : .white).opacity(0.5), radius: 5, x: -3, y: -3)
            .animation(.easeInOut)
            
            .shadow(color: Color(isSelected ? #colorLiteral(red: 0.8293729424, green: 0.8888757229, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 2, x: -1, y: -1)
            .shadow(color: Color(isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8293729424, green: 0.8888757229, blue: 1, alpha: 1)), radius: 2, x: 1, y: 1)
            .scaleEffect(isSelected ? 1.2 : 1)
    }
    
}
