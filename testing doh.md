### test doh and dot
- [get DNS api.net](https://getdnsapi.net/query)

### use curl

```sh
jason@dq77mk:~$ curl -v --doh-url https://kronos.plan9-dns.com/dns-query https://www.google.com
```
* Expire in 0 ms for 6 (transfer 0x55c80fff10f0)
* Expire in 0 ms for 6 (transfer 0x55c80fff4250)
* Expire in 0 ms for 6 (transfer 0x55c810018ce0)
* Expire in 300000 ms for 8 (transfer 0x55c80fff4250)
* Expire in 1 ms for 1 (transfer 0x55c80fff4250)
* Expire in 300000 ms for 8 (transfer 0x55c810018ce0)
* Found bundle for host kronos.plan9-dns.com: 0x55c80ffeff20 [serially]
* Server doesn't support multi-use (yet)
* Expire in 1 ms for 1 (transfer 0x55c810018ce0)
* Expire in 0 ms for 1 (transfer 0x55c80fff4250) \
...yada,yada,yada
* Expire in 12 ms for 1 (transfer 0x55c80fff4250)
* Expire in 12 ms for 1 (transfer 0x55c810018ce0)
*   Trying 207.246.87.96...
* TCP_NODELAY set
* Expire in 149981 ms for 3 (transfer 0x55c810018ce0)
* Expire in 200 ms for 4 (transfer 0x55c810018ce0)
* Expire in 12 ms for 1 (transfer 0x55c80fff4250)
* Expire in 12 ms for 1 (transfer 0x55c80fff4250)
* Hostname 'kronos.plan9-dns.com' was found in DNS cache
* Expire in 13 ms for 1 (transfer 0x55c80fff4250)
*   Trying 207.246.87.96...
* TCP_NODELAY set
* Expire in 149980 ms for 3 (transfer 0x55c80fff4250)
* Expire in 200 ms for 4 (transfer 0x55c80fff4250)
* Connected to kronos.plan9-dns.com (207.246.87.96) port 443 (#1)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* Connected to kronos.plan9-dns.com (207.246.87.96) port 443 (#2)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: none
  CApath: /etc/ssl/certs
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: May 23 00:00:00 2022 GMT
*  expire date: Aug 21 23:59:59 2022 GMT
*  subjectAltName: host "kronos.plan9-dns.com" matched cert's "kronos.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55c810018ce0)
> POST /dns-query HTTP/2
Host: kronos.plan9-dns.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* We are completely uploaded and fine
* Connection state changed (MAX_CONCURRENT_STREAMS == 16)!
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=plan9-dns.com
*  start date: May 23 00:00:00 2022 GMT
*  expire date: Aug 21 23:59:59 2022 GMT
*  subjectAltName: host "kronos.plan9-dns.com" matched cert's "kronos.plan9-dns.com"
*  issuer: C=AT; O=ZeroSSL; CN=ZeroSSL ECC Domain Secure Site CA
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55c80fff4250)
> POST /dns-query HTTP/2
Host: kronos.plan9-dns.com
Accept: */*
Content-Type: application/dns-message
Content-Length: 32

* We are completely uploaded and fine
< HTTP/2 200 
< content-length: 132
< content-type: application/dns-message
< cache-control: max-age=300, stale-if-error=86400, stale-while-revalidate=60
< date: Thu, 30 Jun 2022 21:18:47 GMT
< 
* Connection #2 to host kronos.plan9-dns.com left intact
* a DOH request is completed, 1 to go
* Connection state changed (MAX_CONCURRENT_STREAMS == 16)!
< HTTP/2 200 
< content-length: 68
< content-type: application/dns-message
< cache-control: max-age=300, stale-if-error=86400, stale-while-revalidate=60
< date: Thu, 30 Jun 2022 21:18:47 GMT
< 
* Could not resolve host: kronos.plan9-dns.com
* Closing connection 1
* a DOH request is completed, 0 to go
* Expire in 0 ms for 6 (transfer 0x55c80fff10f0)
* DOH Host name: www.google.com
* TTL: 300 seconds
* DOH A: 142.250.65.196
* DOH AAAA: 2607:f8b0:4006:080f:0000:0000:0000:2004
*   Trying 142.250.65.196...
* TCP_NODELAY set
* Expire in 149921 ms for 3 (transfer 0x55c80fff10f0)
* Expire in 200 ms for 4 (transfer 0x55c80fff10f0)
* Connected to www.google.com (142.250.65.196) port 443 (#0)
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
*  subject: CN=www.google.com
*  start date: Jun  6 09:40:00 2022 GMT
*  expire date: Aug 29 09:39:59 2022 GMT
*  subjectAltName: host "www.google.com" matched cert's "www.google.com"
*  issuer: C=US; O=Google Trust Services LLC; CN=GTS CA 1C3
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x55c80fff10f0)
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
< date: Thu, 30 Jun 2022 21:18:47 GMT
< expires: -1
< cache-control: private, max-age=0
< content-type: text/html; charset=ISO-8859-1
< p3p: CP="This is not a P3P policy! See g.co/p3phelp for more info."
< server: gws
< x-xss-protection: 0
< x-frame-options: SAMEORIGIN
< set-cookie: 1P_JAR=2022-06-30-21; expires=Sat, 30-Jul-2022 21:18:47 GMT; path=/; domain=.google.com; Secure
< set-cookie: AEC=AakniGODxrMmW5wQw23i6ykhbbAOfw1P7XPjkYwog0CMdkZFJyWhmRWl-eU; expires=Tue, 27-Dec-2022 21:18:47 GMT; path=/; domain=.google.com; Secure; HttpOnly; SameSite=lax
< set-cookie: NID=511=hSNihptusm0leGl1-Rmh1SB_FQkdJTqkgteSuIOU9N3mLLWgZMbTXW4xccktpZgsodxJW2rDBF8CVYyKjv5_WpONF_pkeBWEf5WnFfipAgY0D6ORTzxuQQ0tdIzGpOUxRH8kGHQPGbEUNgOHw4ZUHrlyG3TaR1DsA5Bj9VwRkyI; expires=Fri, 30-Dec-2022 21:18:47 GMT; path=/; domain=.google.com; HttpOnly
< alt-svc: h3=":443"; ma=2592000,h3-29=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"
< accept-ranges: none
< vary: Accept-Encoding
< 
<!doctype html><html itemscope="" itemtype="http://schema.org/WebPage" lang="en"><head><meta content="Search the world's information, including webpages, images, videos and more. Google has many special features to help you find exactly what you're looking for." name="description"><meta content="noodp" name="robots"><meta content="text/html; charset=UTF-8" http-equiv="Content-Type"><meta content="/images/branding/googleg/1x/googleg_standard_color_128dp.png" itemprop="image"><title>Google</title><script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){window.google={kEI:'NxO-Yu_aHvzi5NoP8Y6SgA0',kEXPI:'0,1302536,56873,6059,206,4804,2316,383,246,5,1354,4013,1123753,1197694,380797,16114,28684,17572,4859,1361,9291,3024,17584,4020,978,13228,3847,10622,7432,15310,5080,1593,1279,2742,149,1103,840,1983,4314,109,3405,606,2023,1777,520,14670,3227,2845,7,4808,12642,7539,563,8218,1851,15324,432,3,1590,1,5445,148,11323,991,1656,4,1533,2304,7039,20309,1714,3050,2658,7356,16639,16808,1435,5830,2527,4094,4052,3,3541,1,14711,27443,2,14022,2373,342,3248,286,7867,11623,5679,1020,2381,2719,18242,1,8,7772,4568,6255,23420,831,422,5835,14967,4333,2204,841,1242,1802,1395,445,2,2,1,26632,8047,108,6582,568,231,2,3,1396,1048,593,8731,2907,7341,4447,10008,7,1922,541,3538,1624,3466,57,553,24,5415,901,547,1278,1664,2,5893,1495,421,4139,154,1080,1409,4491,1550,1306,3605,751,29,41,4962,951,115,42,447,1377,272,379,912,3240,3,81,2,2346,310,371,597,32,536,122,415,285,4,1,2,2,2,2,2179,1539,1685,71,478,880,97,922,19,1810,883,378,660,302,617,156,111,69,1061,922,1766,665,18,389,995,4,124,177,7,134,674,40,10,4,606,260,48,664,2,1048,5393136,476,157,5994559,2805075,3311,141,795,19735,1,1,346,354,9,3,5,2,2,61,1,5,3,3,3,1,5,1,3,5,1,3,5,23650235,299774,4042143,1964,1008,1927,159,1358,11116,1105,2556,849,716,3,4824,406,1362221,32461',kBL:'fPZd'};google.sn='webhp';google.kHL='en';})();(function(){
var f=this||self;var h,k=[];function l(a){for(var b;a&&(!a.getAttribute||!(b=a.getAttribute("eid")));)a=a.parentNode;return b||h}function m(a){for(var b=null;a&&(!a.getAttribute||!(b=a.getAttribute("leid")));)a=a.parentNode;return b}
function n(a,b,c,d,g){var e="";c||-1!==b.search("&ei=")||(e="&ei="+l(d),-1===b.search("&lei=")&&(d=m(d))&&(e+="&lei="+d));d="";!c&&f._cshid&&-1===b.search("&cshid=")&&"slh"!==a&&(d="&cshid="+f._cshid);c=c||"/"+(g||"gen_204")+"?atyp=i&ct="+a+"&cad="+b+e+"&zx="+Date.now()+d;/^http:/i.test(c)&&"https:"===window.location.protocol&&(google.ml&&google.ml(Error("a"),!1,{src:c,glmm:1}),c="");return c};h=google.kEI;google.getEI=l;google.getLEI=m;google.ml=function(){return null};google.log=function(a,b,c,d,g){if(c=n(a,b,c,d,g)){a=new Image;var e=k.length;k[e]=a;a.onerror=a.onload=a.onabort=function(){delete k[e]};a.src=c}};google.logUrl=n;}).call(this);(function(){
google.y={};google.sy=[];google.x=function(a,b){if(a)var c=a.id;else{do c=Math.random();while(google.y[c])}google.y[c]=[a,b];return!1};google.sx=function(a){google.sy.push(a)};google.lm=[];google.plm=function(a){google.lm.push.apply(google.lm,a)};google.lq=[];google.load=function(a,b,c){google.lq.push([[a],b,c])};google.loadAll=function(a,b){google.lq.push([a,b])};google.bx=!1;google.lx=function(){};}).call(this);google.f={};(function(){
document.documentElement.addEventListener("submit",function(b){var a;if(a=b.target){var c=a.getAttribute("data-submitfalse");a="1"===c||"q"===c&&!a.elements.q.value?!0:!1}else a=!1;a&&(b.preventDefault(),b.stopPropagation())},!0);document.documentElement.addEventListener("click",function(b){var a;a:{for(a=b.target;a&&a!==document.documentElement;a=a.parentElement)if("A"===a.tagName){a="1"===a.getAttribute("data-nohref");break a}a=!1}a&&b.preventDefault()},!0);}).call(this);</script><style>#gbar,#guser{font-size:13px;padding-top:1px !important;}#gbar{height:22px}#guser{padding-bottom:7px !important;text-align:right}.gbh,.gbd{border-top:1px solid #c9d7f1;font-size:1px}.gbh{height:0;position:absolute;top:24px;width:100%}@media all{.gb1{height:22px;margin-right:.5em;vertical-align:top}#gbar{float:left}}a.gb1,a.gb4{text-decoration:underline !important}a.gb1,a.gb4{color:#00c !important}.gbi .gb4{color:#dd8e27 !important}.gbf .gb4{color:#900 !important}
</style><style>body,td,a,p,.h{font-family:arial,sans-serif}body{margin:0;overflow-y:scroll}#gog{padding:3px 8px 0}td{line-height:.8em}.gac_m td{line-height:17px}form{margin-bottom:20px}.h{color:#1558d6}em{font-weight:bold;font-style:normal}.lst{height:25px;width:496px}.gsfi,.lst{font:18px arial,sans-serif}.gsfs{font:17px arial,sans-serif}.ds{display:inline-box;display:inline-block;margin:3px 0 4px;margin-left:4px}input{font-family:inherit}body{background:#fff;color:#000}a{color:#4b11a8;text-decoration:none}a:hover,a:active{text-decoration:underline}.fl a{color:#1558d6}a:visited{color:#4b11a8}.sblc{padding-top:5px}.sblc a{display:block;margin:2px 0;margin-left:13px;font-size:11px}.lsbb{background:#f8f9fa;border:solid 1px;border-color:#dadce0 #70757a #70757a #dadce0;height:30px}.lsbb{display:block}#WqQANb a{display:inline-block;margin:0 12px}.lsb{background:url(/images/nav_logo229.png) 0 -261px repeat-x;border:none;color:#000;cursor:pointer;height:30px;margin:0;outline:0;font:15px arial,sans-serif;vertical-align:top}.lsb:active{background:#dadce0}.lst:focus{outline:none}</style><script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){window.google.erd={jsr:1,bv:1608,de:true};
var f=this||self;var g,h=null!=(g=f.mei)?g:1,m,n=null!=(m=f.sdo)?m:!0,p=0,q,r=google.erd,u=r.jsr;google.ml=function(a,b,d,k,c){c=void 0===c?2:c;b&&(q=a&&a.message);if(google.dl)return google.dl(a,c,d),null;if(0>u){window.console&&console.error(a,d);if(-2===u)throw a;b=!1}else b=!a||!a.message||"Error loading script"===a.message||p>=h&&!k?!1:!0;if(!b)return null;p++;d=d||{};var e=c;c=encodeURIComponent;b="/gen_204?atyp=i&ei="+c(google.kEI);google.kEXPI&&(b+="&jexpid="+c(google.kEXPI));b+="&srcpg="+c(google.sn)+"&jsr="+c(r.jsr)+"&bver="+c(r.bv)+("&jsel="+e);e=a.lineNumber;void 0!==e&&(b+="&line="+
e);var l=a.fileName;l&&(b+="&script="+c(l),e&&l===window.location.href&&(e=document.documentElement.outerHTML.split("\n")[e],b+="&cad="+c(e?e.substring(0,300):"No script found.")));for(var t in d)b+="&",b+=c(t),b+="=",b+=c(d[t]);b=b+"&emsg="+c(a.name+": "+a.message);b=b+"&jsst="+c(a.stack||"N/A");12288<=b.length&&(b=b.substr(0,12288));a=b;k||google.log(0,"",a);return a};window.onerror=function(a,b,d,k,c){q!==a&&(a=c instanceof Error?c:Error(a),void 0===d||"lineNumber"in a||(a.lineNumber=d),void 0===b||"fileName"in a||(a.fileName=b),google.ml(a,!1,void 0,!1,"SyntaxError"===a.name||"SyntaxError"===a.message.substring(0,11)?2:0));q=null;n&&p>=h&&(window.onerror=null)};})();</script></head><body bgcolor="#fff"><script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){var src='/images/nav_logo229.png';var iesg=false;document.body.onload = function(){window.n && window.n();if (document.images){new Image().src=src;}
if (!iesg){document.f&&document.f.q.focus();document.gbqf&&document.gbqf.q.focus();}
}
})();</script><div id="mngb"><div id=gbar><nobr><b class=gb1>Search</b> <a class=gb1 href="https://www.google.com/imghp?hl=en&tab=wi">Images</a> <a class=gb1 href="https://maps.google.com/maps?hl=en&tab=wl">Maps</a> <a class=gb1 href="https://play.google.com/?hl=en&tab=w8">Play</a> <a class=gb1 href="https://www.youtube.com/?gl=US&tab=w1">YouTube</a> <a class=gb1 href="https://news.google.com/?tab=wn">News</a> <a class=gb1 href="https://mail.google.com/mail/?tab=wm">Gmail</a> <a class=gb1 href="https://drive.google.com/?tab=wo">Drive</a> <a class=gb1 style="text-decoration:none" href="https://www.google.com/intl/en/about/products?tab=wh"><u>More</u> &raquo;</a></nobr></div><div id=guser width=100%><nobr><span id=gbn class=gbi></span><span id=gbf class=gbf></span><span id=gbe></span><a href="http://www.google.com/history/optout?hl=en" class=gb4>Web History</a> | <a  href="/preferences?hl=en" class=gb4>Settings</a> | <a target=_top id=gb_70 href="https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=https://www.google.com/&ec=GAZAAQ" class=gb4>Sign in</a></nobr></div><div class=gbh style=left:0></div><div class=gbh style=right:0></div></div><center><br clear="all" id="lgpd"><div id="lga"><img alt="Google" height="92" src="/images/branding/googlelogo/1x/googlelogo_white_background_color_272x92dp.png" style="padding:28px 0 14px" width="272" id="hplogo"><br><br></div><form action="/search" name="f"><table cellpadding="0" cellspacing="0"><tr valign="top"><td width="25%">&nbsp;</td><td align="center" nowrap=""><input name="ie" value="ISO-8859-1" type="hidden"><input value="en" name="hl" type="hidden"><input name="source" type="hidden" value="hp"><input name="biw" type="hidden"><input name="bih" type="hidden"><div class="ds" style="height:32px;margin:4px 0"><input class="lst" style="margin:0;padding:5px 8px 0 6px;vertical-align:top;color:#000" autocomplete="off" value="" title="Google Search" maxlength="2048" name="q" size="57"></div><br style="line-height:0"><span class="ds"><span class="lsbb"><input class="lsb" value="Google Search" name="btnG" type="submit"></span></span><span class="ds"><span class="lsbb"><input class="lsb" id="tsuid1" value="I'm Feeling Lucky" name="btnI" type="submit"><script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){var id='tsuid1';document.getElementById(id).onclick = function(){if (this.form.q.value){this.checked = 1;if (this.form.iflsig)this.form.iflsig.disabled = false;}
else top.location='/doodles/';};})();</script><input value="AJiK0e8AAAAAYr4hR90UNwtcKhX2zCGSInqMz3c7wkwv" name="iflsig" type="hidden"></span></span></td><td class="fl sblc" align="left" nowrap="" width="25%"><a href="/advanced_search?hl=en&amp;authuser=0">Advanced search</a></td></tr></table><input id="gbv" name="gbv" type="hidden" value="1"><script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){
var a,b="1";if(document&&document.getElementById)if("undefined"!=typeof XMLHttpRequest)b="2";else if("undefined"!=typeof ActiveXObject){var c,d,e=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];for(c=0;d=e[c++];)try{new ActiveXObject(d),b="2"}catch(h){}}a=b;if("2"==a&&-1==location.search.indexOf("&gbv=2")){var f=google.gbvu,g=document.getElementById("gbv");g&&(g.value=a);f&&window.setTimeout(function(){location.href=f},0)};}).call(this);</script></form><div id="gac_scont"></div><div style="font-size:83%;min-height:3.5em"><br><div id="prm"><style>.szppmdbYutt__middle-slot-promo{font-size:small;margin-bottom:32px}.szppmdbYutt__middle-slot-promo a.ZIeIlb{display:inline-block;text-decoration:none}.szppmdbYutt__middle-slot-promo img{border:none;margin-right:5px;vertical-align:middle}</style><div class="szppmdbYutt__middle-slot-promo" data-ved="0ahUKEwiv0uaFjdb4AhV8MVkFHXGHBNAQnIcBCAQ"><a class="NKcBbd" href="https://www.google.com/url?q=https://artsandculture.google.com/project/pride%3Futm_source%3Dgoogle%26utm_medium%3Dhppromo%26utm_campaign%3Dpride22&amp;source=hpp&amp;id=19029955&amp;ct=3&amp;usg=AOvVaw2ntRDAU2jNBlOd2_0kC1Bx&amp;sa=X&amp;ved=0ahUKEwiv0uaFjdb4AhV8MVkFHXGHBNAQ8IcBCAU" rel="nofollow">Celebrate Pride</a><span>: Explore inspiring LGBTQIA+ stories</span></div></div></div><span id="footer"><div style="font-size:10pt"><div style="margin:19px auto;text-align:center" id="WqQANb"><a href="/intl/en/ads/">Advertising�Programs</a><a href="/services/">Business Solutions</a><a href="/intl/en/about.html">About Google</a></div></div><p style="font-size:8pt;color:#70757a">&copy; 2022 - <a href="/intl/en/policies/privacy/">Privacy</a> - <a href="/intl/en/policies/terms/">Terms</a></p></span></center><script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){window.google.cdo={height:757,width:1440};(function(){
var a=window.innerWidth,b=window.innerHeight;if(!a||!b){var c=window.document,d="CSS1Compat"==c.compatMode?c.documentElement:c.body;a=d.clientWidth;b=d.clientHeight}a&&b&&(a!=google.cdo.width||b!=google.cdo.height)&&google.log("","","/client_204?&atyp=i&biw="+a+"&bih="+b+"&ei="+google.kEI);}).call(this);})();</script> <script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){google.xjs={ck:'',cs:'',excm:[]};})();</script>  <script nonce="f2PizhneqwX31PyFFC9zmQ">(function(){var u='/xjs/_/js/k\x3dxjs.hp.en_US.NZ_k6WDHVpU.O/am\x3dAOAJAEACIAE/d\x3d1/ed\x3d1/rs\x3dACT90oHx6WJ89uhJI1T7tdyubS2UQbpNdQ/m\x3dsb_he,d';
var d=this||self,e=function(a){return a};var g;var l=function(a,b){this.g=b===h?a:""};l.prototype.toString=function(){return this.g+""};var h={};
function n(){var a=u;google.lx=function(){p(a);google.lx=function(){}};google.bx||google.lx()}
function p(a){google.timers&&google.timers.load&&google.tick&&google.tick("load","xjsls");var b=document;var c="SCRIPT";"application/xhtml+xml"===b.contentType&&(c=c.toLowerCase());c=b.createElement(c);if(void 0===g){b=null;var k=d.trustedTypes;if(k&&k.createPolicy){try{b=k.createPolicy("goog#html",{createHTML:e,createScript:e,createScriptURL:e})}catch(q){d.console&&d.console.error(q.message)}g=b}else g=b}a=(b=g)?b.createScriptURL(a):a;a=new l(a,h);c.src=a instanceof l&&a.constructor===l?a.g:"type_error:TrustedResourceUrl";var f,m;(f=(a=null==(m=(f=(c.ownerDocument&&c.ownerDocument.defaultView||window).document).querySelector)?void 0:m.call(f,"script[nonce]"))?a.nonce||a.getAttribute("nonce")||"":"")&&c.setAttribute("nonce",f);document.body.appendChild(c);google.psa=!0};google.xjsu=u;setTimeout(function(){n()},0);})();function _DumpException(e){throw e;}
function _F_installCss(c){}
(function(){google.jl={attn:false,blt:'none',chnk:0,dw:false,dwu:true,emtn:0,end:0,ine:false,injs:'none',injt:0,injth:0,injv2:false,lls:'default',pdt:0,rep:0,snet:true,strt:0,ubm:false,uwp:true};})();(function(){var pmc='{\x22d\x22:{},\x22sb_he\x22:{\x22agen\x22:false,\x22cgen\x22:false,\x22client\x22:* Connection #0 to host www.google.com left intact
\x22heirloom-hp\x22,\x22dh\x22:true,\x22dhqt\x22:true,\x22ds\x22:\x22\x22,\x22ffql\x22:\x22en\x22,\x22fl\x22:true,\x22host\x22:\x22google.com\x22,\x22isbh\x22:28,\x22jsonp\x22:true,\x22msgs\x22:{\x22cibl\x22:\x22Clear Search\x22,\x22dym\x22:\x22Did you mean:\x22,\x22lcky\x22:\x22I\\u0026#39;m Feeling Lucky\x22,\x22lml\x22:\x22Learn more\x22,\x22oskt\x22:\x22Input tools\x22,\x22psrc\x22:\x22This search was removed from your \\u003Ca href\x3d\\\x22/history\\\x22\\u003EWeb History\\u003C/a\\u003E\x22,\x22psrl\x22:\x22Remove\x22,\x22sbit\x22:\x22Search by image\x22,\x22srch\x22:\x22Google Search\x22},\x22ovr\x22:{},\x22pq\x22:\x22\x22,\x22refpd\x22:true,\x22rfs\x22:[],\x22sbas\x22:\x220 3px 8px 0 rgba(0,0,0,0.2),0 0 0 1px rgba(0,0,0,0.08)\x22,\x22sbpl\x22:16,\x22sbpr\x22:16,\x22scd\x22:10,\x22stok\x22:\x22oo2LrCNfA1zmduMqMvEiELTMXSw\x22,\x22uhde\x22:false}}';google.pmc=JSON.parse(pmc);})();</script>        </body></html>
```
