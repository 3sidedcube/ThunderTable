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
		get {
			return filter({ (item) -> Bool in
				return item is Row
			}) as? [Row] ?? []
		}
		set {}
	}
    
    public var editHandler: EditHandler? {
        get {
            return nil
        }
        set {}
    }
}

extension String: PickerRowDisplayable {
	
	public var rowTitle: String {
		get {
			return self
		}
		set {
			
		}
	}
	
	public var value: AnyHashable {
		return self
	}
}

extension Int: PickerRowDisplayable {
	
	public var rowTitle: String {
		get {
			return "\(self)"
		}
	}
	
	public var value: AnyHashable {
		return self
	}
}

extension Double: PickerRowDisplayable {
	
	public var rowTitle: String {
		get {
			return "\(self)"
		}
	}
	
	public var value: AnyHashable {
		return self
	}
}

extension String : Row {
	
	public var title: String? {
		get { return self }
		set {}
	}
}
