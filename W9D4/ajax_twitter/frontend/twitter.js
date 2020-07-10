const FollowToggle = require('./follow_toggle')

$(() => {
    const $buttons = $('button.follow-toggle');
    $buttons.each(function(i, el) {
        let toggle = new FollowToggle(el);
    })
})