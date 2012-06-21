$( function() {

  window.IS_MOBILE = false;
  window.IS_DESKTOP = false;
  window.IS_IOS = false;
  window.IS_ANDROID = false;

  $("html").removeClass("no-js").addClass("js");
  $("html").removeClass("not-ready").addClass("ready");
  if (navigator.userAgent.match(/Android/i)) { $("html").addClass("android mobile"); window.IS_MOBILE=true; window.IS_ANDROID=true; }
  else if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i)) { $("html").addClass("ios mobile"); window.IS_MOBILE=true; window.IS_IOS=true }
  else { $("html").addClass("desktop"); window.IS_DESKTOP=true }

  window.TOUCH_SUPPORT = jQuery.support.touch;
});
