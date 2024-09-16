//
//  HeaderNode.swift
//  DemoTexture
//
//  Created by 3embed on 15/09/24.
//

import AsyncDisplayKit

class HeaderNode: BaseNode {
    var profileImageNode = ASNetworkImageNode()
    var nameNode = ASTextNode()
    var extraButton = ASButtonNode()
    var ellipseNode = ASImageNode()
    
    override init() {
        super.init()
        setUp()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let leftPadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0), child: profileImageNode)
        
        let iconSpec = ASStackLayoutSpec(direction: .horizontal,
                                         spacing: 0,
                                         justifyContent: .end,
                                         alignItems: .end,
                                         children: [extraButton])
        let rightPadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16), child: iconSpec)
        rightPadding.style.flexGrow = 1
        
        let finalSpec = ASStackLayoutSpec(direction: .horizontal,
                                          spacing: 10,
                                          justifyContent: .start,
                                          alignItems: .center,
                                          children: [leftPadding , nameNode , rightPadding])
        
        return finalSpec
    }
    
    func setUp(){
        profileImageNode.backgroundColor = .green
        profileImageNode.cornerRadius = 35/2
        profileImageNode.style.preferredSize = CGSize(width: 35, height: 35)
        nameNode.attributedText = NSAttributedString(string: "Texture is Cool" , attributes: [.font : UIFont.boldSystemFont(ofSize: 17) ,
            .foregroundColor : UIColor.blue])
        ellipseNode.imageModificationBlock = ASImageNodeTintColorModificationBlock(.blue)
        ellipseNode.image = UIImage(resource: .ellipse)
        extraButton.setImage(ellipseNode.image, for: .normal)
        
        extraButton.style.preferredSize = CGSize(width: 10, height: 10)
       
    }
    
}

