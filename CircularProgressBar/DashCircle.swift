//
//  DashCircle.swift
//  CircularProgressBar
//
//  Created by Yali on 2024/11/6.
//

import SwiftUI

struct DashCircle: View {
    @ObservedObject var tm = TimerManager()
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.8)
            
            ZStack{
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 20,dash: [3,4.5]))
                    .frame(width: 200,height: 200)
                
                Circle()
                    .trim(from: 0,to: tm.showValue ? tm.value : 0)
                    .stroke(style: StrokeStyle(lineWidth: 20,dash: [3,4.5]))
                    .frame(width: 200,height: 200)
                    .foregroundColor(.green)
            
                Circle()
                    .trim(from: 0,to: tm.showValue ? tm.value : 0)
                    .stroke(style: StrokeStyle(lineWidth: 20,dash: [3,4.5]))
                    .frame(width: 200,height: 200)
                    .foregroundColor(.green)
                    .blur(radius: 15)
            }
            .rotationEffect(.degrees(-90))
            
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
    DashCircle()
        .environmentObject(TimerManager())
}
