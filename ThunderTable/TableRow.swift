//
//  TableRow.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import Foundation

public protocol Row {
    
    var title: String? { get }
    
    var subtitle: String? { get }
    
    var image: UIImage? { get }
    
    var remainSelected: Bool { get }
    
    var cellClass: AnyClass? { get }
    
    var prototypeIdentifier: String? { get }
    
    var selectionHandler: SelectionHandler? { get }
    
    var estimatedHeight: CGFloat? { get }
    
    var padding: CGFloat? { get }
    
    func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController)    
}

extension Row {
    
    public var title: String? {
        return nil
    }
    
    public var subtitle: String? {
        return nil
    }
    
    public var image: UIImage? {
        return nil
    }
    
    public var remainSelected: Bool {
        return false
    }
    
    public var cellClass: AnyClass? {
        return TableViewCell.self
    }
    
    public var prototypeIdentifier: String? {
        return nil
    }
    
    public var selectionHandler: SelectionHandler? {
        return nil
    }
    
    public var estimatedHeight: CGFloat? {
        return nil
    }
    
    public var padding: CGFloat? {
        return nil
    }
    
    public func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
        
    }
}

open class TableRow: Row {
    
    open var title: String?
    
    open var subtitle: String?
    
    open var image: UIImage?
    
    open var prototypeIdentifier: String? {
        return nil
    }
    
    open var selectionHandler: SelectionHandler?
    
    open var cellClass: AnyClass? {
        return TableViewCell.self
    }
    
    open var estimatedHeight: CGFloat? {
        return nil
    }
    
    open var padding: CGFloat? {
        return nil
    }
    
    open var remainSelected: Bool {
        return false
    }
    
    open func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
        
        if let cell = cell as? TableViewCell, let imageView = cell.cellImageView {
            
            if image == nil {
                imageView.isHidden = true
            } else {
                imageView.isHidden = false
            }
        }
    }
    
    public init(title: String?, subtitle: String? = nil, image: UIImage? = nil, selectionHandler: SelectionHandler? = nil) {
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.selectionHandler = selectionHandler
    }
}
