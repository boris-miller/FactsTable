//
//  RowCell.swift
//  FactsTable
//
//  Created by Boris Miller on 6/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import UIKit

class RowCell: UITableViewCell {
    
    var row : Row? {
        didSet {
            updateImage(row?.imageHref)
            titleLabel.text = row?.title
            descriptionLabel.text = row?.rowDescription
        }
    }
    
    private var downloadImageTask: URLSessionDataTask?
    
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let rowImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(rowImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        rowImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 120, height: 70, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: rowImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, enableInsets: false)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: rowImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 42, paddingRight: 16, width: 0, height: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateImage(_ imageRef: String?) {
        guard let imageRef = imageRef else { return }
        downloadImageTask = rowImage.downloadedTask(from: imageRef)
    }
    
}
