"use strict";(function(){function a(a,b){let c=k[a][0],d=k[a][1],e=[];for(let c in d){let a=d[c];a==j&&(a=i18n.getMessage("stats_share_message",b)),e.push(encodeURIComponent(c)+"="+encodeURIComponent(a))}return c+"?"+e.join("&")}function b(){let a=document.getElementById("stats-page"),b=f(i).toLocaleString();i18n.setElementText(a,"stats_label_page",[b]);let c=document.getElementById("stats-total"),d=h.blocked_total.toLocaleString();i18n.setElementText(c,"stats_label_total",[d])}function c(b){let c=h.blocked_total;c=9e3>=c||1e4<=c?c.toLocaleString():i18n.getMessage("stats_over",9e3.toLocaleString()),ext.pages.open(a(b.target.dataset.social,c))}function d(){h.show_statsinicon=!h.show_statsinicon,document.getElementById("show-iconnumber").setAttribute("aria-checked",h.show_statsinicon)}const{require:e}=ext.backgroundPage.getWindow(),{getBlockedPerPage:f}=e("stats"),{FilterNotifier:g}=e("filterNotifier"),{Prefs:h}=e("prefs");let i;let j={},k={facebook:["https://www.facebook.com/dialog/feed",{app_id:"475542399197328",link:"",redirect_uri:"https://www.facebook.com/",ref:"adcounter",name:j,actions:JSON.stringify([{name:i18n.getMessage("stats_share_download"),link:""}])}],gplus:["https://plus.google.com/share",{url:""}],twitter:["https://twitter.com/intent/tweet",{text:j,url:"",via:"AdblockPlus"}]};document.addEventListener("DOMContentLoaded",function(){document.getElementById("share-box").addEventListener("click",c,!1);let a=document.getElementById("show-iconnumber");a.setAttribute("aria-checked",h.show_statsinicon),a.addEventListener("click",d,!1),document.querySelector("label[for='show-iconnumber']").addEventListener("click",d,!1),ext.pages.query({active:!0,lastFocusedWindow:!0},a=>{i=a[0],b(),g.on("filter.hitCount",b),document.getElementById("stats-container").removeAttribute("hidden")})},!1),window.addEventListener("unload",function(){g.off("filter.hitCount",b)},!1)})();