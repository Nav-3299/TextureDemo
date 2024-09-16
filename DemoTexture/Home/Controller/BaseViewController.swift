//
//  BaseViewController.swift
//  DemoTexture
//
//  Created by 3embed on 14/09/24.
//

import AsyncDisplayKit

class BaseViewController: ASDKViewController<BaseNode> {
    var newsFeed : HomePresentation!
    override init() {
        super.init(node: BaseNode())
        newsFeed = HomePresentation()
        self.node.addSubnode(newsFeed)
        self.node.backgroundColor = .cyan
        
        self.node.layoutSpecBlock = {(node , constrainedSize) in
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.newsFeed)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }


}
