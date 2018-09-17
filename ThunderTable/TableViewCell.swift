//
//  TableViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

open class TableViewCell: UITableViewCell {

    @IBOutlet open var cellImageView: UIImageView?
    
    @IBOutlet open var cellTextLabel: UILabel?
    
    @IBOutlet open var cellDetailLabel: UILabel?
	
	private var nibBased = false
	
	public var cellStyle: UITableViewCell.CellStyle = .default
	
	public var shouldDisplaySeparators = true {
		didSet {
			
			if !shouldDisplaySeparators {
				
				subviews.forEach { (view) in
					if round(view.frame.height * UIScreen.main.scale) == 1 || round(view.frame.height) == 1 {
						view.removeFromSuperview()
					}
				}
			}
		}
	}
	
	override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		cellStyle = style
		
		if !nibBased {
			
			cellImageView = UIImageView();
			contentView.addSubview(cellImageView!)
			
			cellTextLabel = UILabel()
			cellTextLabel?.numberOfLines = 0
			cellTextLabel?.backgroundColor = .clear
			cellTextLabel?.numberOfLines = 0;
			cellTextLabel?.font = ThemeManager.shared.theme.cellTitleFont
			cellTextLabel?.textColor = ThemeManager.shared.theme.cellTitleColor
			
			contentView.addSubview(cellTextLabel!)
			
			cellDetailLabel = UILabel()
			cellDetailLabel?.numberOfLines = 0;
			cellDetailLabel?.font = ThemeManager.shared.theme.cellDetailFont
			cellDetailLabel?.textColor = ThemeManager.shared.theme.cellDetailColor
			contentView.addSubview(cellDetailLabel!)
		}
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override open func awakeFromNib() {
		
		super.awakeFromNib()
		nibBased = true
		sharedSetup()
	}
	
	private func sharedSetup() {
		
		backgroundColor = ThemeManager.shared.theme.cellBackgroundColor
		contentView.backgroundColor = ThemeManager.shared.theme.cellBackgroundColor
	}
	
	override open func layoutSubviews() {
		
		super.layoutSubviews()
		
		// Don't layout manually if is marked as nib based, or if none of the root labels/image
		// views are created or have constraints
		guard !nibBased,
			let cellTextLabel = cellTextLabel, cellTextLabel.constraints.isEmpty,
			let cellDetailLabel = cellDetailLabel, cellDetailLabel.constraints.isEmpty,
			let cellImageView = cellImageView, cellImageView.constraints.isEmpty else {
			return
		}
		
		if cellImageView.image != nil {
			
			cellImageView.sizeToFit()
			var imageFrame = cellImageView.frame;
			imageFrame.origin.x = 12;
			cellImageView.frame = imageFrame;
			
		} else {
			
			cellImageView.frame = .zero;
		}
		
		switch cellStyle {
		case .subtitle:
			subtitleLayout()
			break
		case .value1, .value2:
			valueLayout()
			break
		default:
			 break
		}
		
		// Only set the center if we have superview to avoid breaking automatic cell height calculations
		if superview != nil {
			cellImageView.center = CGPoint(x: cellImageView.center.x, y: max(imageView != nil ? imageView!.frame.height/2 : 0, contentView.center.y))
		}
	}
	
	private var edgeInsets: UIEdgeInsets {
		
		var leftIndentation: CGFloat = max(indentationWidth * CGFloat(indentationLevel), 12);
		if cellImageView?.image != nil {
			leftIndentation = cellImageView!.frame.maxX + leftIndentation;
		}
		let insets = UIEdgeInsets(top: 8, left: leftIndentation, bottom: 0, right: 12)
		return insets;
	}
	
	private func valueLayout() {
		
		guard let cellTextLabel = cellTextLabel else { return }
		guard let cellDetailLabel = cellDetailLabel else { return }
		
		let textLabelSize = cellTextLabel.sizeThatFits(CGSize(width: contentView.frame.width - edgeInsets.left - edgeInsets.right, height: CGFloat.greatestFiniteMagnitude))
		var textLabelFrame = CGRect(x: edgeInsets.left, y: edgeInsets.top, width: textLabelSize.width, height: textLabelSize.height)
		let textNumberOfLines = max(Int(textLabelSize.height/cellTextLabel.font.lineHeight), 0)
		
		var (_, remainder) = contentView.frame.divided(atDistance: textLabelSize.width + edgeInsets.right, from: .minXEdge)
		remainder.size.width = remainder.size.width - edgeInsets.right;
		
		let detailLabelSize = cellDetailLabel.sizeThatFits(CGSize(width: remainder.width, height: CGFloat.greatestFiniteMagnitude))
		remainder.size.height = detailLabelSize.height
		let detailNumberOfLines = max(Int(remainder.height/cellDetailLabel.font.lineHeight), 0)
		
		if textNumberOfLines == detailNumberOfLines || cellDetailLabel.text == nil {
			
			textLabelFrame.origin.y = self.contentView.frame.size.height / 2 - textLabelFrame.size.height / 2;
			remainder.origin.y = self.contentView.frame.size.height / 2 - remainder.size.height / 2;
		}
		
		self.cellTextLabel?.frame = textLabelFrame.integral;
		self.cellDetailLabel?.frame = remainder.integral;
	}
	
	private func subtitleLayout() {
		
		guard let cellTextLabel = cellTextLabel else { return }
		guard let cellDetailLabel = cellDetailLabel else { return }
		
		let textLabelSize = cellTextLabel.sizeThatFits(CGSize(width: contentView.frame.width - edgeInsets.left - edgeInsets.right, height: CGFloat.greatestFiniteMagnitude))
		var textLabelFrame = CGRect(x: edgeInsets.left, y: edgeInsets.top, width: contentView.frame.width - edgeInsets.left - edgeInsets.right, height: textLabelSize.height)

		let detailLabelSize = cellDetailLabel.sizeThatFits(CGSize(width: contentView.frame.width - edgeInsets.left - edgeInsets.right, height: CGFloat.greatestFiniteMagnitude))
		var detailLabelFrame = CGRect(x: edgeInsets.left, y: textLabelFrame.maxY, width: contentView.frame.width - edgeInsets.left - edgeInsets.right, height: detailLabelSize.height)
		
		// If no detail text then center text label
		if cellDetailLabel.text == nil || cellDetailLabel.text!.replacingOccurrences(of: " ", with: "").isEmpty {
			
			textLabelFrame.origin.y = contentView.frame.height / 2 - textLabelFrame.height / 2
			
		// If image view is larger than both labels, put together then centre them
		} else if let cellImageView = cellImageView, cellImageView.frame.height >= detailLabelFrame.maxY - textLabelFrame.minY {
			
			var compoundRect = CGRect(x: textLabelFrame.minX, y: 0, width: textLabelFrame.width, height: detailLabelFrame.maxY - textLabelFrame.minY)
			compoundRect.origin.y = contentView.frame.height / 2 - compoundRect.height / 2
			
			textLabelFrame.origin.y = compoundRect.origin.y;
			detailLabelFrame.origin.y = textLabelFrame.maxY
		}

		self.cellTextLabel?.frame = (cellTextLabel.text == nil || cellTextLabel.text!.replacingOccurrences(of: " ", with: "").isEmpty) ? .zero : textLabelFrame.integral
		self.cellDetailLabel?.frame = (cellDetailLabel.text == nil || cellDetailLabel.text!.replacingOccurrences(of: " ", with: "").isEmpty) ? .zero : detailLabelFrame.integral
	}
	
	//This is really quite awful but it's the only way to get tableview to remove the 1px line at the top of sections on a group tableview when disabling cell seperators
	override open func addSubview(_ view: UIView) {
		
		if !shouldDisplaySeparators && (round(view.frame.height * UIScreen.main.scale) == 1 || round(view.frame.height) == 1) {
			return
		}
		
		super.addSubview(view)
	}
}
