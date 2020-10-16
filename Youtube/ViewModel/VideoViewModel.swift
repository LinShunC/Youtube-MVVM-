//
//  VideoViewModel.swift
//  Youtube
//
//  Created by anyRTC on 2020/10/14.
//  Copyright © 2020 lin shun. All rights reserved.
//

import Foundation
import UIKit
struct VideoViewModel {
    var thumbnailImageName: String
    var title: String
    var subtitleString: String?
    var uploadDate: Date?
    var channel: Channel?
    var titleLabelHeightConstraint: CGFloat?
    
    init(video:Video) {
        self.thumbnailImageName = video.thumbnailImageName
        self.title = video.title!
        self.uploadDate = video.uploadDate
        //self.numberOfViews = video.numberOfViews
        self.channel = video.channel
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let channelName = video.channel?.name,  let numberOfViews = video.numberOfViews {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            self.subtitleString = "\(channelName) • \(numberFormatter.string(from: NSNumber(value: numberOfViews))!) • 2 years ago"
        }
        if let title = video.title,let keywindow =  UIApplication.shared.keyWindow {
            let size = CGSize(width: keywindow.frame.width - 16 - 44 - 8 - 16, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            
            let estimateRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            if estimateRect.size.height > 20 {
                titleLabelHeightConstraint = 44
            } else {
                titleLabelHeightConstraint = 20
            }
        }
    }
}

//    var video:Video?
//    {
//        didSet
//        {
//            titleLabel.text = video?.title
//            setupThumbnailImage()
//            setupProfileImage()
//            let numberFormatter = NumberFormatter()
//            numberFormatter.numberStyle = .decimal
//            if let channelName = video?.channel?.name,  let numberOfViews = video?.numberOfViews
//            {
//                let numberFormatter = NumberFormatter()
//                               numberFormatter.numberStyle = .decimal
//
//                let subtitleText = "\(channelName) • \(numberFormatter.string(from: NSNumber(value: numberOfViews))!) • 2 years ago "
//                               subtitleTextView.text = subtitleText
//
//            }
//            // measure title text
//            if let title = video?.title
//            {
//                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
//                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
//
//                let estimateRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
//                if estimateRect.size.height > 20 {
//                    titleLabelHeightConstraint?.constant = 44
//                } else {
//                    titleLabelHeightConstraint?.constant = 20
//                }
//            }
//        }
//    }
