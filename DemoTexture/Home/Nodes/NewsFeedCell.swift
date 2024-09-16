//
//  NewsFeedCell.swift
//  DemoTexture
//
//  Created by 3embed on 14/09/24.
//


import AsyncDisplayKit

class NewsFeedCell: BaseCellNode {
    let headerNode = HeaderNode()
    let imageNode = FeedImageNode()
    let socialNode = SocialNode()
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let vStack = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .stretch, children: [headerNode , imageNode , socialNode])
        return vStack
    }
}
