//
//  Hashtag.swift
//  Hashtags
//
//  Created by Oscar Götting on 6/6/18.
//  Copyright © 2018 Oscar Götting. All rights reserved.
//

import Foundation
public enum HastagType {
    case Location
    case WikiLink
}

public enum HashtagSubType {
    case Location
    case Organization
    case Product
    case Person
    case Others
}
extension Array where Element: Equatable {
    @discardableResult mutating func remove(object: Element) -> Bool {
        if let index = index(of: object) {
            self.remove(at: index)
            return true
        }
        return false
    }
    
    @discardableResult mutating func remove(where predicate: (Array.Iterator.Element) -> Bool) -> Bool {
        if let index = self.index(where: { (element) -> Bool in
            return predicate(element)
        }) {
            self.remove(at: index)
            return true
        }
        return false
    }
}

open class HashTag: Equatable {
    
    open var text: String
    open var isRemovable: Bool
    open var hasHashSymbol: Bool
    open var type: HastagType
    open var subtype : HashtagSubType
    open var configuration: HashtagConfiguration?
    
    public init(word: String, withHashSymbol: Bool = true, isRemovable: Bool = false, type : HastagType, subtype : HashtagSubType) {
        self.text = word
        self.isRemovable = isRemovable
        self.hasHashSymbol = withHashSymbol
        self.subtype = subtype
        if hasHashSymbol {
            self.text = "#" + text
        }
        self.type = type;
    }
    
    public static func == (lhs: HashTag, rhs: HashTag) -> Bool {
        return lhs.text == rhs.text
    }
}
