//
//  HomeDataSource.swift
//  DemoTexture
//
//  Created by 3embed on 14/09/24.
//

import Foundation
import AsyncDisplayKit

let arrOfVideos = ["https://d4ym89hsvfz1l.cloudfront.net//_r0//40//84//30//00//00//4084300000//f32.mp4",
      "https://d4ym89hsvfz1l.cloudfront.net//_r0//40//84//20//00//00//4084200000//f32.mp4",
      "https://d4ym89hsvfz1l.cloudfront.net//_r0//40//84//10//00//00//4084100000//f32.mp4",
      "https://d4ym89hsvfz1l.cloudfront.net//_r0//40//83//90//00//00//4083900000//f32.mp4",
      "https://d4ym89hsvfz1l.cloudfront.net//_r0//40//83//70//00//00//4083700000//f32.mp4"
                   
]
class HomeDataSource : NSObject , ASTableDataSource{
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 2
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return (section == 0 ? 1 : arrOfVideos.count)
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        if indexPath.section == 0{
            let cell = ASCellNode()
            return cell
        }else{
            let cell = NewsFeedCell(dataOfVideo: arrOfVideos[indexPath.row])
            return cell
        }
    }
}
