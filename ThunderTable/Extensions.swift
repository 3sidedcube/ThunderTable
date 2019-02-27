//
//  Extensions.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 02/08/2017.
//  Copyright © 2017 3SidedCube. All rights reserved.
//

import Foundation

extension Array : Section {
    
    public var rows: [Row] {
        return filter({ (item) -> Bool in
            return item is Row
        }) as? [Row] ?? []
    }
    
    public var editHandler: EditHandler? {
        return nil
    }
    
    public var selectionHandler: SelectionHandler? {
        return nil
    }
}

extension String: PickerRowDisplayable {
    
    public var rowTitle: String {
        return self
    }
    
    public var value: AnyHashable {
        return self
    }
}

extension Int: PickerRowDisplayable {
    
    public var rowTitle: String {
        return "\(self)"
    }
    
    public var value: AnyHashable {
        return self
    }
}

extension Double: PickerRowDisplayable {
    
    public var rowTitle: String {
        return "\(self)"
    }
    
    public var value: AnyHashable {
        return self
    }
}

extension String : Row {
    
    public var title: String? {
        return self
    }
}
