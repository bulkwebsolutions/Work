//
//  CellStruct.swift
//  Pdf-Example
//
//  Created by Alexander Cruz on 7/5/16.
//  Copyright © 2016 Trax. All rights reserved.
//

import Foundation


class Cell {
    var isExpandable: Bool
    var isExpanded: Bool
    var isVisible: Bool
    var value: String
    var primaryTitle: String
    var secondaryTitle: String
    var cellIdentifier: String
    var additionalRows: Int
    
    init(isExpandable: Bool, isExpanded: Bool, isVisible: Bool, value: String, primaryTitle: String, secondaryTitle: String, cellIdentifier: String, additionalRows: Int) {
        self.isExpandable = isExpandable
        self.isExpanded = isExpanded
        self.isVisible = isVisible
        self.value = value
        self.primaryTitle = primaryTitle
        self.secondaryTitle = secondaryTitle
        self.cellIdentifier = cellIdentifier
        self.additionalRows = additionalRows        
    }
}