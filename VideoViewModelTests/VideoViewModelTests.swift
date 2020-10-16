//
//  VideoViewModelTests.swift
//  VideoViewModelTests
//
//  Created by anyRTC on 2020/10/14.
//  Copyright © 2020 lin shun. All rights reserved.
//

import XCTest
@testable import Youtube


class VideoViewModelTests: XCTestCase {
    var titleLabelHeightConstraint:CGFloat?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testVideoViewModel () {
        let channel = Channel(name: "asd", profileImageName: "dddd")
        let video = Video(thumbnailImageName: "asdasaaad", title: "asdasd", numberOfViews: 2, uploadDate: Date(), channel: channel)
        let videoViewModel = VideoViewModel(video: video)
        
        XCTAssertEqual(videoViewModel.title, video.title)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let subtitleString = "\((video.channel?.name)! as String) • \(numberFormatter.string(from: NSNumber(value: video.numberOfViews!))!) • 2 years ago"
        XCTAssertEqual(videoViewModel.subtitleString! as String, subtitleString as String)
        
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
        XCTAssertEqual(videoViewModel.titleLabelHeightConstraint, titleLabelHeightConstraint)
        XCTAssertEqual(videoViewModel.channel?.name, video.channel?.name)
    }
    
}
