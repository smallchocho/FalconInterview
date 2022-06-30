//
//  NewsService.swift
//  FalconInterview
//
//  Created by Justin Haung on 2022/6/30.
//

import Foundation

typealias GetNewsListHandler = ResfulHandler<NewsVector>

class NewsService {
    private init() {}
    
    static func getNewsList(completion: @escaping GetNewsListHandler) {
        RESTfulService.asyncRESTfulService(.get, targetType: NewsVector.self, url: getVectorApi, body: nil, header: nil, completion: completion)
        }
    }



struct NewsVector: Codable {
    let getVector: Vector
}

struct Vector: Codable {
    let items: [VectorItem]
}

struct VectorItem: Codable {
    let type: VectorItemType
    
    // For divier
    let title: String?
    
    // For news
    let appearance: NewsAppearance?
    let ref: String?
    let extra: NewsExtra?
    
}

enum VectorItemType: String, Codable {
    static var defaultCase: VectorItemType = .unknown
    
    case divider
    case news
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        self = Self(rawValue: rawValue) ?? Self.defaultCase
    }
}

struct NewsAppearance: Codable {
    enum CodingKeys: String, CodingKey {
        case mainTitle
        case subTitle
        case thumbnail
        case _subscript = "subscript"
    }
    
    var mainTitle: String?
    var subTitle: String?
    var thumbnail: String?
    var _subscript: String?
}

struct NewsExtra: Codable {
    let created: Date?
}
