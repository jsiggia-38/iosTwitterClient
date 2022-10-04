//
//  TweetCell.swift
//  Twitter
//
//  Created by PS101k on 9/25/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    var favorited: Bool = false
    var retweeted: Bool = false
    var tweetId: Int = -1
    
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {self.setRetweeted(true)}, failure: { (error) in print ("error in retweeting")
            
        })
        
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
    let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setFavorite(true)}, failure: {(error) in print("favorite did not succeed")})
        }
        
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {self.setFavorite(false)}, failure: {(error) in print("unfavorite did not succeed")})
        }
    }
    
    
    
    
    func setFavorite(_ isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for:UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted: Bool) {
        retweeted = isRetweeted
        if(retweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
