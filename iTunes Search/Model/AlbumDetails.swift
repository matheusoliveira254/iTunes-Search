//
//  AlbumDetails.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/2/22.
//

import Foundation

struct DetailsTopLevelDictionary: Decodable {
    let resultCount: Int
    let results: [SongDetails]
}

struct SongDetails: Decodable {
    let trackName: String?
    let trackTimeMillis: Int?
    let trackPrice: Double?
}
