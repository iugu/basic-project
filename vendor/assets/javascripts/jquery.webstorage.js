(function(q){function n(c,d){return{length:d(),key:function(a){return c.key(a)},getItem:function(a){return q.parseJSON(c.getItem(a))},setItem:function(a,b){c.setItem(a,r(b));this.length=d()},removeItem:function(a){c.removeItem(a);this.length=d()},clear:function(){c.clear();this.length=0}}}function v(c,d){document.cookie=c+"="+d+"; path=/"}function w(c){c=c+"=";for(var d=document.cookie.split(";"),a=0;a<d.length;a++){for(var b=d[a];b.charAt(0)==" ";)b=b.substring(1,b.length);if(b.indexOf(c)==0)return b.substring(c.length,
b.length)}return null}function s(c){return c<10?"0"+c:c}function x(c){y.lastIndex=0;return y.test(c)?'"'+c.replace(y,function(d){var a=z[d];return typeof a==="string"?a:"\\u"+("0000"+d.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+c+'"'}function t(c,d){var a,b,e,f,i=h,j,g=d[c];if(g&&typeof g==="object"&&typeof g.toJSON==="function")g=g.toJSON(c);if(typeof o==="function")g=o.call(d,c,g);switch(typeof g){case "string":return x(g);case "number":return isFinite(g)?String(g):"null";case "boolean":case "null":return String(g);
case "object":if(!g)return"null";h+=u;j=[];if(Object.prototype.toString.apply(g)==="[object Array]"){f=g.length;for(a=0;a<f;a+=1)j[a]=t(a,g)||"null";e=j.length===0?"[]":h?"[\n"+h+j.join(",\n"+h)+"\n"+i+"]":"["+j.join(",")+"]";h=i;return e}if(o&&typeof o==="object"){f=o.length;for(a=0;a<f;a+=1){b=o[a];if(typeof b==="string")if(e=t(b,g))j.push(x(b)+(h?": ":":")+e)}}else for(b in g)if(Object.hasOwnProperty.call(g,b))if(e=t(b,g))j.push(x(b)+(h?": ":":")+e);e=j.length===0?"{}":h?"{\n"+h+j.join(",\n"+h)+
"\n"+i+"}":"{"+j.join(",")+"}";h=i;return e}}function r(c,d,a){var b;u=h="";if(typeof a==="number")for(b=0;b<a;b+=1)u+=" ";else if(typeof a==="string")u=a;if((o=d)&&typeof d!=="function"&&(typeof d!=="object"||typeof d.length!=="number"))throw Error("JSON.stringify");return t("",{"":c})}var p=location.hostname,l=p.replace(/\./g,"")+"_webStorage",m=null,k=null;q.webStorage={session:function(c){var d=q.extend({allowWindowName:false},c);if(m!==null)return m;if("sessionStorage"in window)return m=n(window.sessionStorage,
function(){return window.sessionStorage.length});(function(){if("cookie"in document){w(l)===null&&v(l,"{}");if(w(l)!==null){var a=function(){try{return q.parseJSON(w(l))||{}}catch(b){return{}}};m=n({key:function(b){var e=a(),f=0,i;for(i in e)if(e.hasOwnProperty(i))if(f++===b)return i;return null},getItem:function(b){return a()[b]||null},setItem:function(b,e){var f=a();f[b]=e;v(l,r(f))},removeItem:function(b){var e=a();delete e[b];v(l,r(e))},clear:function(){document.cookie=l+"=; expires=-1; path=/"}},
function(){var b=a(),e=0,f;for(f in b)b.hasOwnProperty(f)&&e++;return e})}}})();if(m!==null)return m;(function(){if(d.allowWindowName){var a=function(){try{return q.parseJSON(window.name)||{}}catch(b){return{}}};m=n({key:function(b){var e=a(),f=0,i;for(i in e)if(e.hasOwnProperty(i))if(f++===b)return i;return null},getItem:function(b){return a()[b]||null},setItem:function(b,e){var f=a();f[b]=e;window.name=r(f)},removeItem:function(b){var e=a();delete e[b];window.name=r(e)},clear:function(){window.name=
"{}"}},function(){var b=a(),e=0,f;for(f in b)b.hasOwnProperty(f)&&e++;return e})}})();return m},local:function(){if(k!==null)return k;if("localStorage"in window)return k=n(window.localStorage,function(){return window.localStorage.length});if(typeof globalStorage!=="undefined")return k=n(globalStorage[p],function(){return globalStorage[p].length});(function(){var c=document.createElement("div");c.style.behavior="url(#default#userdata)";document.getElementsByTagName("body")[0].appendChild(c);if("load"in
c&&"XMLDocument"in c){c.load(p);var d=function(){return c.XMLDocument.childNodes[0].attributes};k=n({key:function(a){return d()[a].nodeName},getItem:function(a){return c.getAttribute(a)},setItem:function(a,b){c.setAttribute(a,b);c.save(p)},removeItem:function(a){c.removeAttribute(a);c.save(p)},clear:function(){for(var a=0;d().length>a;){var b=d()[a];if(b!=null)c.removeAttribute(b.nodeName);else a++}c.save(p)}},function(){return d().length})}})();if(k!==null)return k;(function(){if(window.google&&
google.gears){var c=google.gears.factory.create("beta.database");c.open(l);c.execute("create table if not exists webStorage (ItemKey text, ItemValue text)");k=n({key:function(d){for(var a=0,b=c.execute("select ItemKey from webStorage");b.isValidRow();){if(a++===d)return b.field(0);b.next()}b.close();return null},getItem:function(d){var a=null;d=c.execute("select ItemValue from webStorage where ItemKey = ?",[d]);if(d.isValidRow())a=d.field(0);d.close();return a},setItem:function(d,a){this.key(d)!=
null?c.execute("update webStorage set ItemValue = ? where ItemKey = ?",[a,d]):c.execute("insert into webStorage values (?, ?)",[d,a])},removeItem:function(d){c.execute("delete from webStorage where ItemKey = ?",[d])},clear:function(){c.execute("delete from webStorage")}},function(){var d=0,a=c.execute("select count(*) from webStorage");if(a.isValidRow())d=a.field(0);a.close();return d})}})();return k}};if(typeof Date.prototype.toJSON!=="function"){Date.prototype.toJSON=function(){return isFinite(this.valueOf())?
this.getUTCFullYear()+"-"+s(this.getUTCMonth()+1)+"-"+s(this.getUTCDate())+"T"+s(this.getUTCHours())+":"+s(this.getUTCMinutes())+":"+s(this.getUTCSeconds())+"Z":null};String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()}}var y=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,h,u,z={"\u0008":"\\b","\t":"\\t","\n":"\\n","\u000c":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},o})(jQuery);