//
//  YoutubeSearchResponse.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/7/23.
//

import Foundation

// based on youtube GET API object
struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
