### test doh and dot
https://getdnsapi.net/query/

### use curl

```sh
curl -v --doh-url https://draco.plan9-ns2.com/dns-query https://www.google.com
* Expire in 0 ms for 6 (transfer 0x55b0eb7a3fb0)
* Expire in 0 ms for 6 (transfer 0x55b0eb7a7110)
* Expire in 0 ms for 6 (transfer 0x55b0eb7cbba0)
* Expire in 300000 ms for 8 (transfer 0x55b0eb7a7110)
* Expire in 1 ms for 1 (transfer 0x55b0eb7a7110)
* Expire in 300000 ms for 8 (transfer 0x55b0eb7cbba0)
* Found bundle for host draco.plan9-ns2.com: 0x55b0eb7a2de0 [serially]
* Server doesn't support multi-use (yet)
* Expire in 1 ms for 1 (transfer 0x55b0eb7cbba0)
* Expire in 0 ms for 1 (transfer 0x55b0eb7a7110)
yadda, yadda
* Expire in 50 ms for 1 (transfer 0x55b0eb7cbba0)
* Expire in 50 ms for 1 (transfer 0x55b0eb7a7110)
*   Trying 45.63.110.187...
* TCP_NODELAY set
* Expire in 149969 ms for 3 (transfer 0x55b0eb7a7110)
* Expire in 200 ms for 4 (transfer 0x55b0eb7a7110)
* Hostname 'draco.plan9-ns2.com' was found in DNS cache
* Expire in 50 ms for 1 (transfer 0x55b0eb7cbba0)
*   Trying 45.63.110.187...
* TCP_NODELAY set
* Expire in 149969 ms for 3 (transfer 0x55b0eb7cbba0)
* Expire in 200 ms for 4 (transfer 0x55b0eb7cbba0)
* Connected to draco.plan9-ns2.com (45.63.110.187) port 443 (#1)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* Connected to draco.plan9-ns2.com (45.63.110.187) port 443 (#2)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-ns2.com
*  start date: Feb 21 04:37:53 2021 GMT
*  expire date: May 22 04:37:53 2021 GMT
*  subjectAltName: host "draco.plan9-ns2.com" matched cert's "draco.plan9-ns2.com"
*  issuer: C=US; O=Let's Encrypt; CN=R3
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55b0eb7a7110)
> POST /dns-query HTTP/2
Host: draco.plan9-ns2.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* old SSL session ID is stale, removing
* We are completely uploaded and fine
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-ns2.com
*  start date: Feb 21 04:37:53 2021 GMT
*  expire date: May 22 04:37:53 2021 GMT
*  subjectAltName: host "draco.plan9-ns2.com" matched cert's "draco.plan9-ns2.com"
*  issuer: C=US; O=Let's Encrypt; CN=R3
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55b0eb7cbba0)
> POST /dns-query HTTP/2
Host: draco.plan9-ns2.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* old SSL session ID is stale, removing
* We are completely uploaded and fine
* Connection state changed (MAX_CONCURRENT_STREAMS == 65535)!
* Connection state changed (MAX_CONCURRENT_STREAMS == 65535)!
< HTTP/2 200 
< content-type: application/dns-message
< content-length: 48
< cache-control: max-age=300
< 
* Connection #1 to host draco.plan9-ns2.com left intact
* a DOH request is completed, 1 to go
< HTTP/2 200 
< content-type: application/dns-message
< content-length: 60
< cache-control: max-age=300
< 
* Could not resolve host: draco.plan9-ns2.com
* Closing connection 2
* a DOH request is completed, 0 to go
* Expire in 0 ms for 6 (transfer 0x55b0eb7a3fb0)
* DOH Host name: www.google.com
* TTL: 300 seconds
* DOH A: 172.217.8.132
* DOH AAAA: 2607:f8b0:4008:0803:0000:0000:0000:2004
*   Trying 172.217.8.132...
* TCP_NODELAY set
* Expire in 149908 ms for 3 (transfer 0x55b0eb7a3fb0)
* Expire in 200 ms for 4 (transfer 0x55b0eb7a3fb0)
* Connected to www.google.com (172.217.8.132) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: C=US; ST=California; L=Mountain View; O=Google LLC; CN=www.google.com
*  start date: Feb 23 15:43:15 2021 GMT
*  expire date: May 18 15:43:14 2021 GMT
*  subjectAltName: host "www.google.com" matched cert's "www.google.com"
*  issuer: C=US; O=Google Trust Services; CN=GTS CA 1O1
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55b0eb7a3fb0)
> GET / HTTP/2
> Host: www.google.com
> User-Agent: curl/7.64.0
> Accept: */*
> 
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
* Connection state changed (MAX_CONCURRENT_STREAMS == 100)!
< HTTP/2 200 
< date: Sun, 14 Mar 2021 22:12:46 GMT
< expires: -1
< cache-control: private, max-age=0
< content-type: text/html; charset=ISO-8859-1
< p3p: CP="This is not a P3P policy! See g.co/p3phelp for more info."
< server: gws
< x-xss-protection: 0
< x-frame-options: SAMEORIGIN
< set-cookie: 1P_JAR=2021-03-14-22; expires=Tue, 13-Apr-2021 22:12:46 GMT; path=/; domain=.google.com; Secure
< set-cookie: NID=211=i2FILSJpvysAWYart6WoGkyg9kPpKEuIeVwZmEOFl9ee91QMSZmRNKSV8Osn3KoHyPM-7gpkgAk0XTcUucIXaTjixttlCLZpM8A-iU53PkNYrrLMolN6Xl7ZPdi04cghko1A_3wPDWxtIc3h7aVn4RREJVjrUwmQbmtm6Vw2CQg; expires=Mon, 13-Sep-2021 22:12:46 GMT; path=/; domain=.google.com; HttpOnly
< alt-svc: h3-29=":443"; ma=2592000,h3-T051=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"
< accept-ranges: none
< vary: Accept-Encoding
< 
<!doctype html><html itemscope="" itemtype="http://schema.org/WebPage" lang="en"><head><meta content="Search the world's information, including webpages, images, videos and more. Google has many special features to help you find exactly what you're looking for." name="description"><meta content="noodp" name="robots"><meta content="text/html; charset=UTF-8" http-equiv="Content-Type"><meta content="/images/branding/googleg/1x/googleg_standard_color_128dp.png" itemprop="image"><title>Google</title><script nonce="dxECUW5dg3Tlti9TeVnQkQ==">(function(){window.google={kEI:'XopOYOK5NuTP5gLf04_YAQ',kEXPI:'0,18167,1284266,56976,954,5105,206,4804,2316,383,246,5,1353,4937,314,2342,1120174,1233,1196489,169,391,302680,26305,51223,16115,17444,1954,9286,9188,8384,4858,1362,9291,3021,4746,12841,1238,2782,978,13227,2055,920,873,4192,6430,1142,13386,4517,2777,919,2277,8,2796,889,704,1279,1042,1170,532,147,1103,840,517,1466,56,4258,1447,1,3,2049,14,606,2023,1733,43,521,4269,328,1286,8787,2273,1,953,2845,7,12354,5096,7877,4928,108,1483,1925,907,2,941,2614,2397,7468,1,2844,432,3,346,1244,1,820,1,4624,148,5992,5331,2652,4,1528,2304,1236,1145,4081,577,74,1717,266,1523,1104,459,1555,4067,5634,1426,374,3824,1297,1753,2658,4299,462,912,564,1119,31,1173,2681,23,4252,2880,2619,1592,494,219,638,37,1457,605,2,4979,9206,559,28,11,731,665,1054,1093,375,3308,2527,479,512,1057,905,1144,64,99,2091,881,6,614,294,3,163,1514,1864,1,1036,2,3139,1172,636,1014,2675,771,4265,1,1186,627,38,245,972,3374,1164,6,770,618,1260,239,943,2,395,673,450,686,345,1761,432,2859,424,286,77,121,18,425,1130,2,1394,110,1,645,659,110,8,1,26,364,882,1345,208,5,157,2,517,2520,1797,1,769,2714,894,12,165,450,4,50,4,49,439,27,329,479,59,4,106,323,63,2,2,904,100,1044,189,46,101,918,809,2,61,24,418,32,310,88,126,40,110,148,586,2,544,33,417,108,1016,30,8,603,1075,66,365,183,213,347,13,860,699,2,2,2,5676836,3870,35,100,2,102,5996590,510,2800707,549,333,444,1,2,80,1,1796,1,9,2,2551,1,889,795,2,561,1,4265,1,1,2,1331,3299,843,1,2608,172,13,72,174,9,155,13,16,46,5,39,62,35,41,6,6,20,4,2,1,1,2,1,1,9,30,5,33,4,4,20736657,3220014,150,1515841,1260215,1234067,267,27384,2,189',kBL:'2D1b'};google.sn='webhp';google.kHL='en';})();(function(){
var f=[];google.getEI=function(a){for(var b;a&&(!a.getAttribute||!(b=a.getAttribute("eid")));)a=a.parentNode;return b||google.kEI};google.getLEI=function(a){for(var b=null;a&&(!a.getAttribute||!(b=a.getAttribute("leid")));)a=a.parentNode;return b};google.ml=function(){return null};google.log=function(a,b,c,d,g){if(c=google.logUrl(a,b,c,d,g)){a=new Image;var e=f.length;f[e]=a;a.onerror=a.onload=a.onabort=function(){delete f[e]};a.src=c}};google.logUrl=function(a,b,c,d,g){var e="";c||-1!=b.search("&ei=")||(e="&ei="+google.getEI(d),-1==b.search("&lei=")&&(d=google.getLEI(d))&&(e+="&lei="+d));d="";!c&&window._cshid&&-1==b.search("&cshid=")&&"slh"!=a&&(d="&cshid="+window._cshid);c=c||"/"+(g||"gen_204")+"?atyp=i&ct="+a+"&cad="+b+e+"&zx="+Date.now()+d;/^http:/i.test(c)&&"https:"==window.location.protocol&&(google.ml(Error("a"),!1,{src:c,glmm:1}),c="");return c};}).call(this);(function(){google.y={};google.x=function(a,b){if(a)var c=a.id;else{do c=Math.random();while(google.y[c])}google.y[c]=[a,b];return!1};google.lm=[];google.plm=function(a){google.lm.push.apply(google.lm,a)};google.lq=[];google.load=function(a,b,c){google.lq.push([[a],b,c])};google.loadAll=function(a,b){google.lq.push([a,b])};google.bx=!1;google.lx=function(){};}).call(this);google.f={};(function(){
document.documentElement.addEventListener("submit",function(b){var a;if(a=b.target){var c=a.getAttribute("data-submitfalse");a="1"==c||"q"==c&&!a.elements.q.value?!0:!1}else a=!1;a&&(b.preventDefault(),b.stopPropagation())},!0);document.documentElement.addEventListener("click",function(b){var a;a:{for(a=b.target;a&&a!=document.documentElement;a=a.parentElement)if("A"==a.tagName){a="1"==a.getAttribute("data-nohref");break a}a=!1}a&&b.preventDefault()},!0);}).call(this);
var a=window.location,b=a.href.indexOf("#");if(0<=b){var c=a.href.substring(b+1);/(^|&)q=/.test(c)&&-1==c.indexOf("#")&&a.replace("/search?"+c.replace(/(^|&)fp=[^&]*/g,"")+"&cad=h")};</script><style>#gbar,#guser{font-size:13px;padding-top:1px !important;}#gbar{height:22px}#guser{padding-bottom:7px !important;text-align:right}.gbh,.gbd{border-top:1px solid #c9d7f1;font-size:1px}.gbh{height:0;position:absolute;top:24px;width:100%}@media all{.gb1{height:22px;margin-right:.5em;vertical-align:top}#gbar{float:left}}a.gb1,a.gb4{text-decoration:underline !important}a.gb1,a.gb4{color:#00c !important}.gbi .gb4{color:#dd8e27 !important}.gbf .gb4{color:#900 !important}
</style><style>body,td,a,p,.h{font-family:arial,sans-serif}body{margin:0;overflow-y:scroll}#gog{padding:3px 8px 0}td{line-height:.8em}.gac_m td{line-height:17px}form{margin-bottom:20px}.h{color:#1558d6}em{font-weight:bold;font-style:normal}.lst{height:25px;width:496px}.gsfi,.lst{font:18px arial,sans-serif}.gsfs{font:17px arial,sans-serif}.ds{display:inline-box;display:inline-block;margin:3px 0 4px;margin-left:4px}input{font-family:inherit}body{background:#fff;color:#000}a{color:#4b11a8;text-decoration:none}a:hover,a:active{text-decoration:underline}.fl a{color:#1558d6}a:visited{color:#4b11a8}.sblc{padding-top:5px}.sblc a{display:block;margin:2px 0;margin-left:13px;font-size:11px}.lsbb{background:#f8f9fa;border:solid 1px;border-color:#dadce0 #70757a #70757a #dadce0;height:30px}.lsbb{display:block}#WqQANb a{display:inline-block;margin:0 12px}.lsb{background:url(/images/nav_logo229.png) 0 -261px repeat-x;border:none;color:#000;cursor:pointer;height:30px;margin:0;outline:0;font:15px arial,sans-serif;vertical-align:top}.lsb:active{background:#dadce0}.lst:focus{outline:none}</style><script nonce="dxECUW5dg3Tlti9TeVnQkQ=="></script></head><body bgcolor="#fff"><script nonce="dxECUW5dg3Tlti9TeVnQkQ==">(function(){var src='/images/nav_logo229.png';var iesg=false;document.body.onload = function(){window.n && window.n();if (document.images){new Image().src=src;}
if (!iesg){document.f&&document.f.q.focus();document.gbqf&&document.gbqf.q.focus();}
}
})();</script><div id="mngb"><div id=gbar><nobr><b class=gb1>Search</b> <a class=gb1 href="https://www.google.com/imghp?hl=en&tab=wi">Images</a> <a class=gb1 href="https://maps.google.com/maps?hl=en&tab=wl">Maps</a> <a class=gb1 href="https://play.google.com/?hl=en&tab=w8">Play</a> <a class=gb1 href="https://www.youtube.com/?gl=US&tab=w1">YouTube</a> <a class=gb1 href="https://news.google.com/?tab=wn">News</a> <a class=gb1 href="https://mail.google.com/mail/?tab=wm">Gmail</a> <a class=gb1 href="https://drive.google.com/?tab=wo">Drive</a> <a class=gb1 style="text-decoration:none" href="https://www.google.com/intl/en/about/products?tab=wh"><u>More</u> &raquo;</a></nobr></div><div id=guser width=100%><nobr><span id=gbn class=gbi></span><span id=gbf class=gbf></span><span id=gbe></span><a href="http://www.google.com/history/optout?hl=en" class=gb4>Web History</a> | <a  href="/preferences?hl=en" class=gb4>Settings</a> | <a target=_top id=gb_70 href="https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=https://www.google.com/&ec=GAZAAQ" class=gb4>Sign in</a></nobr></div><div class=gbh style=left:0></div><div class=gbh style=right:0></div></div><center><br clear="all" id="lgpd"><div id="lga"><img alt="Google" height="92" src="/images/branding/googlelogo/1x/googlelogo_white_background_color_272x92dp.png" style="padding:28px 0 14px" width="272" id="hplogo"><br><br></div><form action="/search" name="f"><table cellpadding="0" cellspacing="0"><tr valign="top"><td width="25%">&nbsp;</td><td align="center" nowrap=""><input name="ie" value="ISO-8859-1" type="hidden"><input value="en" name="hl" type="hidden"><input name="source" type="hidden" value="hp"><input name="biw" type="hidden"><input name="bih" type="hidden"><div class="ds" style="height:32px;margin:4px 0"><input class="lst" style="margin:0;padding:5px 8px 0 6px;vertical-align:top;color:#000" autocomplete="off" value="" title="Google Search" maxlength="2048" name="q" size="57"></div><br style="line-height:0"><span class="ds"><span class="lsbb"><input class="lsb" value="Google Search" name="btnG" type="submit"></span></span><span class="ds"><span class="lsbb"><input class="lsb" id="tsuid1" value="I'm Feeling Lucky" name="btnI" type="submit"><script nonce="dxECUW5dg3Tlti9TeVnQkQ==">(function(){var id='tsuid1';document.getElementById(id).onclick = function(){if (this.form.q.value){this.checked = 1;if (this.form.iflsig)this.form.iflsig.disabled = false;}
else top.location='/doodles/';};})();</script><input value="AINFCbYAAAAAYE6YbtDUP41OpnmoD4UzupOutj_Gyor6" name="iflsig" type="hidden"></span></span></td><td class="fl sblc" align="left" nowrap="" width="25%"><a href="/advanced_search?hl=en&amp;authuser=0">Advanced search</a></td></tr></table><input id="gbv" name="gbv" type="hidden" value="1"><script nonce="dxECUW5dg3Tlti9TeVnQkQ==">(function(){var a,b="1";if(document&&document.getElementById)if("undefined"!=typeof XMLHttpRequest)b="2";else if("undefined"!=typeof ActiveXObject){var c,d,e=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];for(c=0;d=e[c++];)try{new ActiveXObject(d),b="2"}catch(h){}}a=b;if("2"==a&&-1==location.search.indexOf("&gbv=2")){var f=google.gbvu,g=document.getElementById("gbv");g&&(g.value=a);f&&window.setTimeout(function(){location.href=f},0)};}).call(this);</script></form><div id="gac_scont"></div><div style="font-size:83%;min-height:3.5em"><br></div><span id="footer"><div style="font-size:10pt"><div style="margin:19px auto;text-align:center" id="WqQANb"><a href="/intl/en/ads/">Advertising�Programs</a><a href="/services/">Business Solutions</a><a href="/intl/en/about.html">About Google</a></div></div><p style="font-size:8pt;color:#70757a">&copy; 2021 - <a href="/intl/en/policies/privacy/">Privacy</a> - <a href="/intl/en/policies/terms/">Terms</a></p></span></center><script nonce="dxECUW5dg3Tlti9TeVnQkQ==">(function(){window.google.cdo={height:0,width:0};(function(){var a=window.innerWidth,b=window.innerHeight;if(!a||!b){var c=window.document,d="CSS1Compat"==c.compatMode?c.documentElement:c.body;a=d.clientWidth;b=d.clientHeight}a&&b&&(a!=google.cdo.width||b!=google.cdo.height)&&google.log("","","/client_204?&atyp=i&biw="+a+"&bih="+b+"&ei="+google.kEI);}).call(this);})();(function(){var u='/xjs/_/js/k\x3dxjs.hp.en_US.YWm5IfJR-I4.O/m\x3dsb_he,d/am\x3dAHiCOA/d\x3d1/rs\x3dACT90oH2WWak1BeVDRwK-sIcAJKmUw-OWg';
var d=this||self,e=/^[\w+/_-]+[=]{0,2}$/,f=null,g=function(a){return(a=a.querySelector&&a.querySelector("script[nonce]"))&&(a=a.nonce||a.getAttribute("nonce"))&&e.test(a)?a:""},h=function(a){return a};var l;var n=function(a,b){this.g=b===m?a:""};n.prototype.toString=function(){return this.g+""};var m={};function p(){var a=u;google.lx=function(){q(a);google.lx=function(){}};google.bx||google.lx()}
function q(a){var b=document;var c="SCRIPT";"application/xhtml+xml"===b.contentType&&(c=c.toLowerCase());c=b.createElement(c);if(void 0===l){b=null;var k=d.trustedTypes;if(k&&k.createPolicy){try{b=k.createPolicy("goog#html",{createHTML:h,createScript:h,createScriptURL:h})}catch(r){d.console&&d.console.error(r.message)}l=b}else l=b}a=(b=l)?b.createScriptURL(a):a;a=new n(a,m);c.src=a instanceof n&&a.constructor===n?a.g:"type_error:TrustedResourceUrl";(a=c.ownerDocument&&c.ownerDocument.defaultView)&&
a!=d?a=g(a.document):(null===f&&(f=g(d.document)),a=f);a&&c.setAttribute("nonce",a);google.timers&&google.timers.load&&google.tick&&google.tick("load","xjsls");document.body.appendChild(c)};setTimeout(function(){p()},0);})();(function(){window.google.xjsu='/xjs/_/js/k\x3dxjs.hp.en_US.YWm5IfJR-I4.O/m\x3dsb_he,d/am\x3dAHiCOA/d\x3d1/rs\x3dACT90oH2WWak1BeVDRwK-sIcAJKmUw-OWg';})();function _DumpException(e){throw e;}
function _F_installCss(c){}
(function(){google.jl={blt:'none',dw:false,em:[],emw:false,lls:'default',pdt:0,snet:true,uwp:true};})();(function(){var pmc='{\x22d\x22:{},\x22sb_he\x22:{\x22agen\x22:true,\x22cgen\x22:true,\x22client\x22:\x22heirloom-hp\x22,\x22dh\x22:true,\x22dhqt\x22:true,\x22ds\x22:\x22\x22,\x22ffql\x22:\x22en\x22,\x22fl\x22:true,\x22host\x22:\x22google.com\x22,\x22isbh\x22:28,\x22jsonp\x22:true,\x22msgs\x22:{\x22cibl\x22:\x22Clear Search\x22,\x22dym\x22:\x22Did you mean:\x22,\x22lcky\x22:\x22I\\u0026#39;m Feeling Lucky\x22,\x22lml\x22:\x22Learn more\x22,\x22oskt\x22:\x22Input tools\x22,\x22psrc\x22:\x22This search was removed from your \\u003Ca href\x3d\\\x22/history\\\x22\\u003EWeb History\\u003C/a\\u003E\x22,\x22psrl\x22:\x22Remove\x22,\x22sbit\x22:\x22Search by image\x22,\x22srch\x22:\x22Google Search\x22},\x22nrft\x22:false,\x22ovr\x22:{},\x22pq\x22:\x22\x22,\x22refpd\x22:true,\x22rfs\x22:[],\x22sbas\x22:\x220 3px 8px 0 rgba(0,0,0,0.2),0 0 0 1px rgba(0,0,0,0.08)\x22,\x22sbpl\x22:16,\x22sbpr\x22:16,\x22scd\x22:10,\x22stok\x22:\x22QDydtbNisWeSLGA3SCiA1koIV9A\x22,\x22uhde\x22:false}}';google.pm* Connection #0 to host www.google.com left intact
c=JSON.parse(pmc);})();</script>        </body></html>
```
