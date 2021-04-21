//
//  ContentView.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List (0..<MemeModel.dummtData.count){index in
                NavigationLink (destination:
                                    DetailView(image: MemeModel.dummtData[index].title, imageTitle: MemeModel.dummtData[index].name),
                label: {
                    ZStack {
                        Image(MemeModel.dummtData[index].title)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        Text("\(MemeModel.dummtData[index].name)")
                            .font(.title3).bold()
                            .padding()
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                })
            }
                .navigationBarTitle("Memefy" ,displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
