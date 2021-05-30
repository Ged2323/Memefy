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
    @State private var searchTerm = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                SearchBar(searchTerm: $searchTerm, isSearching: $isSearching)
               
                List ((memeListViewModel.memesData).filter({ $0.name.contains(searchTerm) || searchTerm.isEmpty }), id: \.id) { meme in
                    NavigationLink (destination:
                                        DetailView(imageURL: "\(meme.url)", imageTitle: meme.name, boxCountNumber: meme.boxCount),
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
                .listStyle(PlainListStyle())
                .navigationBarTitle("Memefy" ,displayMode: .inline)
            }
        }
        .onAppear {
            memeListViewModel.fetchAPIdata()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct SearchBar: View {
    
    @Binding var searchTerm: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search term", text: $searchTerm)
                    
                    .padding(.leading, 25)
                    .overlay (
                        HStack {
                            SFSymbols.maginify
                            Spacer()
                            
                            if isSearching {
                                Button(action: {
                                    isSearching = false
                                    searchTerm = ""
                                }, label: {
                                    SFSymbols.xmarkCircle
                                })
                                
                            }
                            
                            
                        }
                        .foregroundColor(Color(.systemGray2))
                    )
                    .transition(.move(edge: .trailing))
                    .animation(.easeIn)
                
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(12)
            .padding()
            .onTapGesture {
                withAnimation {
                    isSearching = true
                }
                
            }
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchTerm = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, isSearching ? -11 : -30)
                    
                })
                
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}
