//
//  DarkCircle.swift
//  CircularProgressBar
//
//  Created by Yali on 2024/11/6.
//

import SwiftUI

struct DarkCircle: View {
    @ObservedObject var tm = TimerManager()
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.8)
            
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200,height: 200)
                .blur(radius: 10)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.07),.clear]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200,height: 200)
                .blur(radius: 10)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,.white.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Circle()
                .stroke(lineWidth: 30)
                .frame(width: 200,height: 200)
                .foregroundColor(.black.opacity(0.7))
            
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 150,height: 150)
                .blur(radius: 5)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,.white.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 150,height: 150)
                .blur(radius: 5)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.7),.clear]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Circle()
                .trim(from:0,to:tm.showValue ? tm.value : 0)
                .stroke(style: StrokeStyle(lineWidth: 24,lineCap: .round))
                .frame(width: 200,height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
          
            NumVlaue(displayedValue: tm.displayedValue, color: .white)
            
        }
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation(.linear.speed(0.2)){
                tm.showValue.toggle()
                tm.startTimer()
            }
        }
    }
}

#Preview {
    DarkCircle()
        .environmentObject(TimerManager())
}
