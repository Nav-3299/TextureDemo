//
//  FeedImageNode.swift
//  DemoTexture
//
//  Created by 3embed on 16/09/24.
//

import AsyncDisplayKit

class FeedImageNode: BaseNode {
    var imageNode = ASNetworkImageNode()
    
    override init() {
        super.init()
        setUp()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: imageNode)
    }
    
    func setUp(){
        imageNode.backgroundColor = .purple
        self.imageNode.style.preferredSize.height = UIScreen.main.bounds.width / 2
        self.imageNode.style.preferredSize.width = UIScreen.main.bounds.width
    }
}

