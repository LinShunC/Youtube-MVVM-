//
//  SubscriptionCell.swift
//  Youtube
//
//  Created by linshun on 31/7/20.
//  Copyright © 2020 lin shun. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    override func fetchVideos() {
        APIService.sharedInstance.fetchSubscriptionVideos { (videos:[Video]) in
            self.videosViewModel = videos.map({return VideoViewModel(video: $0)})
            self.collectionView.reloadData()
        }
    }
}
