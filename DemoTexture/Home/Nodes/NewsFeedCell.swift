//
//  NewsFeedCell.swift
//  DemoTexture
//
//  Created by 3embed on 14/09/24.
//


import AsyncDisplayKit

class NewsFeedCell: BaseCellNode {
    let headerNode = HeaderNode()
    var imageNode : OverlaySocialNode!
    let socialNode = SocialNode()
    init(dataOfVideo : String) {
        super.init()
        self.automaticallyManagesSubnodes = true
        
        let imageNode = OverlaySocialNode(dataOfVideo: dataOfVideo)
        self.imageNode = imageNode
      
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let vStack = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .stretch, children: [headerNode , imageNode , socialNode])
        return vStack
    }
}
