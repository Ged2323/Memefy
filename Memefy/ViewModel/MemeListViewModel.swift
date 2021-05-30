//
//  MemeListViewModell.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import Foundation

class MemeListViewModel: ObservableObject{
    
    @Published var memesData = [MemeAPIModel.Data.Memes]()
    
    func fetchAPIdata() {
        let apiService = APIService.shared
        apiService.getJSON(urlString: "\(API.get_memes)") { [weak self] (results: Result<MemeAPIModel, APIService.APIError>) in
            guard let self = self else { return }
            switch results {
            
            case .success(let memes):
                DispatchQueue.main.async {
                    print(memes.data.memes[0].name)
                    self.memesData = memes.data.memes
                    print(self.memesData.count)
                }
                
            case .failure(let apiError):
                switch apiError {
                
                case .error(let errorString):
                    print("error; \(errorString)")
                }
            }
        }
    }
}
