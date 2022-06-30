//
//  NewsViewModel.swift
//  FalconInterview
//
//  Created by Justin Haung on 2022/6/30.
//

import Foundation
import UIKit

class NewsViewModel {
    
    typealias GetNewsListHandler = (Result<Void, Error>) -> Void
    
    private(set) var newsSections: [NewsSection] = []
    
    func getNewsList(completion: @escaping GetNewsListHandler) {
        NewsService.getNewsList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let newsVector):
                self.newsSections = self.convert(newsVector.getVector)
                completion(.success)
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    private func convert(_ vector: Vector) -> [NewsSection] {
        var result: [NewsSection] = []
        vector.items.forEach { item in
            switch item.type {
            case .divider:
                let title = item.title ?? "No title"
                result.append(NewsSection(title: title, items: []))
            case .news:
                let appearance = item.appearance
                let ref = item.ref
                let extra = item.extra
                result.last?.items.append(News(appearance: appearance, ref: ref, extra: extra))
            case .unknown:
                break
            }
        }
        return result
    }
}

class NewsSection {
    let title: String
    var items: [News]
    
    init(title: String, items: [News]) {
        self.title = title
        self.items = items
    }
}

class News {
    let appearance: NewsAppearance?
    let ref: String?
    let extra: NewsExtra?
    
    init(appearance: NewsAppearance?, ref: String?, extra: NewsExtra?) {
        self.appearance = appearance
        self.ref = ref
        self.extra = extra
    }
}
