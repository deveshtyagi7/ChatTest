//
//  ChatScreenCVC.swift
//  ChatTest
//
//  Created by Devesh Tyagi on 18/12/20.
//

import Foundation
import UIKit

class ChatLogController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
 
    
    var messages : [String]? = ["Hiii how ervghvrfgr?"  , "dghjdghdgmhvhgfhfghfhgfhfhfhjgjgjgjhbjbjhbjhvhjvhjvjhvjhvjhhdghjdvhd", "djhdghjgdhd" , "dmwgjhfgdhw d wmdwdjg wjc kscosmbcsvjhc vwvckuw","Hiii how ervghvrfgr?" , "dghjdghdgmhvhgfhfghfhgfhfhfhjgjgjgjhbjbjhbjhvhjvhjvjhvjhvjhhdghjdvhd", "djhdghjgdhd" , "dmwgjhfgdhw d wmdwdjg wjc kscosmbcsvjhc vwvckuw", "dghjdghdgmhvhgfhfghfhgfhfhfhjgjgjgjhbjbjhbjhvhjvhjvjhvjhvjhhdghjdvhd", "djhdghjgdhd" , "dmwgjhfgdhw d wmdwdjg wjc kscosmbcsvjhc vwvckuw","Hiii how ervghvrfgr?"  , "dghjdghdgmhvhgfhfghfhgfhfhfhjgjgjgjhbjbjhbjhvhjvhjvjhvjhvjhhdghjdvhd", "djhdghjgdhd" , "dmwgjhfgdhw d wmdwdjg wjc kscosmbcsvjhc vwvckuw","Hiii how ervghvrfgr?" , "dghjdghdgmhvhgfhfghfhgfhfhfhjgjgjgjhbjbjhbjhvhjvhjvjhvjhvjhhdghjdvhd", "djhdghjgdhd" , "dmwgjhfgdhw d wmdwdjg wjc kscosmbcsvjhc vwvckuw", "dghjdghdgmhvhgfhfghfhgfhfhfhjgjgjgjhbjbjhbjhvhjvhjvjhvjhvjhhdghjdvhd", "djhdghjgdhd" , "dmwgjhfgdhw d wmdwdjg wjc kscosmbcsvjhc vwvckuw"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        navigationItem.title = "Devesh"
        collectionView?.register(ChatLogMessageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatLogMessageCell
        
        cell.messageTextView.text = messages?[indexPath.item]
        if let message = messages?[indexPath.item]{
            
           // cell.profileImageView.image = UIImage(named: profileImageName)
            
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: message).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
            
         //   if message.isSender == nil || !message.isSender!.boolValue {
            if  indexPath.item % 2 == 0{
                cell.messageTextView.frame = CGRect(x: 28 , y: 0, width: estimatedFrame.width + 16, height: estimatedFrame.height + 20)
                    
                cell.textBubbleView.frame = CGRect(x: 20, y: -4, width: estimatedFrame.width + 16 + 8 + 10, height: estimatedFrame.height + 20 + 6)
                    
                  
                    
    //                cell.textBubbleView.backgroundColor = UIColor(white: 0.95, alpha: 1)
                    cell.bubbleImageView.image = ChatLogMessageCell.grayBubbleImage
                    cell.bubbleImageView.tintColor = #colorLiteral(red: 0.8196078431, green: 0.8862745098, blue: 0.9215686275, alpha: 1)
                    cell.messageTextView.textColor = UIColor.black
            }else {

                //outgoing sending message
                let width  = view.frame.width
                
                cell.messageTextView.frame = CGRect(x: (width - estimatedFrame.width - 40), y: 0,width: estimatedFrame.width + 16,height: estimatedFrame.height + 20)
                
                cell.textBubbleView.frame = CGRect(x: (width - estimatedFrame.width - 50),y: -4,width: estimatedFrame.width + 16 + 8 + 10,height: estimatedFrame.height + 20 + 6)
                
            
                

              

//                cell.textBubbleView.backgroundColor = UIColor(red: 0, green: 137/255, blue: 249/255, alpha: 1)
                cell.bubbleImageView.image = ChatLogMessageCell.blueBubbleImage
                cell.bubbleImageView.tintColor = #colorLiteral(red: 0.937254902, green: 0.9333333333, blue: 0.8509803922, alpha: 1)
                cell.messageTextView.textColor = UIColor.black
            }
//
            
            
        }
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let messageText = messages?[indexPath.item] {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 20)
        }
        
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
    
}

class ChatLogMessageCell: BaseCell {
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "Sample message"
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    let textBubbleView: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
//    let profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 15
//        imageView.layer.masksToBounds = true
//        return imageView
//    }()
//
    static let grayBubbleImage = UIImage(named: "Receiver")!.resizableImage(withCapInsets: UIEdgeInsets(top: 22, left: 26, bottom: 22, right: 26)).withRenderingMode(.alwaysTemplate)
    static let blueBubbleImage = UIImage(named: "Receiver")!.resizableImage(withCapInsets: UIEdgeInsets(top: 22, left: 26, bottom: 22, right: 26)).withRenderingMode(.alwaysTemplate)
    
    let bubbleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ChatLogMessageCell.grayBubbleImage
        imageView.tintColor = UIColor(white: 0.90, alpha: 1)
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(textBubbleView)
        addSubview(messageTextView)
        
//        addSubview(profileImageView)
//        addConstraintsWithFormat(format: "H:|-8-[v0(30)]", views: profileImageView)
//        addConstraintsWithFormat(format: "V:[v0(30)]|", views: profileImageView)
       // profileImageView.backgroundColor = UIColor.red
        
        textBubbleView.addSubview(bubbleImageView)
        textBubbleView.addConstraintsWithFormat(format: "H:|[v0]|", views: bubbleImageView)
        textBubbleView.addConstraintsWithFormat(format: "V:|[v0]|", views: bubbleImageView)
    }
    
}











extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}

