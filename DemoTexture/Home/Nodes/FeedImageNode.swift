//
//  FeedImageNode.swift
//  DemoTexture
//
//  Created by 3embed on 16/09/24.
//

import AsyncDisplayKit

class FeedImageNode: BaseNode {
    var imageNode = ASNetworkImageNode()
    var videoNode = ASVideoNode()
    let socialNode = VerticleSocialContentNode()
    let socialNodeHorizontal = SocialNode()
    init(data : String) {
        super.init()
        populateWithURL(url: data)
        setUp()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let overlaySpec = ASOverlayLayoutSpec(child: videoNode, overlay: socialNode)

        return ASInsetLayoutSpec(insets: .zero, child: overlaySpec)
    }
    
    
    func setUp(){
        videoNode.backgroundColor = .purple
        self.videoNode.style.preferredSize.height = UIScreen.main.bounds.width / 2
        self.videoNode.style.preferredSize.width = UIScreen.main.bounds.width
        
       
        videoNode.shouldAutoplay = true
        videoNode.shouldAutorepeat = true
        videoNode.player?.externalPlaybackVideoGravity = .resizeAspect
        videoNode.player?.play()
        
    }
    func populateWithURL(url : String){
        let asset = AVAsset(url: URL(string: url)!)
        videoNode.asset = asset
        
    }
}


class VerticleSocialContentNode : BaseNode{
    let shareButtonNode = ASButtonNode()
    let likesButtonNode = ASButtonNode()
    let commentsButtonNode = ASButtonNode()
    let bookmarkButtonNode = ASButtonNode()

    
    override init() {
        super.init()
        setUpNode()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let socialVStack = ASStackLayoutSpec(direction: .vertical, spacing: 20, justifyContent: .spaceBetween, alignItems: .end, children: [shareButtonNode , likesButtonNode , commentsButtonNode , bookmarkButtonNode])
        socialVStack.style.flexGrow = 1
        
        let insets = ASInsetLayoutSpec(insets: .init(top: 20, left: 0, bottom: 0, right: 0), child: socialVStack)
        
        return insets
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
        self.shareButtonNode.backgroundColor = .cyan
   }
}

class OverlaySocialNode: BaseNode {
    
    var imageNode: FeedImageNode!
    let horizontalSocialView = SocialNode()
    var sliderNode: ASDisplayNode!
    
    init(dataOfVideo: String) {
        super.init()
        self.automaticallyManagesSubnodes = true
        
        // Initialize FeedImageNode with the video data
        self.imageNode = FeedImageNode(data: dataOfVideo)
        
        // Create an ASDisplayNode to host the UISlider
        self.sliderNode = ASDisplayNode(viewBlock: {
            let slider = UISlider(frame: .init(x: 0, y: 0, width: 100, height: 30))
            // Customize the slider properties if needed
            slider.minimumValue = 0
            slider.maximumValue = 100
            return slider
        })
        // Set the node's automaticallyManagesSubnodes to true
        self.sliderNode.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        // Use ASInsetLayoutSpec to add padding around the slider
        let insets = ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 150), child: sliderNode)
        
        // Overlay the slider on top of the imageNode
        let overlay = ASOverlayLayoutSpec(child: imageNode, overlay: insets)
        
        return overlay
    }
}

