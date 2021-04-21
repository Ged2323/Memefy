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
    var boxCountNumber = 2
    @State var addedlabel: [String] = ["", "" , "", "" , "", ""]
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                KFImage(URL(string: imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                
                Spacer()
                
                ForEach(0..<boxCountNumber) { index in
                    ZStack{
                        VStack {
                            TextField("Label \(index + 1)", text: $addedlabel[index],onCommit: {
                                print(addedlabel)
                            })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        showTextOrNot(label: addedlabel[index])
                            .onTapGesture {
                                print(addedlabel[index])
                            }
                    }
                }
                
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

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

extension DetailView {
    @ViewBuilder
    func showTextOrNot(label: String) -> some View {
        if label.isEmpty {
            Text("")
        } else {
            Text("\(label)")
                .font(.title2)
                .foregroundColor(Color.black)
                .padding()
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
