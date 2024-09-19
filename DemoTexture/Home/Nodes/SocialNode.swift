//
//  SocialNode.swift
//  DemoTexture
//
//  Created by 3embed on 16/09/24.
//

import AsyncDisplayKit

class SocialNode: BaseNode {
    let shareButtonNode = ASButtonNode()
    let likesButtonNode = ASButtonNode()
    let commentsButtonNode = ASButtonNode()
    let bookmarkButtonNode = ASButtonNode()

    
    override init() {
        super.init()
        setUpNode()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let bookmarkHstack = ASStackLayoutSpec(direction: .horizontal,
                                       spacing: 0,
                                       justifyContent: .end,
                                       alignItems: .end,
                                       children: [bookmarkButtonNode])
        let bookmarkPadding = ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 10), child: bookmarkHstack)
        bookmarkPadding.style.flexGrow = 1
        
        let socialHstack = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .start, alignItems: .stretch, children: [likesButtonNode,commentsButtonNode,shareButtonNode,bookmarkPadding])
        let socialPadding = ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 0), child: socialHstack)
        
        return socialPadding
    }
    
    func setUpNode(){
        shareButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        likesButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        commentsButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        bookmarkButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        
        shareButtonNode.setImage(UIImage(resource: .share), for: .normal)
        likesButtonNode.setImage(UIImage(resource: .likes), for: .normal)
        commentsButtonNode.setImage(UIImage(resource: .comments), for: .normal)
        bookmarkButtonNode.setImage(UIImage(resource: .bookmark), for: .normal)
        
        shareButtonNode.addTarget(self, action: #selector(shareButtonPressed), forControlEvents: .touchUpInside)
    }
    @objc func shareButtonPressed(){
        self.shareButtonNode.backgroundColor = .green
    }
}
