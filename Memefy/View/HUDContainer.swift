//
//  HUDContainer.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/22.
//

import SwiftUI

struct HUDContainer<Content: View>: View {
    
    var bgColor: Color = .white
    var fgColor: Color = .black
    let content: Content
    @Binding var isShowingHud: Bool
    @Binding var isShowingFailed: Bool
    init(isShowingHud: Binding<Bool>, isShowingFailed: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isShowingHud = isShowingHud
        self._isShowingFailed = isShowingFailed
        self.content = content()
    }
    
    var body: some View {
        VStack {
            VStack {
                content
                    .padding(5)
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(bgColor))
            .foregroundColor(fgColor)
            .shadow(radius: 5)
            Spacer()
        }
        //force the hud always on top
        .transition(.move(edge: .top))
        .animation(.spring())
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    isShowingHud = false
                }
            }
        }
    }
    
}
