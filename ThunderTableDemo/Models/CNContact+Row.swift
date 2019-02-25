//
//  CNContact+Row.swift
//  ThunderTableDemo
//
//  Created by Simon Mitchell on 02/03/2018.
//  Copyright © 2018 3SidedCube. All rights reserved.
//

import UIKit
import Contacts
import ThunderTable

extension CNContact: Row {
    
    public var title: String? {
        return givenName + " " + familyName
    }
    
    public var subtitle: String? {
        return phoneNumbers.first?.value.stringValue
    }
    
    public var image: UIImage? {
        get {
            guard let thumbnailImageData = thumbnailImageData else { return nil }
            return UIImage(data: thumbnailImageData)
        }
        set { }
    }
    
    public var cellClass: UITableViewCell.Type? {
        return ContactTableViewCell.self
    }
    
    public func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
        guard let contactCell = cell as? ContactTableViewCell else {
            return
        }
        contactCell.cellImageView?.isHidden = image == nil
    }
}
