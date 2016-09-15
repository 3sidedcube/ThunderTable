//
//  TableSection.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import Foundation

public typealias SelectionHandler = (_ row: Row, _ selected: Bool, _ indexPath: IndexPath, _ tableView: UITableView) -> (Void)

public protocol Section {
    
    var rows: [Row] { get }
    
    var header: String? { get }
    
    var footer: String? { get }
    
    var selectionHandler: SelectionHandler? { get }
}

extension Section {
    
    var rows: [Row] {
        return []
    }
    
    var header: String? {
        return nil
    }
    
    var footer: String? {
        return nil
    }
    
    var selectionHandler: SelectionHandler? {
        return nil
    }
}

open class TableSection: Section {
    
    open var header: String?
    
    open var footer: String?
    
    open var rows: [Row]
    
    open var selectionHandler: SelectionHandler?
    
    public init(rows: [Row], header: String? = nil, footer: String? = nil, selectionHandler: SelectionHandler? = nil) {
        
        self.rows = rows
        self.header = header
        self.footer = footer
        self.selectionHandler = selectionHandler
    }
}
