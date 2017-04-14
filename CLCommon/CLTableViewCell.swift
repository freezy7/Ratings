//
//  CLTableViewCell.swift
//  Ratings
//
//  Created by R_flava_Man on 17/3/17.
//  Copyright © 2017年 R_style_Man. All rights reserved.
//

import UIKit

class CLTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var btn:UIButton?
    var index: Int = 0
    
    
    var displayItem: displayItem? = nil {
        didSet {
            let tempSize = CGSize(width: self.contentView.frame.size.width - 20, height:CGFloat.greatestFiniteMagnitude)
            let height = displayItem?.text!.sizeWithConstrainedSize(size: tempSize, font: UIFont.systemFont(ofSize: 15))
            
            if height! < 50 {
                btn?.isHidden = true
            } else {
                btn?.isHidden = false
            }
            
            titleLabel?.text = displayItem?.text
            btn!.setTitle(((displayItem?.isShow)! ? "收起" : "展开"), for: UIControlState.normal)
            self.setNeedsLayout()
        }
    }
    
    var tapFunction:((Int)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame:  CGRect(origin: CGPoint(x:10, y:0), size: CGSize(width:self.contentView.frame.size.width - 20, height:self.contentView.frame.size.height - 20)))
        titleLabel?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        titleLabel?.font = UIFont.systemFont(ofSize: 15);
        titleLabel?.textColor = UIColor.red
        titleLabel?.numberOfLines = 0
        self.contentView.addSubview(titleLabel!)
        
        btn = UIButton(frame: CGRect(origin: CGPoint(x:self.contentView.frame.size.width - 50, y:self.contentView.frame.size.height - 20), size: CGSize(width:35, height:20)))
        btn!.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleTopMargin]
        btn!.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn!.setTitleColor(UIColor.blue, for: UIControlState.normal)
        btn!.setTitle("展开", for: UIControlState.normal)
        btn!.addTarget(self, action:#selector(CLTableViewCell.tapAction), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(btn!)
    }
    
    //
    init(title: String, subTitle: String, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier:reuseIdentifier)
    }
    
    convenience init(title: String) {
        self.init(title: title, subTitle:"erwerewr", reuseIdentifier:"fsdfsdf")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        titleLabel?.frame = CGRect(origin: CGPoint(x:10, y:0), size: CGSize(width:self.contentView.frame.size.width - 20, height:self.contentView.frame.size.height - 20))
        let tempSize = CGSize(width: self.contentView.frame.size.width - 20, height:CGFloat.greatestFiniteMagnitude)
        let height = displayItem?.text!.sizeWithConstrainedSize(size: tempSize, font: UIFont.systemFont(ofSize: 15))
        
        if height! < 50 {
            titleLabel?.frame = CGRect(origin: CGPoint(x:10, y:0), size: CGSize(width:self.contentView.frame.size.width - 20, height:height!))
        } else {
            if (displayItem?.isShow)! {
                titleLabel?.frame = CGRect(origin: CGPoint(x:10, y:0), size: CGSize(width:self.contentView.frame.size.width - 20, height:height!))
            } else {
                titleLabel?.frame = CGRect(origin: CGPoint(x:10, y:0), size: CGSize(width:self.contentView.frame.size.width - 20, height: 50))
            }
        }
    }
    
    func tapAction() {
        titleLabel?.numberOfLines = 0
        tapFunction!(index)
    }
    
    //MARK: public
    static func cellHeightWith(item: displayItem?, tableView:UITableView) -> CGFloat {
        if item != nil {
            let tempSize = CGSize(width: tableView.frame.size.width - 20, height:CGFloat.greatestFiniteMagnitude)
            let height = item?.text!.sizeWithConstrainedSize(size: tempSize, font: UIFont.systemFont(ofSize: 15))
            if height! > 50 {
                if (item?.isShow)! {
                    return ceil(height!) + 20
                }
                return 50 + 20
            }
            return ceil(height!)
        }
        return 0
    }
}

extension String {
    func sizeWithConstrainedSize(size: CGSize, font: UIFont) -> CGFloat {
        let tempString = NSString(string: self)
        let size = tempString.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil);
        return size.height
    }
}
