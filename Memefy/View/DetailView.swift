//
//  DetailView.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    var imageURL: String = "https://i.imgflip.com/30b1gx.jpg"
    var imageTitle: String = "Drake Meme"
    @State var label1 = ""
    @State var label2 = ""
    
    var body: some View {
        NavigationView {
            
                VStack {
                    ZStack {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        showTextOrNot(label: label1)
                        showTextOrNot(label: label2)
                    }
                    
                    Spacer()
                    //TextField("abel 1", text: $label1)
                    TextField("Label 1", text: $label1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Label 2", text: $label2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                    }, label: {
                        Text("Save Image")
                    })
                    
                    
                }
                .padding()
                .navigationBarTitle(imageTitle,displayMode: .inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

extension DetailView {
    @ViewBuilder
    func showTextOrNot(label: String) -> some View {
        if label.isEmpty {
            Text("")
        } else {
            Text("\(label)")
                .bold()
                .font(.title2)
                .padding()
                .background(Color.black)
                .cornerRadius(15)
                
        }
    }
}

struct DetailViewContainer<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        content
    }
}
