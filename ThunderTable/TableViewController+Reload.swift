//
//  TableViewController+Reload.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 17/07/2018.
//  Copyright © 2018 3SidedCube. All rights reserved.
//

import Foundation

extension TableViewController {
    
    /// Finds the index path for a particular row.
    ///
    /// - Note: The row in question must conform to Equatable for this to succeed.
    ///
    /// - Parameter row: The row to find the index path for.
    /// - Returns: The index path the row is positioned at if it is in `data`.
    public func indexPathFor<T: Row & Equatable>(row: T) -> IndexPath? {
        
        for (index, section) in data.enumerated() {
            
            guard let matchingRowIndex = section.rows.index(where: {
                guard let matchableRow = $0 as? T else { return false }
                return matchableRow == row
            }) else {
                continue
            }
            
            return IndexPath(row: matchingRowIndex, section: index)
        }
        
        return nil
    }
    
    /// Replaces a row in `data` with another row, whilst optionally reloading other index paths.
    ///
    /// - Note: This relies on the containing section of the row being of class `TableSection` as apposed to any object conforming to `Section`
    ///
    /// - Parameters:
    ///   - row: The row that should be replaced.
    ///   - otherRow: The row that is replacing the original row.
    ///   - additionalReloadIndexPaths: Additional index paths that should be reloaded at the same time.
    public func replace<T: Row & Equatable>(row: T, with otherRow: Row, reloading additionalReloadIndexPaths: [IndexPath] = []) {
        
        guard let indexPath = indexPathFor(row: row) else { return }
        guard let tableSection = data[indexPath.section] as? TableSection else { return }
        
        var rows = tableSection.rows
        rows[indexPath.row] = otherRow
        tableSection.rows = rows
        
        withoutRedrawing {
            data[indexPath.section] = tableSection
        }
        
        var indexPaths = [indexPath]
        indexPaths.append(contentsOf: additionalReloadIndexPaths)
        tableView.reloadRows(at: indexPaths, with: .none)
    }
    
    /// Replaces multiple rows with replacement rows.
    ///
    /// - Note: This relies on the containing section of each row being of class `TableSection` as apposed to any object conforming to `Section`.
    ///
    /// - Parameters:
    ///   - rows: The rows to replace.
    ///   - otherRows: The rows they should be replaced by.
    public func replace<T: Row & Equatable>(rows: [T], with otherRows: [Row]) {
        
        guard rows.count == otherRows.count else { return }
        
        let replacement: [(Int, IndexPath)] = rows.enumerated().compactMap({
            guard let indexPath = indexPathFor(row: $0.element) else { return nil }
            return ($0.offset, indexPath)
        })
        
        replacement.forEach { (index, indexPath) in
            
            guard let tableSection = data[indexPath.section] as? TableSection else { return }
            
            var rows = tableSection.rows
            rows[indexPath.row] = otherRows[index]
            tableSection.rows = rows
            
            withoutRedrawing {
                data[indexPath.section] = tableSection
            }
        }
        
        tableView.reloadRows(at: replacement.map({ $0.1 }), with: .none)
    }
    
    /// Reloads the cell at the indexPath for a given row.
    ///
    /// - Parameter row: The row to reload the cell for.
    public func redraw<T: Row & Equatable>(row: T) {
        
        guard let indexPath = indexPathFor(row: row) else { return }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    /// The last available indexPath in the tableView
    public var lastIndexPath: IndexPath? {
        guard let lastSection = data.last else { return nil }
        guard !lastSection.rows.isEmpty else { return nil }
        return IndexPath(row: lastSection.rows.count - 1, section: data.count - 1)
    }
}
