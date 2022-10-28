//
//  ContentView.swift
//  ReactionsView
//
//  Created by XING ZHAO on 2022-10-26.
//

import SwiftUI

struct ContentView: View {
    @State private var showReaction = false
    
    let inboundBubbleColor = Color(#colorLiteral(red: 0.07058823529, green: 0.07843137255, blue: 0.0862745098, alpha: 1))
    let reactionsBGColor = Color(#colorLiteral(red: 0.05490196078, green: 0.09019607843, blue: 0.137254902, alpha: 1))
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .frame(width: 216, height: 40)
                .foregroundColor(Color(.systemGray6))
                .scaleEffect(CGFloat(showReaction ? 1 : 0), anchor: .topTrailing)
                .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: showReaction)
            
            HStack(spacing: 20) {
                Image("heart")
                    //.offset(x: showReaction ? 0 : -15)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomTrailing) // bottomTrailing
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.1), value: showReaction)
                
                Image("thumbup")
                    .offset(x: showReaction ? 0 : -15)
                    .scaleEffect(showReaction ? 1 :0, anchor: .bottom) // bottom
                    .rotationEffect(.degrees(showReaction ? 0 : 45))
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8), value: showReaction)
                
                Image("thumbdown")
                    .scaleEffect(showReaction ? 1 : 0,anchor: .topTrailing)// topTrailing
                    .rotationEffect(.degrees(showReaction ? 0 : -45))
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8), value: showReaction)
                
                Image("crying")
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottom) // bottom
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8), value: showReaction)
                
                Image("sad")
                    .offset(x: showReaction ? 0 : 15) // bottomTrailing
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomTrailing)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8), value: showReaction)
            }
            .padding()
        }
        .onAppear {
            showReaction.toggle()
        }
        .onTapGesture {
            showReaction.toggle()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
