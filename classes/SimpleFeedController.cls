global class SimpleFeedController {

    public String communityId {
        get;
        
        set {
            if (value == '') {
                communityId = null;
            } else {
                communityId = value;
            }
        }
    }

    global static List<SelectOption> getCommunityOptions() {
        List<SelectOption> options = new List<SelectOption>();
        
        options.add(new SelectOption('', 'Internal'));
        
        ConnectApi.CommunityPage communityPage = ConnectApi.Communities.getCommunities(ConnectApi.CommunityStatus.Live);
        for (ConnectApi.Community community : communityPage.communities) {
            options.add(new SelectOption(community.id, community.name));
        }
        return options;
    }

    global List<ConnectApi.FeedItem> getNewsFeedItems() {
        return ConnectApi.ChatterFeeds.getFeedItemsFromFeed(communityId, ConnectApi.FeedType.News, 'me').items;
    }
    
    public PageReference choose() {
 	 	return null;
 	}
    
}