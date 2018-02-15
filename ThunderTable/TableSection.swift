//
//  TableSection.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import Foundation

public typealias SelectionHandler = (_ row: Row, _ selected: Bool, _ indexPath: IndexPath, _ tableView: UITableView) -> (Void)

public typealias EditHandler = (_ row: Row, _ editingStyle: UITableViewCellEditingStyle, _ indexPath: IndexPath, _ tableView: UITableView) -> (Void)

public protocol Section {
    
    var rows: [Row] { get set }
    
    var header: String? { get set }
    
    var footer: String? { get set }
	
	var editHandler: EditHandler? { get set }
    
    var selectionHandler: SelectionHandler? { get set }
	
	var rowLeadingSwipeActionsConfiguration: SwipeActionsConfigurable? { get }
	
	var rowTrailingSwipeActionsConfiguration: SwipeActionsConfigurable? { get }
}

public extension Section {
	
	var rows: [Row] {
		get {
			return []
		}
		set {}
	}
	
    var header: String? {
		get {
			return nil
		}
		set {}
    }
    
    var footer: String? {
		get {
			return nil
		}
		set {}
    }

    var selectionHandler: SelectionHandler? {
		get {
			return nil
		}
		set {}
    }
	
	var rowLeadingSwipeActionsConfiguration: SwipeActionsConfigurable? { get { return nil } }
	
	var rowTrailingSwipeActionsConfiguration: SwipeActionsConfigurable? { get { return nil } }
}

open class TableSection: Section {
    
    open var header: String?
    
    open var footer: String?
    
    open var rows: [Row]
    
    open var selectionHandler: SelectionHandler?
	
	open var editHandler: EditHandler?
	
	open var rowLeadingSwipeActionsConfiguration: SwipeActionsConfigurable?
	
	open var rowTrailingSwipeActionsConfiguration: SwipeActionsConfigurable?
    
    public init(rows: [Row], header: String? = nil, footer: String? = nil, selectionHandler: SelectionHandler? = nil) {
        
        self.rows = rows
        self.header = header
        self.footer = footer
        self.selectionHandler = selectionHandler
    }
	
	/// Returns an array of `TableSection` objects sorted by first letter of the row's title
	///
	/// - Parameters:
	///   - rows: The rows to sort into alphabetised sections
	///   - selectionHandler: A selection handler to add to the sections
	/// - Returns: An array of `TableSection` objects
	public class func sortedSections(with rows: [Row], selectionHandler: SelectionHandler? = nil) -> [TableSection] {
		
		let sortedAlphabetically = self.alphabeticallySort(rows: rows)
		let sortedKeys = sortedAlphabetically.keys.sorted { (stringA, stringB) -> Bool in
			return stringB > stringA
		}
			
		return sortedKeys.flatMap({key -> TableSection? in
			guard let rows = sortedAlphabetically[key] else { return nil }
			return TableSection(rows: rows, header: key, footer: nil, selectionHandler: selectionHandler)
		})
	}
	
	private class func alphabeticallySort(rows: [Row]) -> [String : [Row]] {
		
		var sortedDict = [String : [Row]]()
		
		rows.forEach { (row) in
			
			var firstLetter = "?"
			if let rowTitle = row.title, !rowTitle.isEmpty {
				firstLetter = String(rowTitle.prefix(1)).uppercased()
			}
			var subItems = sortedDict[firstLetter] ?? []
			subItems.append(row)
			sortedDict[firstLetter] = subItems
		}
		
		return sortedDict
	}
}
