//
//  Locale+Extended.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import Foundation

enum LanguageCodeType: String {
    case en = "en"
    case es = "es"
}

extension Locale {
    
    func getLanguageCode() -> NewsAPILanguageCountry {
        switch languageCode {
        case LanguageCodeType.en.rawValue:
            return NewsAPILanguageCountry.us
        case LanguageCodeType.es.rawValue:
            return NewsAPILanguageCountry.ar
        default:
            return NewsAPILanguageCountry.us
        }
    }
    
}
