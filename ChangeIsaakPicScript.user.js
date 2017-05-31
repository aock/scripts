// ==UserScript==
// @name         ChangeIsaakPicScript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://plutogo.slack.com/*
// ==/UserScript==

(function() {
    'use strict';
    var num_messages = 0;
    var pic_changed = false;
    $(document).bind("DOMSubtreeModified", function () {
        if(!pic_changed){
            // messages->small pics
            var small_pics = document.getElementsByClassName(" member_preview_link member_image thumb_36");
            var i=0;
            for(i=0; i < small_pics.length; i++){
                if(small_pics[i].href == "https://plutogo.slack.com/team/imitschke"){
                    small_pics[i].style.backgroundImage = "url('https://ca.slack-edge.com/T3UTYCN07-U3UV8V14Y-gc59a859b8bc-48')";
                }
            }
            
            // big pic
            var big_pics = document.getElementsByClassName(" member_preview_link member_image thumb_72");
            
            for(i=0; i< big_pics.length; i++){
                if(big_pics[i].href == "https://plutogo.slack.com/team/imitschke"){
                    big_pics[i].style.backgroundImage = "url('https://ca.slack-edge.com/T3UTYCN07-U3UV8V14Y-gc59a859b8bc-72')";
                }
            }
            
            // url('https://ca.slack-edge.com/T3UTYCN07-U4UPY0CVB-g3b4aa61118f-512'), url('https://ca.slack-edge.com/T3UTYCN07-U4UPY0CVB-g3b4aa61118f-48')"
            var big_big_pics = document.getElementsByClassName("  member_image thumb_512");
            
            for(i=0; i < big_big_pics.length; i++){
                if( big_big_pics[i].getAttribute("data-member-id") == "U4UPY0CVB"){
                    big_big_pics[i].style.backgroundImage = "url('https://ca.slack-edge.com/T3UTYCN07-U3UV8V14Y-gc59a859b8bc-512'), url('https://ca.slack-edge.com/T3UTYCN07-U3UV8V14Y-gc59a859b8bc-48')";
                }
            }
        }
    });
})();