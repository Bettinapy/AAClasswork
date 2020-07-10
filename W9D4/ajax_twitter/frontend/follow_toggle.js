const APIUtil = require("./api_util.js")

function FollowToggle (el) {
    this.$el = $(el);
    this.userId = this.$el.attr("data-user-id");
    this.followState = this.$el.attr("data-initial-follow-state");
    this.render();
    this.handleClick();
}

FollowToggle.prototype.render = function () {
    if (this.followState === 'unfollowed') {
        this.$el.text ('follow!');
        this.$el.prop('disabled', false);
    } else if (this.followState === 'unfollowing') {
        this.$el.prop('disabled', true);
        this.$el.text ('unfollowing!');
    } else if (this.followState === 'following'){
        this.$el.prop('disabled', true);
        this.$el.text('following!');
    } else { 
        this.$el.text('unfollow!');
        this.$el.prop('disabled', false);
    }
}

FollowToggle.prototype.handleClick = function(){
    this.$el.on('click', event => {
        event.preventDefault();
        if (this.followState === 'unfollowed') {
            this.followState = 'following';
            this.render();
            APIUtil.followUser(this.userId).then(()=>{
                this.followState = 'followed';
                this.render();
            });
            // this.followState = 'followed';
            // this.render();
        } else {
            this.followState = 'unfollowing';
            this.render();
            APIUtil.unfollowUser(this.userId).then(()=>{
                this.followState = 'unfollowed';
                this.render();
            });
            // this.followState = 'unfollowed';
            // this.render();
        }
    })
}

module.exports = FollowToggle;