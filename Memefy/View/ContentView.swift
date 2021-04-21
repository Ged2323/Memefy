//
//  ContentView.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @StateObject var memeListViewModel = MemeListViewModel()
    
    var body: some View {
        NavigationView {
            List (memeListViewModel.memesData, id: \.id) { meme in
                NavigationLink (destination:
                                    DetailView(imageURL: "\(meme.url)", imageTitle: meme.name),
                label: {
                    ZStack {
                        KFImage(URL(string: "\(meme.url)"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        Text("\(meme.name)")
                            .font(.title3).bold()
                            .padding()
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                })
            }
                .navigationBarTitle("Memefy" ,displayMode: .inline)
        }
        .onAppear {
            memeListViewModel.fetchAPIdata()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
