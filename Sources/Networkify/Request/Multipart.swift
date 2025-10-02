//
//  Multipart.swift
//  Networkify
//
//  Created by Marcin Polak on 02/10/2025.
//

import Foundation

public struct Multipart {
    public enum Part {
        case image(Image)
        case data(Data)
    }

    public struct Image {
        public let fileName: String
        public let mimeType: String
        public let data: Data

        public init(
            fileName: String,
            mimeType: String,
            data: Data
        ) {
            self.fileName = fileName
            self.mimeType = mimeType
            self.data = data
        }
    }

    public let name: String
    public let part: Part

    public init(name: String, part: Part) {
        self.name = name
        self.part = part
    }
}
