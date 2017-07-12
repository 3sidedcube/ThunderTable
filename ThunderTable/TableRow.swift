//
//  TableRow.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import Foundation

public protocol Row {
	
	var accessoryType: UITableViewCellAccessoryType? { get set }
	
	var selectionStyle: UITableViewCellSelectionStyle? { get set }
    
    var title: String? { get set }
    
    var subtitle: String? { get set }
    
    var image: UIImage? { get set }
    
    var imageSize: CGSize? { get }
    
    var imageURL: URL? { get set }
    
    var remainSelected: Bool { get }
	
	var displaySeparators: Bool { get set }
    
    var cellClass: AnyClass? { get }
    
    var prototypeIdentifier: String? { get }
    
    var selectionHandler: SelectionHandler? { get set }
    
    var estimatedHeight: CGFloat? { get }
    
    var padding: CGFloat? { get }
    
    func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController)    
}

extension Row {
	
	public var accessoryType: UITableViewCellAccessoryType? {
		get { return nil }
		set {}
	}
	
	public var selectionStyle: UITableViewCellSelectionStyle? {
		get { return nil }
		set {}
	}
	
	public var displaySeparators: Bool {
		get { return true }
		set {}
	}
    
    public var title: String? {
		get { return nil }
		set {}
    }
    
    public var subtitle: String? {
		get { return nil }
		set {}
    }
    
    public var image: UIImage? {
        get { return nil }
        set {}
    }
    
    public var imageURL: URL? {
		get { return nil }
		set {}
    }
    
    public var imageSize: CGSize? {
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
		get { return nil }
		set {}
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
    
    open var imageSize: CGSize?
    
    open var imageURL: URL? {
        didSet {
            image = nil
        }
    }
    
    open var prototypeIdentifier: String? {
        return nil
    }
    
    open var selectionHandler: SelectionHandler?
	
	open var selectionStyle: UITableViewCellSelectionStyle?
	
	open var accessoryType: UITableViewCellAccessoryType?
    
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
            
            if image == nil && imageURL == nil {
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
