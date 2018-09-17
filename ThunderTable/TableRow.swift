//
//  TableRow.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

/// A protocol which allows the rendering of information into a cell within
/// a `UITableView` by providing a declarative view on the information to show
public protocol Row {
	
	/// The accessory type to be displayed on the right of the cell for this row
	/// - Important: If you wish to return `.none` from this, make sure to use the long syntax:
	/// `UITableViewCellAccessoryType.none` otherwise the compiler will think you are returning
	/// `Optional.none` which is equivalent to nil and therefore will be ignored by `TableViewController`
	var accessoryType: UITableViewCell.AccessoryType? { get }
	
	/// The selection style to be applied when the cell for this row is pressed down
	/// - Important: If you wish to return `.none` from this, make sure to use the long syntax:
	/// `UITableViewCellSelectionStyle.none` otherwise the compiler will think you are returning
	/// `Optional.none` which is equivalent to nil and therefore will be ignored by `TableViewController`
	var selectionStyle: UITableViewCell.SelectionStyle? { get }
	
	/// The cell style of the cell for this row
	///
	/// - Important: This will only take affect if you directly use TableRow, or subclass `TableViewCell` but don't use a xib based layout and return false from `useNibSuperclass`.
	var cellStyle: UITableViewCell.CellStyle? { get }
	
    /// A string to be displayed as the title for the row
    var title: String? { get }
	
    /// A string to be displayed as the subtitle for the row
    var subtitle: String? { get }
    
    /// An image to be displayed in the row
    var image: UIImage? { get set }
    
    /// The size of the image which will be displayed in the row
	/// 
	/// This will be used when displaying an image using imageURL in order
	/// to layout the cell correctly before the image has loaded in.
    var imageSize: CGSize? { get }
    
    /// A url to load the image for the cell from
    var imageURL: URL? { get }
    
    /// Whether the cell should remain selected when pressed by the user
	///
	/// Defaults to false
    var remainSelected: Bool { get }
	
	/// Whether separators should be displayed on the cell
	///
	/// Defaults to true
	var displaySeparators: Bool { get }
	
	/// Whether the row is editable (Shows delete/actions) on cell swipe
	///
	/// Defaults to false
	var isEditable: Bool { get }
    
    /// The class for the `UITableViewCell` subclass for the cell
    var cellClass: UITableViewCell.Type? { get }
    
    /// A prototype identifier for a cell which is defined in a storyboard
	/// file, which this row will use
    var prototypeIdentifier: String? { get }
    
    /// A closure which will be called when the row is pressed on in the table view
    var selectionHandler: SelectionHandler? { get }
	
	/// A closure which will be called when the row is edited in the table view
	var editHandler: EditHandler? { get }
    
    /// The estimated height of the row
	///
	/// Defaults to nil, this is ignored by cells which are layed out
	/// using interface builder
    var estimatedHeight: CGFloat? { get }
    
    /// Padding to apply to the edges of the row
	///
	/// This is ignored by cells which are layed out
	/// using interface builder
    var padding: CGFloat? { get }
	
	/// Whether if no nib was found with the same file name as `cellClass`
	/// (expected behaviour is to name your cell's xib the same file name as the 
	/// class you return from `cellClass`), we should then find a xib for a
	/// superclass of `cellClass`
	///
	/// Defaults to true, meaning all cells without their own xib will use
	/// a superclasses xib to layout, this will eventually come across the base
	/// cell class `TableViewCell` so if you wish to have a none Interface Builder
	/// row, then make sure to return false from this, or subclass from UITableViewCell rather than TableViewCell!
	var useNibSuperclass: Bool { get }
    
    /// A function which will be called in `cellForRow:atIndexPath` delegate 
	/// method which can be used to provide custom overrides on your cell from
	/// the row controlling it
    ///
    /// - Parameters:
    ///   - cell: The cell which needs configuring
    ///   - indexPath: The index path which that cell is at
    ///   - tableViewController: The table view controller which the cell is in
    func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController)
 
	/// A function which allows providing a manual height for a cell not layed
	/// out using Interface Builder
	///
	/// - Parameters:
	///   - size: The size which the row has available to it
	///   - tableView: The table view which the row will be displayed in
	/// - Returns: The height (or nil, to have this ignored) the row should be displayed at
	func height(constrainedTo size: CGSize, in tableView: UITableView) -> CGFloat?
	
	/// A configuration object which allows leading swipe actions to be attached to the row.
	var leadingSwipeActionsConfiguration: SwipeActionsConfigurable? { get }
	
	/// A configuration object which allows trailing swipe actions to be attached to the row.
	var trailingSwipeActionsConfiguration: SwipeActionsConfigurable? { get }
}

extension Row {
	
	public var accessoryType: UITableViewCell.AccessoryType? {
		return nil
	}
	
	public var selectionStyle: UITableViewCell.SelectionStyle? {
		return nil
	}
	
	public var displaySeparators: Bool {
		return true
	}
	
	public var isEditable: Bool {
		return leadingSwipeActionsConfiguration != nil || trailingSwipeActionsConfiguration != nil || editHandler != nil
	}
	
	public var cellStyle: UITableViewCell.CellStyle? {
		return nil
	}
    
    public var title: String? {
		return nil
    }
    
    public var subtitle: String? {
		return nil
    }
    
    public var image: UIImage? {
        get { return nil }
        set {}
    }
    
    public var imageURL: URL? {
		return nil
    }
    
    public var imageSize: CGSize? {
        return nil
    }
    
    public var remainSelected: Bool {
        return false
    }
    
    public var cellClass: UITableViewCell.Type? {
        return TableViewCell.self
    }
    
    public var prototypeIdentifier: String? {
        return nil
    }
    
    public var selectionHandler: SelectionHandler? {
		return nil
    }
	
	public var editHandler: EditHandler? {
		return nil
	}
	
	public var useNibSuperclass: Bool {
		return true
	}
    
    public var estimatedHeight: CGFloat? {
        return nil
    }
    
    public var padding: CGFloat? {
        return nil
    }
    
    public func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
        
    }
	
	public func height(constrainedTo size: CGSize, in tableView: UITableView) -> CGFloat? {
		return nil
	}
	
	public var leadingSwipeActionsConfiguration: SwipeActionsConfigurable? { return nil }
	
	public var trailingSwipeActionsConfiguration: SwipeActionsConfigurable? { return nil }
}

/// A base class which can be subclassed providing a template for the `Row` protocol
open class TableRow: Row {
	
	open var cellStyle: UITableViewCell.CellStyle?
	
	open var displaySeparators: Bool = true
	
	public var isEditable: Bool {
        return leadingSwipeActionsConfiguration != nil || trailingSwipeActionsConfiguration != nil || editHandler != nil
	}
	
	public var editHandler: EditHandler?
    
    open var title: String?
	
	open var titleTextColor: UIColor = ThemeManager.shared.theme.cellTitleColor
	
	open var subtitleTextColor: UIColor = ThemeManager.shared.theme.cellDetailColor
    
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
	
	open var selectionStyle: UITableViewCell.SelectionStyle?
	
	open var accessoryType: UITableViewCell.AccessoryType?
	
	open var leadingSwipeActionsConfiguration: SwipeActionsConfigurable?
	
	open var trailingSwipeActionsConfiguration: SwipeActionsConfigurable?
    
    open var cellClass: UITableViewCell.Type? {
		guard let cellStyle = cellStyle else { return TableViewCell.self }
		switch cellStyle {
		case .default:
			return DefaultTableViewCell.self
		case .subtitle:
			return SubtitleTableViewCell.self
		case .value1:
			return Value1TableViewCell.self
		case .value2:
			return TableViewCell.self
		}
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
	
	open var useNibSuperclass: Bool {
		return true
	}
    
    open func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
		
		guard let tableViewCell = cell as? TableViewCell else {
			return
		}
        
        if let imageView = tableViewCell.cellImageView {
			
            if image == nil && imageURL == nil {
                imageView.isHidden = true
            } else {
                imageView.isHidden = false
            }
        }
		
		tableViewCell.cellTextLabel?.textColor = titleTextColor
		tableViewCell.cellDetailLabel?.textColor = subtitleTextColor
    }
	
	public func height(constrainedTo size: CGSize, in tableView: UITableView) -> CGFloat? {
		return nil
	}
    
    public init(title: String?, subtitle: String? = nil, image: UIImage? = nil, selectionHandler: SelectionHandler? = nil) {
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.selectionHandler = selectionHandler
    }
}
