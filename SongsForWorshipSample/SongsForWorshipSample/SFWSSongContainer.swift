//
//  SFWSSongContainer.swift
//  SongsForWorshipSample
//
//  Created by Philip Loden on 6/24/24.
//

import Foundation

struct SFWSSongContainer {
    public var number: String
    public var title: String = ""
    public var reference: String?
    public var verseLine1: String?
    public var verseLine2: String?
    public var stanzas: [String] = [String]()
    public var pdfPageNumbers: [Int]
    public var infoMeter: String?
    public var infoTune: String?
    public var infoComposer: String?
    public var infoTuneWithoutMeter: String?
    public var isTuneCopyrighted: Bool? = false

    enum CodingKeys: String, CodingKey {
        case number
        case title
        case reference = "reference"
        case stanzas
        case pdfPageNumbers = "pdf_page_nums"
        case infoMeter = "info_meter"
        case infoTune = "info_tune"
        case infoComposer = "info_composer"
        case infoTuneWithoutMeter = "info_tune_wo_meter"
        case verseLine1 = "verse_line_1"
        case verseLine2 = "verse_line_2"
        case isTuneCopyrighted = "is_tune_copyrighted"
    }
}

extension SFWSSongContainer: Decodable {}
