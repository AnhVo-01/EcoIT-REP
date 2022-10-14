/*
     _ _      _       _
 ___| (_) ___| | __  (_)___
/ __| | |/ __| |/ /  | / __|
\__ \ | | (__|   < _ | \__ \
|___/_|_|\___|_|\_(_)/ |___/
                   |__/

 Version: 1.9.0
  Author: Ken Wheeler
 Website: http://kenwheeler.github.io
    Docs: http://kenwheeler.github.io/slick
    Repo: http://github.com/kenwheeler/slick
  Issues: http://github.com/kenwheeler/slick/issues

 */
(function (i) {
  "use strict";
  "function" == typeof define && define.amd ? define(["jquery"], i) : "undefined" != typeof exports ? module.exports = i(require("jquery")) : i(jQuery)
})(function (i) {
  "use strict";
  var e = window.Slick || {};
  e = function () {
    function e(e, o) {
      var s, n = this;
      n.defaults = {
        accessibility: !0,
        adaptiveHeight: !1,
        appendArrows: i(e),
        appendDots: i(e),
        arrows: !0,
        asNavFor: null,
        prevArrow: '<button class="slick-prev" aria-label="Previous" type="button">Previous</button>',
        nextArrow: '<button class="slick-next" aria-label="Next" type="button">Next</button>',
        autoplay: !1,
        autoplaySpeed: 3e3,
        centerMode: !1,
        centerPadding: "50px",
        cssEase: "ease",
        customPaging: function (e, t) {
          return i('<button type="button" />').text(t + 1)
        },
        dots: !1,
        dotsClass: "slick-dots",
        draggable: !0,
        easing: "linear",
        edgeFriction: .35,
        fade: !1,
        focusOnSelect: !1,
        focusOnChange: !1,
        infinite: !0,
        initialSlide: 0,
        lazyLoad: "ondemand",
        mobileFirst: !1,
        pauseOnHover: !0,
        pauseOnFocus: !0,
        pauseOnDotsHover: !1,
        respondTo: "window",
        responsive: null,
        rows: 1,
        rtl: !1,
        slide: "",
        slidesPerRow: 1,
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 500,
        swipe: !0,
        swipeToSlide: !1,
        touchMove: !0,
        touchThreshold: 5,
        useCSS: !0,
        useTransform: !0,
        variableWidth: !1,
        vertical: !1,
        verticalSwiping: !1,
        waitForAnimate: !0,
        zIndex: 1e3
      }, n.initials = {
        animating: !1,
        dragging: !1,
        autoPlayTimer: null,
        currentDirection: 0,
        currentLeft: null,
        currentSlide: 0,
        direction: 1,
        $dots: null,
        listWidth: null,
        listHeight: null,
        loadIndex: 0,
        $nextArrow: null,
        $prevArrow: null,
        scrolling: !1,
        slideCount: null,
        slideWidth: null,
        $slideTrack: null,
        $slides: null,
        sliding: !1,
        slideOffset: 0,
        swipeLeft: null,
        swiping: !1,
        $list: null,
        touchObject: {},
        transformsEnabled: !1,
        unslicked: !1
      }, i.extend(n, n.initials), n.activeBreakpoint = null, n.animType = null, n.animProp = null, n.breakpoints = [], n.breakpointSettings = [], n.cssTransitions = !1, n.focussed = !1, n.interrupted = !1, n.hidden = "hidden", n.paused = !0, n.positionProp = null, n.respondTo = null, n.rowCount = 1, n.shouldClick = !0, n.$slider = i(e), n.$slidesCache = null, n.transformType = null, n.transitionType = null, n.visibilityChange = "visibilitychange", n.windowWidth = 0, n.windowTimer = null, s = i(e).data("slick") || {}, n.options = i.extend({}, n.defaults, o, s), n.currentSlide = n.options.initialSlide, n.originalSettings = n.options, "undefined" != typeof document.mozHidden ? (n.hidden = "mozHidden", n.visibilityChange = "mozvisibilitychange") : "undefined" != typeof document.webkitHidden && (n.hidden = "webkitHidden", n.visibilityChange = "webkitvisibilitychange"), n.autoPlay = i.proxy(n.autoPlay, n), n.autoPlayClear = i.proxy(n.autoPlayClear, n), n.autoPlayIterator = i.proxy(n.autoPlayIterator, n), n.changeSlide = i.proxy(n.changeSlide, n), n.clickHandler = i.proxy(n.clickHandler, n), n.selectHandler = i.proxy(n.selectHandler, n), n.setPosition = i.proxy(n.setPosition, n), n.swipeHandler = i.proxy(n.swipeHandler, n), n.dragHandler = i.proxy(n.dragHandler, n), n.keyHandler = i.proxy(n.keyHandler, n), n.instanceUid = t++, n.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/, n.registerBreakpoints(), n.init(!0)
    }

    var t = 0;
    return e
  }(), e.prototype.activateADA = function () {
    var i = this;
    i.$slideTrack.find(".slick-active").attr({"aria-hidden": "false"}).find("a, input, button, select").attr({tabindex: "0"})
  }, e.prototype.addSlide = e.prototype.slickAdd = function (e, t, o) {
    var s = this;
    if ("boolean" == typeof t) o = t, t = null; else if (t < 0 || t >= s.slideCount) return !1;
    s.unload(), "number" == typeof t ? 0 === t && 0 === s.$slides.length ? i(e).appendTo(s.$slideTrack) : o ? i(e).insertBefore(s.$slides.eq(t)) : i(e).insertAfter(s.$slides.eq(t)) : o === !0 ? i(e).prependTo(s.$slideTrack) : i(e).appendTo(s.$slideTrack), s.$slides = s.$slideTrack.children(this.options.slide), s.$slideTrack.children(this.options.slide).detach(), s.$slideTrack.append(s.$slides), s.$slides.each(function (e, t) {
      i(t).attr("data-slick-index", e)
    }), s.$slidesCache = s.$slides, s.reinit()
  }, e.prototype.animateHeight = function () {
    var i = this;
    if (1 === i.options.slidesToShow && i.options.adaptiveHeight === !0 && i.options.vertical === !1) {
      var e = i.$slides.eq(i.currentSlide).outerHeight(!0);
      i.$list.animate({height: e}, i.options.speed)
    }
  }, e.prototype.animateSlide = function (e, t) {
    var o = {}, s = this;
    s.animateHeight(), s.options.rtl === !0 && s.options.vertical === !1 && (e = -e), s.transformsEnabled === !1 ? s.options.vertical === !1 ? s.$slideTrack.animate({left: e}, s.options.speed, s.options.easing, t) : s.$slideTrack.animate({top: e}, s.options.speed, s.options.easing, t) : s.cssTransitions === !1 ? (s.options.rtl === !0 && (s.currentLeft = -s.currentLeft), i({animStart: s.currentLeft}).animate({animStart: e}, {
      duration: s.options.speed,
      easing: s.options.easing,
      step: function (i) {
        i = Math.ceil(i), s.options.vertical === !1 ? (o[s.animType] = "translate(" + i + "px, 0px)", s.$slideTrack.css(o)) : (o[s.animType] = "translate(0px," + i + "px)", s.$slideTrack.css(o))
      },
      complete: function () {
        t && t.call()
      }
    })) : (s.applyTransition(), e = Math.ceil(e), s.options.vertical === !1 ? o[s.animType] = "translate3d(" + e + "px, 0px, 0px)" : o[s.animType] = "translate3d(0px," + e + "px, 0px)", s.$slideTrack.css(o), t && setTimeout(function () {
      s.disableTransition(), t.call()
    }, s.options.speed))
  }, e.prototype.getNavTarget = function () {
    var e = this, t = e.options.asNavFor;
    return t && null !== t && (t = i(t).not(e.$slider)), t
  }, e.prototype.asNavFor = function (e) {
    var t = this, o = t.getNavTarget();
    null !== o && "object" == typeof o && o.each(function () {
      var t = i(this).slick("getSlick");
      t.unslicked || t.slideHandler(e, !0)
    })
  }, e.prototype.applyTransition = function (i) {
    var e = this, t = {};
    e.options.fade === !1 ? t[e.transitionType] = e.transformType + " " + e.options.speed + "ms " + e.options.cssEase : t[e.transitionType] = "opacity " + e.options.speed + "ms " + e.options.cssEase, e.options.fade === !1 ? e.$slideTrack.css(t) : e.$slides.eq(i).css(t)
  }, e.prototype.autoPlay = function () {
    var i = this;
    i.autoPlayClear(), i.slideCount > i.options.slidesToShow && (i.autoPlayTimer = setInterval(i.autoPlayIterator, i.options.autoplaySpeed))
  }, e.prototype.autoPlayClear = function () {
    var i = this;
    i.autoPlayTimer && clearInterval(i.autoPlayTimer)
  }, e.prototype.autoPlayIterator = function () {
    var i = this, e = i.currentSlide + i.options.slidesToScroll;
    i.paused || i.interrupted || i.focussed || (i.options.infinite === !1 && (1 === i.direction && i.currentSlide + 1 === i.slideCount - 1 ? i.direction = 0 : 0 === i.direction && (e = i.currentSlide - i.options.slidesToScroll, i.currentSlide - 1 === 0 && (i.direction = 1))), i.slideHandler(e))
  }, e.prototype.buildArrows = function () {
    var e = this;
    e.options.arrows === !0 && (e.$prevArrow = i(e.options.prevArrow).addClass("slick-arrow"), e.$nextArrow = i(e.options.nextArrow).addClass("slick-arrow"), e.slideCount > e.options.slidesToShow ? (e.$prevArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), e.$nextArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), e.htmlExpr.test(e.options.prevArrow) && e.$prevArrow.prependTo(e.options.appendArrows), e.htmlExpr.test(e.options.nextArrow) && e.$nextArrow.appendTo(e.options.appendArrows), e.options.infinite !== !0 && e.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true")) : e.$prevArrow.add(e.$nextArrow).addClass("slick-hidden").attr({
      "aria-disabled": "true",
      tabindex: "-1"
    }))
  }, e.prototype.buildDots = function () {
    var e, t, o = this;
    if (o.options.dots === !0 && o.slideCount > o.options.slidesToShow) {
      for (o.$slider.addClass("slick-dotted"), t = i("<ul />").addClass(o.options.dotsClass), e = 0; e <= o.getDotCount(); e += 1) t.append(i("<li />").append(o.options.customPaging.call(this, o, e)));
      o.$dots = t.appendTo(o.options.appendDots), o.$dots.find("li").first().addClass("slick-active")
    }
  }, e.prototype.buildOut = function () {
    var e = this;
    e.$slides = e.$slider.children(e.options.slide + ":not(.slick-cloned)").addClass("slick-slide"), e.slideCount = e.$slides.length, e.$slides.each(function (e, t) {
      i(t).attr("data-slick-index", e).data("originalStyling", i(t).attr("style") || "")
    }), e.$slider.addClass("slick-slider"), e.$slideTrack = 0 === e.slideCount ? i('<div class="slick-track"/>').appendTo(e.$slider) : e.$slides.wrapAll('<div class="slick-track"/>').parent(), e.$list = e.$slideTrack.wrap('<div class="slick-list"/>').parent(), e.$slideTrack.css("opacity", 0), e.options.centerMode !== !0 && e.options.swipeToSlide !== !0 || (e.options.slidesToScroll = 1), i("img[data-lazy]", e.$slider).not("[src]").addClass("slick-loading"), e.setupInfinite(), e.buildArrows(), e.buildDots(), e.updateDots(), e.setSlideClasses("number" == typeof e.currentSlide ? e.currentSlide : 0), e.options.draggable === !0 && e.$list.addClass("draggable")
  }, e.prototype.buildRows = function () {
    var i, e, t, o, s, n, r, l = this;
    if (o = document.createDocumentFragment(), n = l.$slider.children(), l.options.rows > 0) {
      for (r = l.options.slidesPerRow * l.options.rows, s = Math.ceil(n.length / r), i = 0; i < s; i++) {
        var d = document.createElement("div");
        for (e = 0; e < l.options.rows; e++) {
          var a = document.createElement("div");
          for (t = 0; t < l.options.slidesPerRow; t++) {
            var c = i * r + (e * l.options.slidesPerRow + t);
            n.get(c) && a.appendChild(n.get(c))
          }
          d.appendChild(a)
        }
        o.appendChild(d)
      }
      l.$slider.empty().append(o), l.$slider.children().children().children().css({
        width: 100 / l.options.slidesPerRow + "%",
        display: "inline-block"
      })
    }
  }, e.prototype.checkResponsive = function (e, t) {
    var o, s, n, r = this, l = !1, d = r.$slider.width(), a = window.innerWidth || i(window).width();
    if ("window" === r.respondTo ? n = a : "slider" === r.respondTo ? n = d : "min" === r.respondTo && (n = Math.min(a, d)), r.options.responsive && r.options.responsive.length && null !== r.options.responsive) {
      s = null;
      for (o in r.breakpoints) r.breakpoints.hasOwnProperty(o) && (r.originalSettings.mobileFirst === !1 ? n < r.breakpoints[o] && (s = r.breakpoints[o]) : n > r.breakpoints[o] && (s = r.breakpoints[o]));
      null !== s ? null !== r.activeBreakpoint ? (s !== r.activeBreakpoint || t) && (r.activeBreakpoint = s, "unslick" === r.breakpointSettings[s] ? r.unslick(s) : (r.options = i.extend({}, r.originalSettings, r.breakpointSettings[s]), e === !0 && (r.currentSlide = r.options.initialSlide), r.refresh(e)), l = s) : (r.activeBreakpoint = s, "unslick" === r.breakpointSettings[s] ? r.unslick(s) : (r.options = i.extend({}, r.originalSettings, r.breakpointSettings[s]), e === !0 && (r.currentSlide = r.options.initialSlide), r.refresh(e)), l = s) : null !== r.activeBreakpoint && (r.activeBreakpoint = null, r.options = r.originalSettings, e === !0 && (r.currentSlide = r.options.initialSlide), r.refresh(e), l = s), e || l === !1 || r.$slider.trigger("breakpoint", [r, l])
    }
  }, e.prototype.changeSlide = function (e, t) {
    var o, s, n, r = this, l = i(e.currentTarget);
    switch (l.is("a") && e.preventDefault(), l.is("li") || (l = l.closest("li")), n = r.slideCount % r.options.slidesToScroll !== 0, o = n ? 0 : (r.slideCount - r.currentSlide) % r.options.slidesToScroll, e.data.message) {
      case"previous":
        s = 0 === o ? r.options.slidesToScroll : r.options.slidesToShow - o, r.slideCount > r.options.slidesToShow && r.slideHandler(r.currentSlide - s, !1, t);
        break;
      case"next":
        s = 0 === o ? r.options.slidesToScroll : o, r.slideCount > r.options.slidesToShow && r.slideHandler(r.currentSlide + s, !1, t);
        break;
      case"index":
        var d = 0 === e.data.index ? 0 : e.data.index || l.index() * r.options.slidesToScroll;
        r.slideHandler(r.checkNavigable(d), !1, t), l.children().trigger("focus");
        break;
      default:
        return
    }
  }, e.prototype.checkNavigable = function (i) {
    var e, t, o = this;
    if (e = o.getNavigableIndexes(), t = 0, i > e[e.length - 1]) i = e[e.length - 1]; else for (var s in e) {
      if (i < e[s]) {
        i = t;
        break
      }
      t = e[s]
    }
    return i
  }, e.prototype.cleanUpEvents = function () {
    var e = this;
    e.options.dots && null !== e.$dots && (i("li", e.$dots).off("click.slick", e.changeSlide).off("mouseenter.slick", i.proxy(e.interrupt, e, !0)).off("mouseleave.slick", i.proxy(e.interrupt, e, !1)), e.options.accessibility === !0 && e.$dots.off("keydown.slick", e.keyHandler)), e.$slider.off("focus.slick blur.slick"), e.options.arrows === !0 && e.slideCount > e.options.slidesToShow && (e.$prevArrow && e.$prevArrow.off("click.slick", e.changeSlide), e.$nextArrow && e.$nextArrow.off("click.slick", e.changeSlide), e.options.accessibility === !0 && (e.$prevArrow && e.$prevArrow.off("keydown.slick", e.keyHandler), e.$nextArrow && e.$nextArrow.off("keydown.slick", e.keyHandler))), e.$list.off("touchstart.slick mousedown.slick", e.swipeHandler), e.$list.off("touchmove.slick mousemove.slick", e.swipeHandler), e.$list.off("touchend.slick mouseup.slick", e.swipeHandler), e.$list.off("touchcancel.slick mouseleave.slick", e.swipeHandler), e.$list.off("click.slick", e.clickHandler), i(document).off(e.visibilityChange, e.visibility), e.cleanUpSlideEvents(), e.options.accessibility === !0 && e.$list.off("keydown.slick", e.keyHandler), e.options.focusOnSelect === !0 && i(e.$slideTrack).children().off("click.slick", e.selectHandler), i(window).off("orientationchange.slick.slick-" + e.instanceUid, e.orientationChange), i(window).off("resize.slick.slick-" + e.instanceUid, e.resize), i("[draggable!=true]", e.$slideTrack).off("dragstart", e.preventDefault), i(window).off("load.slick.slick-" + e.instanceUid, e.setPosition)
  }, e.prototype.cleanUpSlideEvents = function () {
    var e = this;
    e.$list.off("mouseenter.slick", i.proxy(e.interrupt, e, !0)), e.$list.off("mouseleave.slick", i.proxy(e.interrupt, e, !1))
  }, e.prototype.cleanUpRows = function () {
    var i, e = this;
    e.options.rows > 0 && (i = e.$slides.children().children(), i.removeAttr("style"), e.$slider.empty().append(i))
  }, e.prototype.clickHandler = function (i) {
    var e = this;
    e.shouldClick === !1 && (i.stopImmediatePropagation(), i.stopPropagation(), i.preventDefault())
  }, e.prototype.destroy = function (e) {
    var t = this;
    t.autoPlayClear(), t.touchObject = {}, t.cleanUpEvents(), i(".slick-cloned", t.$slider).detach(), t.$dots && t.$dots.remove(), t.$prevArrow && t.$prevArrow.length && (t.$prevArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.remove()), t.$nextArrow && t.$nextArrow.length && (t.$nextArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.remove()), t.$slides && (t.$slides.removeClass("slick-slide slick-active slick-center slick-visible slick-current").removeAttr("aria-hidden").removeAttr("data-slick-index").each(function () {
      i(this).attr("style", i(this).data("originalStyling"))
    }), t.$slideTrack.children(this.options.slide).detach(), t.$slideTrack.detach(), t.$list.detach(), t.$slider.append(t.$slides)), t.cleanUpRows(), t.$slider.removeClass("slick-slider"), t.$slider.removeClass("slick-initialized"), t.$slider.removeClass("slick-dotted"), t.unslicked = !0, e || t.$slider.trigger("destroy", [t])
  }, e.prototype.disableTransition = function (i) {
    var e = this, t = {};
    t[e.transitionType] = "", e.options.fade === !1 ? e.$slideTrack.css(t) : e.$slides.eq(i).css(t)
  }, e.prototype.fadeSlide = function (i, e) {
    var t = this;
    t.cssTransitions === !1 ? (t.$slides.eq(i).css({zIndex: t.options.zIndex}), t.$slides.eq(i).animate({opacity: 1}, t.options.speed, t.options.easing, e)) : (t.applyTransition(i), t.$slides.eq(i).css({
      opacity: 1,
      zIndex: t.options.zIndex
    }), e && setTimeout(function () {
      t.disableTransition(i), e.call()
    }, t.options.speed))
  }, e.prototype.fadeSlideOut = function (i) {
    var e = this;
    e.cssTransitions === !1 ? e.$slides.eq(i).animate({
      opacity: 0,
      zIndex: e.options.zIndex - 2
    }, e.options.speed, e.options.easing) : (e.applyTransition(i), e.$slides.eq(i).css({
      opacity: 0,
      zIndex: e.options.zIndex - 2
    }))
  }, e.prototype.filterSlides = e.prototype.slickFilter = function (i) {
    var e = this;
    null !== i && (e.$slidesCache = e.$slides, e.unload(), e.$slideTrack.children(this.options.slide).detach(), e.$slidesCache.filter(i).appendTo(e.$slideTrack), e.reinit())
  }, e.prototype.focusHandler = function () {
    var e = this;
    e.$slider.off("focus.slick blur.slick").on("focus.slick", "*", function (t) {
      var o = i(this);
      setTimeout(function () {
        e.options.pauseOnFocus && o.is(":focus") && (e.focussed = !0, e.autoPlay())
      }, 0)
    }).on("blur.slick", "*", function (t) {
      i(this);
      e.options.pauseOnFocus && (e.focussed = !1, e.autoPlay())
    })
  }, e.prototype.getCurrent = e.prototype.slickCurrentSlide = function () {
    var i = this;
    return i.currentSlide
  }, e.prototype.getDotCount = function () {
    var i = this, e = 0, t = 0, o = 0;
    if (i.options.infinite === !0) if (i.slideCount <= i.options.slidesToShow) ++o; else for (; e < i.slideCount;) ++o, e = t + i.options.slidesToScroll, t += i.options.slidesToScroll <= i.options.slidesToShow ? i.options.slidesToScroll : i.options.slidesToShow; else if (i.options.centerMode === !0) o = i.slideCount; else if (i.options.asNavFor) for (; e < i.slideCount;) ++o, e = t + i.options.slidesToScroll, t += i.options.slidesToScroll <= i.options.slidesToShow ? i.options.slidesToScroll : i.options.slidesToShow; else o = 1 + Math.ceil((i.slideCount - i.options.slidesToShow) / i.options.slidesToScroll);
    return o - 1
  }, e.prototype.getLeft = function (i) {
    var e, t, o, s, n = this, r = 0;
    return n.slideOffset = 0, t = n.$slides.first().outerHeight(!0), n.options.infinite === !0 ? (n.slideCount > n.options.slidesToShow && (n.slideOffset = n.slideWidth * n.options.slidesToShow * -1, s = -1, n.options.vertical === !0 && n.options.centerMode === !0 && (2 === n.options.slidesToShow ? s = -1.5 : 1 === n.options.slidesToShow && (s = -2)), r = t * n.options.slidesToShow * s), n.slideCount % n.options.slidesToScroll !== 0 && i + n.options.slidesToScroll > n.slideCount && n.slideCount > n.options.slidesToShow && (i > n.slideCount ? (n.slideOffset = (n.options.slidesToShow - (i - n.slideCount)) * n.slideWidth * -1, r = (n.options.slidesToShow - (i - n.slideCount)) * t * -1) : (n.slideOffset = n.slideCount % n.options.slidesToScroll * n.slideWidth * -1, r = n.slideCount % n.options.slidesToScroll * t * -1))) : i + n.options.slidesToShow > n.slideCount && (n.slideOffset = (i + n.options.slidesToShow - n.slideCount) * n.slideWidth, r = (i + n.options.slidesToShow - n.slideCount) * t), n.slideCount <= n.options.slidesToShow && (n.slideOffset = 0, r = 0), n.options.centerMode === !0 && n.slideCount <= n.options.slidesToShow ? n.slideOffset = n.slideWidth * Math.floor(n.options.slidesToShow) / 2 - n.slideWidth * n.slideCount / 2 : n.options.centerMode === !0 && n.options.infinite === !0 ? n.slideOffset += n.slideWidth * Math.floor(n.options.slidesToShow / 2) - n.slideWidth : n.options.centerMode === !0 && (n.slideOffset = 0, n.slideOffset += n.slideWidth * Math.floor(n.options.slidesToShow / 2)), e = n.options.vertical === !1 ? i * n.slideWidth * -1 + n.slideOffset : i * t * -1 + r, n.options.variableWidth === !0 && (o = n.slideCount <= n.options.slidesToShow || n.options.infinite === !1 ? n.$slideTrack.children(".slick-slide").eq(i) : n.$slideTrack.children(".slick-slide").eq(i + n.options.slidesToShow), e = n.options.rtl === !0 ? o[0] ? (n.$slideTrack.width() - o[0].offsetLeft - o.width()) * -1 : 0 : o[0] ? o[0].offsetLeft * -1 : 0, n.options.centerMode === !0 && (o = n.slideCount <= n.options.slidesToShow || n.options.infinite === !1 ? n.$slideTrack.children(".slick-slide").eq(i) : n.$slideTrack.children(".slick-slide").eq(i + n.options.slidesToShow + 1), e = n.options.rtl === !0 ? o[0] ? (n.$slideTrack.width() - o[0].offsetLeft - o.width()) * -1 : 0 : o[0] ? o[0].offsetLeft * -1 : 0, e += (n.$list.width() - o.outerWidth()) / 2)), e
  }, e.prototype.getOption = e.prototype.slickGetOption = function (i) {
    var e = this;
    return e.options[i]
  }, e.prototype.getNavigableIndexes = function () {
    var i, e = this, t = 0, o = 0, s = [];
    for (e.options.infinite === !1 ? i = e.slideCount : (t = e.options.slidesToScroll * -1, o = e.options.slidesToScroll * -1, i = 2 * e.slideCount); t < i;) s.push(t), t = o + e.options.slidesToScroll, o += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow;
    return s
  }, e.prototype.getSlick = function () {
    return this
  }, e.prototype.getSlideCount = function () {
    var e, t, o, s, n = this;
    return s = n.options.centerMode === !0 ? Math.floor(n.$list.width() / 2) : 0, o = n.swipeLeft * -1 + s, n.options.swipeToSlide === !0 ? (n.$slideTrack.find(".slick-slide").each(function (e, s) {
      var r, l, d;
      if (r = i(s).outerWidth(), l = s.offsetLeft, n.options.centerMode !== !0 && (l += r / 2), d = l + r, o < d) return t = s, !1
    }), e = Math.abs(i(t).attr("data-slick-index") - n.currentSlide) || 1) : n.options.slidesToScroll
  }, e.prototype.goTo = e.prototype.slickGoTo = function (i, e) {
    var t = this;
    t.changeSlide({data: {message: "index", index: parseInt(i)}}, e)
  }, e.prototype.init = function (e) {
    var t = this;
    i(t.$slider).hasClass("slick-initialized") || (i(t.$slider).addClass("slick-initialized"), t.buildRows(), t.buildOut(), t.setProps(), t.startLoad(), t.loadSlider(), t.initializeEvents(), t.updateArrows(), t.updateDots(), t.checkResponsive(!0), t.focusHandler()), e && t.$slider.trigger("init", [t]), t.options.accessibility === !0 && t.initADA(), t.options.autoplay && (t.paused = !1, t.autoPlay())
  }, e.prototype.initADA = function () {
    var e = this, t = Math.ceil(e.slideCount / e.options.slidesToShow),
      o = e.getNavigableIndexes().filter(function (i) {
        return i >= 0 && i < e.slideCount
      });
    e.$slides.add(e.$slideTrack.find(".slick-cloned")).attr({
      "aria-hidden": "true",
      tabindex: "-1"
    }).find("a, input, button, select").attr({tabindex: "-1"}), null !== e.$dots && (e.$slides.not(e.$slideTrack.find(".slick-cloned")).each(function (t) {
      var s = o.indexOf(t);
      if (i(this).attr({role: "tabpanel", id: "slick-slide" + e.instanceUid + t, tabindex: -1}), s !== -1) {
        var n = "slick-slide-control" + e.instanceUid + s;
        i("#" + n).length && i(this).attr({"aria-describedby": n})
      }
    }), e.$dots.attr("role", "tablist").find("li").each(function (s) {
      var n = o[s];
      i(this).attr({role: "presentation"}), i(this).find("button").first().attr({
        role: "tab",
        id: "slick-slide-control" + e.instanceUid + s,
        "aria-controls": "slick-slide" + e.instanceUid + n,
        "aria-label": s + 1 + " of " + t,
        "aria-selected": null,
        tabindex: "-1"
      })
    }).eq(e.currentSlide).find("button").attr({"aria-selected": "true", tabindex: "0"}).end());
    for (var s = e.currentSlide, n = s + e.options.slidesToShow; s < n; s++) e.options.focusOnChange ? e.$slides.eq(s).attr({tabindex: "0"}) : e.$slides.eq(s).removeAttr("tabindex");
    e.activateADA()
  }, e.prototype.initArrowEvents = function () {
    var i = this;
    i.options.arrows === !0 && i.slideCount > i.options.slidesToShow && (i.$prevArrow.off("click.slick").on("click.slick", {message: "previous"}, i.changeSlide), i.$nextArrow.off("click.slick").on("click.slick", {message: "next"}, i.changeSlide), i.options.accessibility === !0 && (i.$prevArrow.on("keydown.slick", i.keyHandler), i.$nextArrow.on("keydown.slick", i.keyHandler)))
  }, e.prototype.initDotEvents = function () {
    var e = this;
    e.options.dots === !0 && e.slideCount > e.options.slidesToShow && (i("li", e.$dots).on("click.slick", {message: "index"}, e.changeSlide), e.options.accessibility === !0 && e.$dots.on("keydown.slick", e.keyHandler)), e.options.dots === !0 && e.options.pauseOnDotsHover === !0 && e.slideCount > e.options.slidesToShow && i("li", e.$dots).on("mouseenter.slick", i.proxy(e.interrupt, e, !0)).on("mouseleave.slick", i.proxy(e.interrupt, e, !1))
  }, e.prototype.initSlideEvents = function () {
    var e = this;
    e.options.pauseOnHover && (e.$list.on("mouseenter.slick", i.proxy(e.interrupt, e, !0)), e.$list.on("mouseleave.slick", i.proxy(e.interrupt, e, !1)))
  }, e.prototype.initializeEvents = function () {
    var e = this;
    e.initArrowEvents(), e.initDotEvents(), e.initSlideEvents(), e.$list.on("touchstart.slick mousedown.slick", {action: "start"}, e.swipeHandler), e.$list.on("touchmove.slick mousemove.slick", {action: "move"}, e.swipeHandler), e.$list.on("touchend.slick mouseup.slick", {action: "end"}, e.swipeHandler), e.$list.on("touchcancel.slick mouseleave.slick", {action: "end"}, e.swipeHandler), e.$list.on("click.slick", e.clickHandler), i(document).on(e.visibilityChange, i.proxy(e.visibility, e)), e.options.accessibility === !0 && e.$list.on("keydown.slick", e.keyHandler), e.options.focusOnSelect === !0 && i(e.$slideTrack).children().on("click.slick", e.selectHandler), i(window).on("orientationchange.slick.slick-" + e.instanceUid, i.proxy(e.orientationChange, e)), i(window).on("resize.slick.slick-" + e.instanceUid, i.proxy(e.resize, e)), i("[draggable!=true]", e.$slideTrack).on("dragstart", e.preventDefault), i(window).on("load.slick.slick-" + e.instanceUid, e.setPosition), i(e.setPosition)
  }, e.prototype.initUI = function () {
    var i = this;
    i.options.arrows === !0 && i.slideCount > i.options.slidesToShow && (i.$prevArrow.show(), i.$nextArrow.show()), i.options.dots === !0 && i.slideCount > i.options.slidesToShow && i.$dots.show()
  }, e.prototype.keyHandler = function (i) {
    var e = this;
    i.target.tagName.match("TEXTAREA|INPUT|SELECT") || (37 === i.keyCode && e.options.accessibility === !0 ? e.changeSlide({data: {message: e.options.rtl === !0 ? "next" : "previous"}}) : 39 === i.keyCode && e.options.accessibility === !0 && e.changeSlide({data: {message: e.options.rtl === !0 ? "previous" : "next"}}))
  }, e.prototype.lazyLoad = function () {
    function e(e) {
      i("img[data-lazy]", e).each(function () {
        var e = i(this), t = i(this).attr("data-lazy"), o = i(this).attr("data-srcset"),
          s = i(this).attr("data-sizes") || r.$slider.attr("data-sizes"), n = document.createElement("img");
        n.onload = function () {
          e.animate({opacity: 0}, 100, function () {
            o && (e.attr("srcset", o), s && e.attr("sizes", s)), e.attr("src", t).animate({opacity: 1}, 200, function () {
              e.removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading")
            }), r.$slider.trigger("lazyLoaded", [r, e, t])
          })
        }, n.onerror = function () {
          e.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"), r.$slider.trigger("lazyLoadError", [r, e, t])
        }, n.src = t
      })
    }

    var t, o, s, n, r = this;
    if (r.options.centerMode === !0 ? r.options.infinite === !0 ? (s = r.currentSlide + (r.options.slidesToShow / 2 + 1), n = s + r.options.slidesToShow + 2) : (s = Math.max(0, r.currentSlide - (r.options.slidesToShow / 2 + 1)), n = 2 + (r.options.slidesToShow / 2 + 1) + r.currentSlide) : (s = r.options.infinite ? r.options.slidesToShow + r.currentSlide : r.currentSlide, n = Math.ceil(s + r.options.slidesToShow), r.options.fade === !0 && (s > 0 && s--, n <= r.slideCount && n++)), t = r.$slider.find(".slick-slide").slice(s, n), "anticipated" === r.options.lazyLoad) for (var l = s - 1, d = n, a = r.$slider.find(".slick-slide"), c = 0; c < r.options.slidesToScroll; c++) l < 0 && (l = r.slideCount - 1), t = t.add(a.eq(l)), t = t.add(a.eq(d)), l--, d++;
    e(t), r.slideCount <= r.options.slidesToShow ? (o = r.$slider.find(".slick-slide"), e(o)) : r.currentSlide >= r.slideCount - r.options.slidesToShow ? (o = r.$slider.find(".slick-cloned").slice(0, r.options.slidesToShow), e(o)) : 0 === r.currentSlide && (o = r.$slider.find(".slick-cloned").slice(r.options.slidesToShow * -1), e(o))
  }, e.prototype.loadSlider = function () {
    var i = this;
    i.setPosition(), i.$slideTrack.css({opacity: 1}), i.$slider.removeClass("slick-loading"), i.initUI(), "progressive" === i.options.lazyLoad && i.progressiveLazyLoad()
  }, e.prototype.next = e.prototype.slickNext = function () {
    var i = this;
    i.changeSlide({data: {message: "next"}})
  }, e.prototype.orientationChange = function () {
    var i = this;
    i.checkResponsive(), i.setPosition()
  }, e.prototype.pause = e.prototype.slickPause = function () {
    var i = this;
    i.autoPlayClear(), i.paused = !0
  }, e.prototype.play = e.prototype.slickPlay = function () {
    var i = this;
    i.autoPlay(), i.options.autoplay = !0, i.paused = !1, i.focussed = !1, i.interrupted = !1
  }, e.prototype.postSlide = function (e) {
    var t = this;
    if (!t.unslicked && (t.$slider.trigger("afterChange", [t, e]), t.animating = !1, t.slideCount > t.options.slidesToShow && t.setPosition(), t.swipeLeft = null, t.options.autoplay && t.autoPlay(), t.options.accessibility === !0 && (t.initADA(), t.options.focusOnChange))) {
      var o = i(t.$slides.get(t.currentSlide));
      o.attr("tabindex", 0).focus()
    }
  }, e.prototype.prev = e.prototype.slickPrev = function () {
    var i = this;
    i.changeSlide({data: {message: "previous"}})
  }, e.prototype.preventDefault = function (i) {
    i.preventDefault()
  }, e.prototype.progressiveLazyLoad = function (e) {
    e = e || 1;
    var t, o, s, n, r, l = this, d = i("img[data-lazy]", l.$slider);
    d.length ? (t = d.first(), o = t.attr("data-lazy"), s = t.attr("data-srcset"), n = t.attr("data-sizes") || l.$slider.attr("data-sizes"), r = document.createElement("img"), r.onload = function () {
      s && (t.attr("srcset", s), n && t.attr("sizes", n)), t.attr("src", o).removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading"), l.options.adaptiveHeight === !0 && l.setPosition(), l.$slider.trigger("lazyLoaded", [l, t, o]), l.progressiveLazyLoad()
    }, r.onerror = function () {
      e < 3 ? setTimeout(function () {
        l.progressiveLazyLoad(e + 1)
      }, 500) : (t.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"), l.$slider.trigger("lazyLoadError", [l, t, o]), l.progressiveLazyLoad())
    }, r.src = o) : l.$slider.trigger("allImagesLoaded", [l])
  }, e.prototype.refresh = function (e) {
    var t, o, s = this;
    o = s.slideCount - s.options.slidesToShow, !s.options.infinite && s.currentSlide > o && (s.currentSlide = o), s.slideCount <= s.options.slidesToShow && (s.currentSlide = 0), t = s.currentSlide, s.destroy(!0), i.extend(s, s.initials, {currentSlide: t}), s.init(), e || s.changeSlide({
      data: {
        message: "index",
        index: t
      }
    }, !1)
  }, e.prototype.registerBreakpoints = function () {
    var e, t, o, s = this, n = s.options.responsive || null;
    if ("array" === i.type(n) && n.length) {
      s.respondTo = s.options.respondTo || "window";
      for (e in n) if (o = s.breakpoints.length - 1, n.hasOwnProperty(e)) {
        for (t = n[e].breakpoint; o >= 0;) s.breakpoints[o] && s.breakpoints[o] === t && s.breakpoints.splice(o, 1), o--;
        s.breakpoints.push(t), s.breakpointSettings[t] = n[e].settings
      }
      s.breakpoints.sort(function (i, e) {
        return s.options.mobileFirst ? i - e : e - i
      })
    }
  }, e.prototype.reinit = function () {
    var e = this;
    e.$slides = e.$slideTrack.children(e.options.slide).addClass("slick-slide"), e.slideCount = e.$slides.length, e.currentSlide >= e.slideCount && 0 !== e.currentSlide && (e.currentSlide = e.currentSlide - e.options.slidesToScroll), e.slideCount <= e.options.slidesToShow && (e.currentSlide = 0), e.registerBreakpoints(), e.setProps(), e.setupInfinite(), e.buildArrows(), e.updateArrows(), e.initArrowEvents(), e.buildDots(), e.updateDots(), e.initDotEvents(), e.cleanUpSlideEvents(), e.initSlideEvents(), e.checkResponsive(!1, !0), e.options.focusOnSelect === !0 && i(e.$slideTrack).children().on("click.slick", e.selectHandler), e.setSlideClasses("number" == typeof e.currentSlide ? e.currentSlide : 0), e.setPosition(), e.focusHandler(), e.paused = !e.options.autoplay, e.autoPlay(), e.$slider.trigger("reInit", [e])
  }, e.prototype.resize = function () {
    var e = this;
    i(window).width() !== e.windowWidth && (clearTimeout(e.windowDelay), e.windowDelay = window.setTimeout(function () {
      e.windowWidth = i(window).width(), e.checkResponsive(), e.unslicked || e.setPosition()
    }, 50))
  }, e.prototype.removeSlide = e.prototype.slickRemove = function (i, e, t) {
    var o = this;
    return "boolean" == typeof i ? (e = i, i = e === !0 ? 0 : o.slideCount - 1) : i = e === !0 ? --i : i, !(o.slideCount < 1 || i < 0 || i > o.slideCount - 1) && (o.unload(), t === !0 ? o.$slideTrack.children().remove() : o.$slideTrack.children(this.options.slide).eq(i).remove(), o.$slides = o.$slideTrack.children(this.options.slide), o.$slideTrack.children(this.options.slide).detach(), o.$slideTrack.append(o.$slides), o.$slidesCache = o.$slides, void o.reinit())
  }, e.prototype.setCSS = function (i) {
    var e, t, o = this, s = {};
    o.options.rtl === !0 && (i = -i), e = "left" == o.positionProp ? Math.ceil(i) + "px" : "0px", t = "top" == o.positionProp ? Math.ceil(i) + "px" : "0px", s[o.positionProp] = i, o.transformsEnabled === !1 ? o.$slideTrack.css(s) : (s = {}, o.cssTransitions === !1 ? (s[o.animType] = "translate(" + e + ", " + t + ")", o.$slideTrack.css(s)) : (s[o.animType] = "translate3d(" + e + ", " + t + ", 0px)", o.$slideTrack.css(s)))
  }, e.prototype.setDimensions = function () {
    var i = this;
    i.options.vertical === !1 ? i.options.centerMode === !0 && i.$list.css({padding: "0px " + i.options.centerPadding}) : (i.$list.height(i.$slides.first().outerHeight(!0) * i.options.slidesToShow), i.options.centerMode === !0 && i.$list.css({padding: i.options.centerPadding + " 0px"})), i.listWidth = i.$list.width(), i.listHeight = i.$list.height(), i.options.vertical === !1 && i.options.variableWidth === !1 ? (i.slideWidth = Math.ceil(i.listWidth / i.options.slidesToShow), i.$slideTrack.width(Math.ceil(i.slideWidth * i.$slideTrack.children(".slick-slide").length))) : i.options.variableWidth === !0 ? i.$slideTrack.width(5e3 * i.slideCount) : (i.slideWidth = Math.ceil(i.listWidth), i.$slideTrack.height(Math.ceil(i.$slides.first().outerHeight(!0) * i.$slideTrack.children(".slick-slide").length)));
    var e = i.$slides.first().outerWidth(!0) - i.$slides.first().width();
    i.options.variableWidth === !1 && i.$slideTrack.children(".slick-slide").width(i.slideWidth - e)
  }, e.prototype.setFade = function () {
    var e, t = this;
    t.$slides.each(function (o, s) {
      e = t.slideWidth * o * -1, t.options.rtl === !0 ? i(s).css({
        position: "relative",
        right: e,
        top: 0,
        zIndex: t.options.zIndex - 2,
        opacity: 0
      }) : i(s).css({position: "relative", left: e, top: 0, zIndex: t.options.zIndex - 2, opacity: 0})
    }), t.$slides.eq(t.currentSlide).css({zIndex: t.options.zIndex - 1, opacity: 1})
  }, e.prototype.setHeight = function () {
    var i = this;
    if (1 === i.options.slidesToShow && i.options.adaptiveHeight === !0 && i.options.vertical === !1) {
      var e = i.$slides.eq(i.currentSlide).outerHeight(!0);
      i.$list.css("height", e)
    }
  }, e.prototype.setOption = e.prototype.slickSetOption = function () {
    var e, t, o, s, n, r = this, l = !1;
    if ("object" === i.type(arguments[0]) ? (o = arguments[0], l = arguments[1], n = "multiple") : "string" === i.type(arguments[0]) && (o = arguments[0], s = arguments[1], l = arguments[2], "responsive" === arguments[0] && "array" === i.type(arguments[1]) ? n = "responsive" : "undefined" != typeof arguments[1] && (n = "single")), "single" === n) r.options[o] = s; else if ("multiple" === n) i.each(o, function (i, e) {
      r.options[i] = e
    }); else if ("responsive" === n) for (t in s) if ("array" !== i.type(r.options.responsive)) r.options.responsive = [s[t]]; else {
      for (e = r.options.responsive.length - 1; e >= 0;) r.options.responsive[e].breakpoint === s[t].breakpoint && r.options.responsive.splice(e, 1), e--;
      r.options.responsive.push(s[t])
    }
    l && (r.unload(), r.reinit())
  }, e.prototype.setPosition = function () {
    var i = this;
    i.setDimensions(), i.setHeight(), i.options.fade === !1 ? i.setCSS(i.getLeft(i.currentSlide)) : i.setFade(), i.$slider.trigger("setPosition", [i])
  }, e.prototype.setProps = function () {
    var i = this, e = document.body.style;
    i.positionProp = i.options.vertical === !0 ? "top" : "left",
      "top" === i.positionProp ? i.$slider.addClass("slick-vertical") : i.$slider.removeClass("slick-vertical"), void 0 === e.WebkitTransition && void 0 === e.MozTransition && void 0 === e.msTransition || i.options.useCSS === !0 && (i.cssTransitions = !0), i.options.fade && ("number" == typeof i.options.zIndex ? i.options.zIndex < 3 && (i.options.zIndex = 3) : i.options.zIndex = i.defaults.zIndex), void 0 !== e.OTransform && (i.animType = "OTransform", i.transformType = "-o-transform", i.transitionType = "OTransition", void 0 === e.perspectiveProperty && void 0 === e.webkitPerspective && (i.animType = !1)), void 0 !== e.MozTransform && (i.animType = "MozTransform", i.transformType = "-moz-transform", i.transitionType = "MozTransition", void 0 === e.perspectiveProperty && void 0 === e.MozPerspective && (i.animType = !1)), void 0 !== e.webkitTransform && (i.animType = "webkitTransform", i.transformType = "-webkit-transform", i.transitionType = "webkitTransition", void 0 === e.perspectiveProperty && void 0 === e.webkitPerspective && (i.animType = !1)), void 0 !== e.msTransform && (i.animType = "msTransform", i.transformType = "-ms-transform", i.transitionType = "msTransition", void 0 === e.msTransform && (i.animType = !1)), void 0 !== e.transform && i.animType !== !1 && (i.animType = "transform", i.transformType = "transform", i.transitionType = "transition"), i.transformsEnabled = i.options.useTransform && null !== i.animType && i.animType !== !1
  }, e.prototype.setSlideClasses = function (i) {
    var e, t, o, s, n = this;
    if (t = n.$slider.find(".slick-slide").removeClass("slick-active slick-center slick-current").attr("aria-hidden", "true"), n.$slides.eq(i).addClass("slick-current"), n.options.centerMode === !0) {
      var r = n.options.slidesToShow % 2 === 0 ? 1 : 0;
      e = Math.floor(n.options.slidesToShow / 2), n.options.infinite === !0 && (i >= e && i <= n.slideCount - 1 - e ? n.$slides.slice(i - e + r, i + e + 1).addClass("slick-active").attr("aria-hidden", "false") : (o = n.options.slidesToShow + i, t.slice(o - e + 1 + r, o + e + 2).addClass("slick-active").attr("aria-hidden", "false")), 0 === i ? t.eq(t.length - 1 - n.options.slidesToShow).addClass("slick-center") : i === n.slideCount - 1 && t.eq(n.options.slidesToShow).addClass("slick-center")), n.$slides.eq(i).addClass("slick-center")
    } else i >= 0 && i <= n.slideCount - n.options.slidesToShow ? n.$slides.slice(i, i + n.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false") : t.length <= n.options.slidesToShow ? t.addClass("slick-active").attr("aria-hidden", "false") : (s = n.slideCount % n.options.slidesToShow, o = n.options.infinite === !0 ? n.options.slidesToShow + i : i, n.options.slidesToShow == n.options.slidesToScroll && n.slideCount - i < n.options.slidesToShow ? t.slice(o - (n.options.slidesToShow - s), o + s).addClass("slick-active").attr("aria-hidden", "false") : t.slice(o, o + n.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false"));
    "ondemand" !== n.options.lazyLoad && "anticipated" !== n.options.lazyLoad || n.lazyLoad()
  }, e.prototype.setupInfinite = function () {
    var e, t, o, s = this;
    if (s.options.fade === !0 && (s.options.centerMode = !1), s.options.infinite === !0 && s.options.fade === !1 && (t = null, s.slideCount > s.options.slidesToShow)) {
      for (o = s.options.centerMode === !0 ? s.options.slidesToShow + 1 : s.options.slidesToShow, e = s.slideCount; e > s.slideCount - o; e -= 1) t = e - 1, i(s.$slides[t]).clone(!0).attr("id", "").attr("data-slick-index", t - s.slideCount).prependTo(s.$slideTrack).addClass("slick-cloned");
      for (e = 0; e < o + s.slideCount; e += 1) t = e, i(s.$slides[t]).clone(!0).attr("id", "").attr("data-slick-index", t + s.slideCount).appendTo(s.$slideTrack).addClass("slick-cloned");
      s.$slideTrack.find(".slick-cloned").find("[id]").each(function () {
        i(this).attr("id", "")
      })
    }
  }, e.prototype.interrupt = function (i) {
    var e = this;
    i || e.autoPlay(), e.interrupted = i
  }, e.prototype.selectHandler = function (e) {
    var t = this, o = i(e.target).is(".slick-slide") ? i(e.target) : i(e.target).parents(".slick-slide"),
      s = parseInt(o.attr("data-slick-index"));
    return s || (s = 0), t.slideCount <= t.options.slidesToShow ? void t.slideHandler(s, !1, !0) : void t.slideHandler(s)
  }, e.prototype.slideHandler = function (i, e, t) {
    var o, s, n, r, l, d = null, a = this;
    if (e = e || !1, !(a.animating === !0 && a.options.waitForAnimate === !0 || a.options.fade === !0 && a.currentSlide === i)) return e === !1 && a.asNavFor(i), o = i, d = a.getLeft(o), r = a.getLeft(a.currentSlide), a.currentLeft = null === a.swipeLeft ? r : a.swipeLeft, a.options.infinite === !1 && a.options.centerMode === !1 && (i < 0 || i > a.getDotCount() * a.options.slidesToScroll) ? void (a.options.fade === !1 && (o = a.currentSlide, t !== !0 && a.slideCount > a.options.slidesToShow ? a.animateSlide(r, function () {
      a.postSlide(o)
    }) : a.postSlide(o))) : a.options.infinite === !1 && a.options.centerMode === !0 && (i < 0 || i > a.slideCount - a.options.slidesToScroll) ? void (a.options.fade === !1 && (o = a.currentSlide, t !== !0 && a.slideCount > a.options.slidesToShow ? a.animateSlide(r, function () {
      a.postSlide(o)
    }) : a.postSlide(o))) : (a.options.autoplay && clearInterval(a.autoPlayTimer), s = o < 0 ? a.slideCount % a.options.slidesToScroll !== 0 ? a.slideCount - a.slideCount % a.options.slidesToScroll : a.slideCount + o : o >= a.slideCount ? a.slideCount % a.options.slidesToScroll !== 0 ? 0 : o - a.slideCount : o, a.animating = !0, a.$slider.trigger("beforeChange", [a, a.currentSlide, s]), n = a.currentSlide, a.currentSlide = s, a.setSlideClasses(a.currentSlide), a.options.asNavFor && (l = a.getNavTarget(), l = l.slick("getSlick"), l.slideCount <= l.options.slidesToShow && l.setSlideClasses(a.currentSlide)), a.updateDots(), a.updateArrows(), a.options.fade === !0 ? (t !== !0 ? (a.fadeSlideOut(n), a.fadeSlide(s, function () {
      a.postSlide(s)
    })) : a.postSlide(s), void a.animateHeight()) : void (t !== !0 && a.slideCount > a.options.slidesToShow ? a.animateSlide(d, function () {
      a.postSlide(s)
    }) : a.postSlide(s)))
  }, e.prototype.startLoad = function () {
    var i = this;
    i.options.arrows === !0 && i.slideCount > i.options.slidesToShow && (i.$prevArrow.hide(), i.$nextArrow.hide()), i.options.dots === !0 && i.slideCount > i.options.slidesToShow && i.$dots.hide(), i.$slider.addClass("slick-loading")
  }, e.prototype.swipeDirection = function () {
    var i, e, t, o, s = this;
    return i = s.touchObject.startX - s.touchObject.curX, e = s.touchObject.startY - s.touchObject.curY, t = Math.atan2(e, i), o = Math.round(180 * t / Math.PI), o < 0 && (o = 360 - Math.abs(o)), o <= 45 && o >= 0 ? s.options.rtl === !1 ? "left" : "right" : o <= 360 && o >= 315 ? s.options.rtl === !1 ? "left" : "right" : o >= 135 && o <= 225 ? s.options.rtl === !1 ? "right" : "left" : s.options.verticalSwiping === !0 ? o >= 35 && o <= 135 ? "down" : "up" : "vertical"
  }, e.prototype.swipeEnd = function (i) {
    var e, t, o = this;
    if (o.dragging = !1, o.swiping = !1, o.scrolling) return o.scrolling = !1, !1;
    if (o.interrupted = !1, o.shouldClick = !(o.touchObject.swipeLength > 10), void 0 === o.touchObject.curX) return !1;
    if (o.touchObject.edgeHit === !0 && o.$slider.trigger("edge", [o, o.swipeDirection()]), o.touchObject.swipeLength >= o.touchObject.minSwipe) {
      switch (t = o.swipeDirection()) {
        case"left":
        case"down":
          e = o.options.swipeToSlide ? o.checkNavigable(o.currentSlide + o.getSlideCount()) : o.currentSlide + o.getSlideCount(), o.currentDirection = 0;
          break;
        case"right":
        case"up":
          e = o.options.swipeToSlide ? o.checkNavigable(o.currentSlide - o.getSlideCount()) : o.currentSlide - o.getSlideCount(), o.currentDirection = 1
      }
      "vertical" != t && (o.slideHandler(e), o.touchObject = {}, o.$slider.trigger("swipe", [o, t]))
    } else o.touchObject.startX !== o.touchObject.curX && (o.slideHandler(o.currentSlide), o.touchObject = {})
  }, e.prototype.swipeHandler = function (i) {
    var e = this;
    if (!(e.options.swipe === !1 || "ontouchend" in document && e.options.swipe === !1 || e.options.draggable === !1 && i.type.indexOf("mouse") !== -1)) switch (e.touchObject.fingerCount = i.originalEvent && void 0 !== i.originalEvent.touches ? i.originalEvent.touches.length : 1, e.touchObject.minSwipe = e.listWidth / e.options.touchThreshold, e.options.verticalSwiping === !0 && (e.touchObject.minSwipe = e.listHeight / e.options.touchThreshold), i.data.action) {
      case"start":
        e.swipeStart(i);
        break;
      case"move":
        e.swipeMove(i);
        break;
      case"end":
        e.swipeEnd(i)
    }
  }, e.prototype.swipeMove = function (i) {
    var e, t, o, s, n, r, l = this;
    return n = void 0 !== i.originalEvent ? i.originalEvent.touches : null, !(!l.dragging || l.scrolling || n && 1 !== n.length) && (e = l.getLeft(l.currentSlide), l.touchObject.curX = void 0 !== n ? n[0].pageX : i.clientX, l.touchObject.curY = void 0 !== n ? n[0].pageY : i.clientY, l.touchObject.swipeLength = Math.round(Math.sqrt(Math.pow(l.touchObject.curX - l.touchObject.startX, 2))), r = Math.round(Math.sqrt(Math.pow(l.touchObject.curY - l.touchObject.startY, 2))), !l.options.verticalSwiping && !l.swiping && r > 4 ? (l.scrolling = !0, !1) : (l.options.verticalSwiping === !0 && (l.touchObject.swipeLength = r), t = l.swipeDirection(), void 0 !== i.originalEvent && l.touchObject.swipeLength > 4 && (l.swiping = !0, i.preventDefault()), s = (l.options.rtl === !1 ? 1 : -1) * (l.touchObject.curX > l.touchObject.startX ? 1 : -1), l.options.verticalSwiping === !0 && (s = l.touchObject.curY > l.touchObject.startY ? 1 : -1), o = l.touchObject.swipeLength, l.touchObject.edgeHit = !1, l.options.infinite === !1 && (0 === l.currentSlide && "right" === t || l.currentSlide >= l.getDotCount() && "left" === t) && (o = l.touchObject.swipeLength * l.options.edgeFriction, l.touchObject.edgeHit = !0), l.options.vertical === !1 ? l.swipeLeft = e + o * s : l.swipeLeft = e + o * (l.$list.height() / l.listWidth) * s, l.options.verticalSwiping === !0 && (l.swipeLeft = e + o * s), l.options.fade !== !0 && l.options.touchMove !== !1 && (l.animating === !0 ? (l.swipeLeft = null, !1) : void l.setCSS(l.swipeLeft))))
  }, e.prototype.swipeStart = function (i) {
    var e, t = this;
    return t.interrupted = !0, 1 !== t.touchObject.fingerCount || t.slideCount <= t.options.slidesToShow ? (t.touchObject = {}, !1) : (void 0 !== i.originalEvent && void 0 !== i.originalEvent.touches && (e = i.originalEvent.touches[0]), t.touchObject.startX = t.touchObject.curX = void 0 !== e ? e.pageX : i.clientX, t.touchObject.startY = t.touchObject.curY = void 0 !== e ? e.pageY : i.clientY, void (t.dragging = !0))
  }, e.prototype.unfilterSlides = e.prototype.slickUnfilter = function () {
    var i = this;
    null !== i.$slidesCache && (i.unload(), i.$slideTrack.children(this.options.slide).detach(), i.$slidesCache.appendTo(i.$slideTrack), i.reinit())
  }, e.prototype.unload = function () {
    var e = this;
    i(".slick-cloned", e.$slider).remove(), e.$dots && e.$dots.remove(), e.$prevArrow && e.htmlExpr.test(e.options.prevArrow) && e.$prevArrow.remove(), e.$nextArrow && e.htmlExpr.test(e.options.nextArrow) && e.$nextArrow.remove(), e.$slides.removeClass("slick-slide slick-active slick-visible slick-current").attr("aria-hidden", "true").css("width", "")
  }, e.prototype.unslick = function (i) {
    var e = this;
    e.$slider.trigger("unslick", [e, i]), e.destroy()
  }, e.prototype.updateArrows = function () {
    var i, e = this;
    i = Math.floor(e.options.slidesToShow / 2), e.options.arrows === !0 && e.slideCount > e.options.slidesToShow && !e.options.infinite && (e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), 0 === e.currentSlide ? (e.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - e.options.slidesToShow && e.options.centerMode === !1 ? (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - 1 && e.options.centerMode === !0 && (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")))
  }, e.prototype.updateDots = function () {
    var i = this;
    null !== i.$dots && (i.$dots.find("li").removeClass("slick-active").end(), i.$dots.find("li").eq(Math.floor(i.currentSlide / i.options.slidesToScroll)).addClass("slick-active"))
  }, e.prototype.visibility = function () {
    var i = this;
    i.options.autoplay && (document[i.hidden] ? i.interrupted = !0 : i.interrupted = !1)
  }, i.fn.slick = function () {
    var i, t, o = this, s = arguments[0], n = Array.prototype.slice.call(arguments, 1), r = o.length;
    for (i = 0; i < r; i++) if ("object" == typeof s || "undefined" == typeof s ? o[i].slick = new e(o[i], s) : t = o[i].slick[s].apply(o[i].slick, n), "undefined" != typeof t) return t;
    return o
  }
});


/*=================================
    jQuery Scrollie Plugin
===================================*/

/*!
 * jQuery Scrollie Plugin v1.0.1
 * https://github.com/Funsella/jquery-scrollie
 *
 * Copyright 2013 JP Nothard
 * Released under the MIT license
 */
!function (e, l) {
  "use strict";

  function t(l, t) {
    this.element = l, this.settings = e.extend({}, i, t), this._defaults = i, this._name = s, this.init()
  }

  var s = "scrollie", i = {
    direction: "both",
    scrollOffset: 0,
    speed: 2,
    scrollingInView: null,
    ScrollingToTheTop: null,
    ScrollingOutOfView: null,
    scrolledOutOfView: null
  };
  t.prototype = {
    init: function () {
      this._defineElements(), this._scrollEvent()
    }, _defineElements: function () {
      var l = this;
      l.$scrollElement = e(l.element), l.$elemHeight = l.$scrollElement.outerHeight(), l.$elemPosTop = l.$scrollElement.offset().top, l.$scrollOffset = l.$scrollElement.data("scrollie-offset") || "0" == l.$scrollElement.data("scrollie-offset") ? l.$scrollElement.data("scrollie-offset") : l.settings.scrollOffset, l.$scrollSpeed = l.$scrollElement.data("scrollie-speed") || "0" == l.$scrollElement.data("scrollie-speed") ? l.$scrollElement.data("scrollie-speed") : l.settings.speed
    }, _inMotion: function (e, l, t, s) {
      var i = this, n = -1 * (-1 * (e - t) - l), o = -1 * (e - t) / i.$scrollSpeed, c = n < l + i.$elemHeight,
        r = n > 0 - i.$scrollOffset, f = r && l > n, u = r && c, h = n > l - i.$scrollOffset && c;
      f && jQuery.isFunction(i.settings.ScrollingToTheTop) && i.settings.ScrollingToTheTop.call(this, this.$scrollElement, i.$scrollOffset, s, n, o, t, e), u && jQuery.isFunction(i.settings.scrollingInView) && i.settings.scrollingInView.call(this, this.$scrollElement, i.$scrollOffset, s, n, o, t, e), h && jQuery.isFunction(i.settings.ScrollingOutOfView) && i.settings.ScrollingOutOfView.call(this, this.$scrollElement, i.$scrollOffset, s, n, o, t, e), c || jQuery.isFunction(i.settings.scrolledOutOfView) && i.settings.scrolledOutOfView.call(this, this.$scrollElement, i.$scrollOffset, s, n, o, t, e)
    }, _scrollEvent: function () {
      var t = this, s = t.settings.direction, i = 0, n = !0;
      setInterval(function () {
        n = !0
      }, 66), e(l).on("scroll", function () {
        var l = e(this).scrollTop(), o = e(this).height(), c = l > i ? "up" : "down";
        c === s && n === !0 ? (n = !1, t._inMotion(l, o, t.$elemPosTop, c)) : "both" === s && n === !0 && (n = !1, t._inMotion(l, o, t.$elemPosTop, c)), i = l
      })
    }
  }, e.fn[s] = function (l) {
    return this.each(function () {
      e.data(this, "plugin_" + s) || e.data(this, "plugin_" + s, new t(this, l))
    })
  }
}(jQuery, window, document);


/*=================================
    Justified Gallery
===================================*/
/*!
 * justifiedGallery - v4.0.0-alpha
 * http://miromannino.github.io/Justified-Gallery/
 * Copyright (c) 2019 Miro Mannino
 * Licensed under the MIT license.
 */

!function (e) {
  "function" == typeof define && define.amd ? define(["jquery"], e) : "object" == typeof module && module.exports ? module.exports = function (t, i) {
    return void 0 === i && (i = "undefined" != typeof window ? require("jquery") : require("jquery")(t)), e(i), i
  } : e(jQuery)
}(function (l) {
  var r = function (t, i) {
    this.settings = i, this.checkSettings(), this.imgAnalyzerTimeout = null, this.entries = null, this.buildingRow = {
      entriesBuff: [],
      width: 0,
      height: 0,
      aspectRatio: 0
    }, this.lastFetchedEntry = null, this.lastAnalyzedIndex = -1, this.yield = {
      every: 2,
      flushed: 0
    }, this.border = 0 <= i.border ? i.border : i.margins, this.maxRowHeight = this.retrieveMaxRowHeight(), this.suffixRanges = this.retrieveSuffixRanges(), this.offY = this.border, this.rows = 0, this.spinner = {
      phase: 0,
      timeSlot: 150,
      $el: l('<div class="spinner"><span></span><span></span><span></span></div>'),
      intervalId: null
    }, this.scrollBarOn = !1, this.checkWidthIntervalId = null, this.galleryWidth = t.width(), this.$gallery = t
  };
  r.prototype.getSuffix = function (t, i) {
    var e, s;
    for (e = i < t ? t : i, s = 0; s < this.suffixRanges.length; s++) if (e <= this.suffixRanges[s]) return this.settings.sizeRangeSuffixes[this.suffixRanges[s]];
    return this.settings.sizeRangeSuffixes[this.suffixRanges[s - 1]]
  }, r.prototype.removeSuffix = function (t, i) {
    return t.substring(0, t.length - i.length)
  }, r.prototype.endsWith = function (t, i) {
    return -1 !== t.indexOf(i, t.length - i.length)
  }, r.prototype.getUsedSuffix = function (t) {
    for (var i in this.settings.sizeRangeSuffixes) if (this.settings.sizeRangeSuffixes.hasOwnProperty(i)) {
      if (0 === this.settings.sizeRangeSuffixes[i].length) continue;
      if (this.endsWith(t, this.settings.sizeRangeSuffixes[i])) return this.settings.sizeRangeSuffixes[i]
    }
    return ""
  }, r.prototype.newSrc = function (t, i, e, s) {
    var n;
    if (this.settings.thumbnailPath) n = this.settings.thumbnailPath(t, i, e, s); else {
      var r = t.match(this.settings.extension), o = null !== r ? r[0] : "";
      n = t.replace(this.settings.extension, ""), n = this.removeSuffix(n, this.getUsedSuffix(n)), n += this.getSuffix(i, e) + o
    }
    return n
  }, r.prototype.showImg = function (t, i) {
    this.settings.cssAnimation ? (t.addClass("jg-entry-visible"), i && i()) : (t.stop().fadeTo(this.settings.imagesAnimationDuration, 1, i), t.find(this.settings.imgSelector).stop().fadeTo(this.settings.imagesAnimationDuration, 1, i))
  }, r.prototype.extractImgSrcFromImage = function (t) {
    var i = t.data("safe-src"), e = "date-safe-src";
    return void 0 === i && (i = t.attr("src"), e = "src"), t.data("jg.originalSrc", i), t.data("jg.src", i), t.data("jg.originalSrcLoc", e), i
  }, r.prototype.imgFromEntry = function (t) {
    var i = t.find(this.settings.imgSelector);
    return 0 === i.length ? null : i
  }, r.prototype.captionFromEntry = function (t) {
    var i = t.find("> .caption");
    return 0 === i.length ? null : i
  }, r.prototype.displayEntry = function (t, i, e, s, n, r) {
    t.width(s), t.height(r), t.css("top", e), t.css("left", i);
    var o = this.imgFromEntry(t);
    if (null !== o) {
      o.css("width", s), o.css("height", n), o.css("margin-left", -s / 2), o.css("margin-top", -n / 2);
      var a = o.data("jg.src");
      if (a) {
        a = this.newSrc(a, s, n, o[0]), o.one("error", function () {
          this.resetImgSrc(o)
        });
        var h = function () {
          o.attr("src", a)
        };
        "skipped" === t.data("jg.loaded") ? this.onImageEvent(a, function () {
          this.showImg(t, h), t.data("jg.loaded", !0)
        }.bind(this)) : this.showImg(t, h)
      }
    } else this.showImg(t);
    this.displayEntryCaption(t)
  }, r.prototype.displayEntryCaption = function (t) {
    var i = this.imgFromEntry(t);
    if (null !== i && this.settings.captions) {
      var e = this.captionFromEntry(t);
      if (null === e) {
        var s = i.attr("alt");
        this.isValidCaption(s) || (s = t.attr("title")), this.isValidCaption(s) && (e = l('<div class="caption">' + s + "</div>"), t.append(e), t.data("jg.createdCaption", !0))
      }
      null !== e && (this.settings.cssAnimation || e.stop().fadeTo(0, this.settings.captionSettings.nonVisibleOpacity), this.addCaptionEventsHandlers(t))
    } else this.removeCaptionEventsHandlers(t)
  }, r.prototype.isValidCaption = function (t) {
    return void 0 !== t && 0 < t.length
  }, r.prototype.onEntryMouseEnterForCaption = function (t) {
    var i = this.captionFromEntry(l(t.currentTarget));
    this.settings.cssAnimation ? i.addClass("caption-visible").removeClass("caption-hidden") : i.stop().fadeTo(this.settings.captionSettings.animationDuration, this.settings.captionSettings.visibleOpacity)
  }, r.prototype.onEntryMouseLeaveForCaption = function (t) {
    var i = this.captionFromEntry(l(t.currentTarget));
    this.settings.cssAnimation ? i.removeClass("caption-visible").removeClass("caption-hidden") : i.stop().fadeTo(this.settings.captionSettings.animationDuration, this.settings.captionSettings.nonVisibleOpacity)
  }, r.prototype.addCaptionEventsHandlers = function (t) {
    var i = t.data("jg.captionMouseEvents");
    void 0 === i && (i = {
      mouseenter: l.proxy(this.onEntryMouseEnterForCaption, this),
      mouseleave: l.proxy(this.onEntryMouseLeaveForCaption, this)
    }, t.on("mouseenter", void 0, void 0, i.mouseenter), t.on("mouseleave", void 0, void 0, i.mouseleave), t.data("jg.captionMouseEvents", i))
  }, r.prototype.removeCaptionEventsHandlers = function (t) {
    var i = t.data("jg.captionMouseEvents");
    void 0 !== i && (t.off("mouseenter", void 0, i.mouseenter), t.off("mouseleave", void 0, i.mouseleave), t.removeData("jg.captionMouseEvents"))
  }, r.prototype.clearBuildingRow = function () {
    this.buildingRow.entriesBuff = [], this.buildingRow.aspectRatio = 0, this.buildingRow.width = 0
  }, r.prototype.prepareBuildingRow = function (t) {
    var i, e, s, n, r, o = !0, a = 0,
      h = this.galleryWidth - 2 * this.border - (this.buildingRow.entriesBuff.length - 1) * this.settings.margins,
      g = h / this.buildingRow.aspectRatio, l = this.settings.rowHeight,
      d = this.buildingRow.width / h > this.settings.justifyThreshold;
    if (t && "hide" === this.settings.lastRow && !d) {
      for (i = 0; i < this.buildingRow.entriesBuff.length; i++) e = this.buildingRow.entriesBuff[i], this.settings.cssAnimation ? e.removeClass("jg-entry-visible") : (e.stop().fadeTo(0, .1), e.find("> img, > a > img").fadeTo(0, 0));
      return -1
    }
    for (t && !d && "justify" !== this.settings.lastRow && "hide" !== this.settings.lastRow && (o = !1, 0 < this.rows && (o = (l = (this.offY - this.border - this.settings.margins * this.rows) / this.rows) * this.buildingRow.aspectRatio / h > this.settings.justifyThreshold)), i = 0; i < this.buildingRow.entriesBuff.length; i++) s = (e = this.buildingRow.entriesBuff[i]).data("jg.width") / e.data("jg.height"), o ? (n = i === this.buildingRow.entriesBuff.length - 1 ? h : g * s, r = g) : (n = l * s, r = l), h -= Math.round(n), e.data("jg.jwidth", Math.round(n)), e.data("jg.jheight", Math.ceil(r)), (0 === i || r < a) && (a = r);
    return this.buildingRow.height = a, o
  }, r.prototype.flushRow = function (t) {
    var i, e, s, n = this.settings, r = this.border;
    if (e = this.prepareBuildingRow(t), t && "hide" === n.lastRow && -1 === e) this.clearBuildingRow(); else {
      if (this.maxRowHeight && this.maxRowHeight < this.buildingRow.height && (this.buildingRow.height = this.maxRowHeight), t && ("center" === n.lastRow || "right" === n.lastRow)) {
        var o = this.galleryWidth - 2 * this.border - (this.buildingRow.entriesBuff.length - 1) * n.margins;
        for (s = 0; s < this.buildingRow.entriesBuff.length; s++) o -= (i = this.buildingRow.entriesBuff[s]).data("jg.jwidth");
        "center" === n.lastRow ? r += o / 2 : "right" === n.lastRow && (r += o)
      }
      var a = this.buildingRow.entriesBuff.length - 1;
      for (s = 0; s <= a; s++) i = this.buildingRow.entriesBuff[this.settings.rtl ? a - s : s], this.displayEntry(i, r, this.offY, i.data("jg.jwidth"), i.data("jg.jheight"), this.buildingRow.height), r += i.data("jg.jwidth") + n.margins;
      this.galleryHeightToSet = this.offY + this.buildingRow.height + this.border, this.setGalleryTempHeight(this.galleryHeightToSet + this.getSpinnerHeight()), (!t || this.buildingRow.height <= n.rowHeight && e) && (this.offY += this.buildingRow.height + n.margins, this.rows += 1, this.clearBuildingRow(), this.settings.triggerEvent.call(this, "jg.rowflush"))
    }
  };
  var i = 0;
  r.prototype.rememberGalleryHeight = function () {
    i = this.$gallery.height(), this.$gallery.height(i)
  }, r.prototype.setGalleryTempHeight = function (t) {
    i = Math.max(t, i), this.$gallery.height(i)
  }, r.prototype.setGalleryFinalHeight = function (t) {
    i = t, this.$gallery.height(t)
  }, r.prototype.checkWidth = function () {
    this.checkWidthIntervalId = setInterval(l.proxy(function () {
      if (this.$gallery.is(":visible")) {
        var t = parseFloat(this.$gallery.width());
        Math.abs(t - this.galleryWidth) > this.settings.refreshSensitivity && (this.galleryWidth = t, this.rewind(), this.rememberGalleryHeight(), this.startImgAnalyzer(!0))
      }
    }, this), this.settings.refreshTime)
  }, r.prototype.isSpinnerActive = function () {
    return null !== this.spinner.intervalId
  }, r.prototype.getSpinnerHeight = function () {
    return this.spinner.$el.innerHeight()
  }, r.prototype.stopLoadingSpinnerAnimation = function () {
    clearInterval(this.spinner.intervalId), this.spinner.intervalId = null, this.setGalleryTempHeight(this.$gallery.height() - this.getSpinnerHeight()), this.spinner.$el.detach()
  }, r.prototype.startLoadingSpinnerAnimation = function () {
    var t = this.spinner, i = t.$el.find("span");
    clearInterval(t.intervalId), this.$gallery.append(t.$el), this.setGalleryTempHeight(this.offY + this.buildingRow.height + this.getSpinnerHeight()), t.intervalId = setInterval(function () {
      t.phase < i.length ? i.eq(t.phase).fadeTo(t.timeSlot, 1) : i.eq(t.phase - i.length).fadeTo(t.timeSlot, 0), t.phase = (t.phase + 1) % (2 * i.length)
    }, t.timeSlot)
  }, r.prototype.rewind = function () {
    this.lastFetchedEntry = null, this.lastAnalyzedIndex = -1, this.offY = this.border, this.rows = 0, this.clearBuildingRow()
  }, r.prototype.getAllEntries = function () {
    return this.$gallery.children(this.settings.selector).toArray()
  }, r.prototype.updateEntries = function (t) {
    var i;
    return t && null != this.lastFetchedEntry ? i = l(this.lastFetchedEntry).nextAll(this.settings.selector).toArray() : (this.entries = [], i = this.getAllEntries()), 0 < i.length && (l.isFunction(this.settings.sort) ? i = this.sortArray(i) : this.settings.randomize && (i = this.shuffleArray(i)), this.lastFetchedEntry = i[i.length - 1], this.settings.filter ? i = this.filterArray(i) : this.resetFilters(i)), this.entries = this.entries.concat(i), !0
  }, r.prototype.insertToGallery = function (t) {
    var i = this;
    l.each(t, function () {
      l(this).appendTo(i.$gallery)
    })
  }, r.prototype.shuffleArray = function (t) {
    var i, e, s;
    for (i = t.length - 1; 0 < i; i--) e = Math.floor(Math.random() * (i + 1)), s = t[i], t[i] = t[e], t[e] = s;
    return this.insertToGallery(t), t
  }, r.prototype.sortArray = function (t) {
    return t.sort(this.settings.sort), this.insertToGallery(t), t
  }, r.prototype.resetFilters = function (t) {
    for (var i = 0; i < t.length; i++) l(t[i]).removeClass("jg-filtered")
  }, r.prototype.filterArray = function (t) {
    var e = this.settings;
    if ("string" === l.type(e.filter)) return t.filter(function (t) {
      var i = l(t);
      return i.is(e.filter) ? (i.removeClass("jg-filtered"), !0) : (i.addClass("jg-filtered").removeClass("jg-visible"), !1)
    });
    if (l.isFunction(e.filter)) {
      for (var i = t.filter(e.filter), s = 0; s < t.length; s++) -1 === i.indexOf(t[s]) ? l(t[s]).addClass("jg-filtered").removeClass("jg-visible") : l(t[s]).removeClass("jg-filtered");
      return i
    }
  }, r.prototype.resetImgSrc = function (t) {
    "src" == t.data("jg.originalSrcLoc") ? t.attr("src", t.data("jg.originalSrc")) : t.attr("src", "")
  }, r.prototype.destroy = function () {
    clearInterval(this.checkWidthIntervalId), this.stopImgAnalyzerStarter(), l.each(this.getAllEntries(), l.proxy(function (t, i) {
      var e = l(i);
      e.css("width", ""), e.css("height", ""), e.css("top", ""), e.css("left", ""), e.data("jg.loaded", void 0), e.removeClass("jg-entry jg-filtered jg-entry-visible");
      var s = this.imgFromEntry(e);
      s && (s.css("width", ""), s.css("height", ""), s.css("margin-left", ""), s.css("margin-top", ""), this.resetImgSrc(s), s.data("jg.originalSrc", void 0), s.data("jg.originalSrcLoc", void 0), s.data("jg.src", void 0)), this.removeCaptionEventsHandlers(e);
      var n = this.captionFromEntry(e);
      e.data("jg.createdCaption") ? (e.data("jg.createdCaption", void 0), null !== n && n.remove()) : null !== n && n.fadeTo(0, 1)
    }, this)), this.$gallery.css("height", ""), this.$gallery.removeClass("justified-gallery"), this.$gallery.data("jg.controller", void 0), this.settings.triggerEvent.call(this, "jg.destroy")
  }, r.prototype.analyzeImages = function (t) {
    for (var i = this.lastAnalyzedIndex + 1; i < this.entries.length; i++) {
      var e = l(this.entries[i]);
      if (!0 === e.data("jg.loaded") || "skipped" === e.data("jg.loaded")) {
        var s = this.galleryWidth - 2 * this.border - (this.buildingRow.entriesBuff.length - 1) * this.settings.margins,
          n = e.data("jg.width") / e.data("jg.height");
        if (this.buildingRow.entriesBuff.push(e), this.buildingRow.aspectRatio += n, this.buildingRow.width += n * this.settings.rowHeight, this.lastAnalyzedIndex = i, s / (this.buildingRow.aspectRatio + n) < this.settings.rowHeight && (this.flushRow(!1), ++this.yield.flushed >= this.yield.every)) return void this.startImgAnalyzer(t)
      } else if ("error" !== e.data("jg.loaded")) return
    }
    0 < this.buildingRow.entriesBuff.length && this.flushRow(!0), this.isSpinnerActive() && this.stopLoadingSpinnerAnimation(), this.stopImgAnalyzerStarter(), this.settings.triggerEvent.call(this, t ? "jg.resize" : "jg.complete"), this.setGalleryFinalHeight(this.galleryHeightToSet)
  }, r.prototype.stopImgAnalyzerStarter = function () {
    this.yield.flushed = 0, null !== this.imgAnalyzerTimeout && (clearTimeout(this.imgAnalyzerTimeout), this.imgAnalyzerTimeout = null)
  }, r.prototype.startImgAnalyzer = function (t) {
    var i = this;
    this.stopImgAnalyzerStarter(), this.imgAnalyzerTimeout = setTimeout(function () {
      i.analyzeImages(t)
    }, .001)
  }, r.prototype.onImageEvent = function (t, i, e) {
    if (i || e) {
      var s = new Image, n = l(s);
      i && n.one("load", function () {
        n.off("load error"), i(s)
      }), e && n.one("error", function () {
        n.off("load error"), e(s)
      }), s.src = t
    }
  }, r.prototype.init = function () {
    var a = !1, h = !1, g = this;
    l.each(this.entries, function (t, i) {
      var e = l(i), s = g.imgFromEntry(e);
      if (e.addClass("jg-entry"), !0 !== e.data("jg.loaded") && "skipped" !== e.data("jg.loaded")) if (null !== g.settings.rel && e.attr("rel", g.settings.rel), null !== g.settings.target && e.attr("target", g.settings.target), null !== s) {
        var n = g.extractImgSrcFromImage(s);
        if (!1 === g.settings.waitThumbnailsLoad || !n) {
          var r = parseFloat(s.attr("width")), o = parseFloat(s.attr("height"));
          if ("svg" === s.prop("tagName") && (r = parseFloat(s[0].getBBox().width), o = parseFloat(s[0].getBBox().height)), !isNaN(r) && !isNaN(o)) return e.data("jg.width", r), e.data("jg.height", o), e.data("jg.loaded", "skipped"), h = !0, g.startImgAnalyzer(!1), !0
        }
        e.data("jg.loaded", !1), a = !0, g.isSpinnerActive() || g.startLoadingSpinnerAnimation(), g.onImageEvent(n, function (t) {
          e.data("jg.width", t.width), e.data("jg.height", t.height), e.data("jg.loaded", !0), g.startImgAnalyzer(!1)
        }, function () {
          e.data("jg.loaded", "error"), g.startImgAnalyzer(!1)
        })
      } else e.data("jg.loaded", !0), e.data("jg.width", e.width() | parseFloat(e.css("width")) | 1), e.data("jg.height", e.height() | parseFloat(e.css("height")) | 1)
    }), a || h || this.startImgAnalyzer(!1), this.checkWidth()
  }, r.prototype.checkOrConvertNumber = function (t, i) {
    if ("string" === l.type(t[i]) && (t[i] = parseFloat(t[i])), "number" !== l.type(t[i])) throw i + " must be a number";
    if (isNaN(t[i])) throw"invalid number for " + i
  }, r.prototype.checkSizeRangesSuffixes = function () {
    if ("object" !== l.type(this.settings.sizeRangeSuffixes)) throw"sizeRangeSuffixes must be defined and must be an object";
    var t = [];
    for (var i in this.settings.sizeRangeSuffixes) this.settings.sizeRangeSuffixes.hasOwnProperty(i) && t.push(i);
    for (var e = {0: ""}, s = 0; s < t.length; s++) if ("string" === l.type(t[s])) try {
      e[parseInt(t[s].replace(/^[a-z]+/, ""), 10)] = this.settings.sizeRangeSuffixes[t[s]]
    } catch (t) {
      throw"sizeRangeSuffixes keys must contains correct numbers (" + t + ")"
    } else e[t[s]] = this.settings.sizeRangeSuffixes[t[s]];
    this.settings.sizeRangeSuffixes = e
  }, r.prototype.retrieveMaxRowHeight = function () {
    var t = null, i = this.settings.rowHeight;
    if ("string" === l.type(this.settings.maxRowHeight)) t = this.settings.maxRowHeight.match(/^[0-9]+%$/) ? i * parseFloat(this.settings.maxRowHeight.match(/^([0-9]+)%$/)[1]) / 100 : parseFloat(this.settings.maxRowHeight); else {
      if ("number" !== l.type(this.settings.maxRowHeight)) {
        if (!1 === this.settings.maxRowHeight || null == this.settings.maxRowHeight) return null;
        throw"maxRowHeight must be a number or a percentage"
      }
      t = this.settings.maxRowHeight
    }
    if (isNaN(t)) throw"invalid number for maxRowHeight";
    return t < i && (t = i), t
  }, r.prototype.checkSettings = function () {
    this.checkSizeRangesSuffixes(), this.checkOrConvertNumber(this.settings, "rowHeight"), this.checkOrConvertNumber(this.settings, "margins"), this.checkOrConvertNumber(this.settings, "border");
    var t = ["justify", "nojustify", "left", "center", "right", "hide"];
    if (-1 === t.indexOf(this.settings.lastRow)) throw"lastRow must be one of: " + t.join(", ");
    if (this.checkOrConvertNumber(this.settings, "justifyThreshold"), this.settings.justifyThreshold < 0 || 1 < this.settings.justifyThreshold) throw"justifyThreshold must be in the interval [0,1]";
    if ("boolean" !== l.type(this.settings.cssAnimation)) throw"cssAnimation must be a boolean";
    if ("boolean" !== l.type(this.settings.captions)) throw"captions must be a boolean";
    if (this.checkOrConvertNumber(this.settings.captionSettings, "animationDuration"), this.checkOrConvertNumber(this.settings.captionSettings, "visibleOpacity"), this.settings.captionSettings.visibleOpacity < 0 || 1 < this.settings.captionSettings.visibleOpacity) throw"captionSettings.visibleOpacity must be in the interval [0, 1]";
    if (this.checkOrConvertNumber(this.settings.captionSettings, "nonVisibleOpacity"), this.settings.captionSettings.nonVisibleOpacity < 0 || 1 < this.settings.captionSettings.nonVisibleOpacity) throw"captionSettings.nonVisibleOpacity must be in the interval [0, 1]";
    if (this.checkOrConvertNumber(this.settings, "imagesAnimationDuration"), this.checkOrConvertNumber(this.settings, "refreshTime"), this.checkOrConvertNumber(this.settings, "refreshSensitivity"), "boolean" !== l.type(this.settings.randomize)) throw"randomize must be a boolean";
    if ("string" !== l.type(this.settings.selector)) throw"selector must be a string";
    if (!1 !== this.settings.sort && !l.isFunction(this.settings.sort)) throw"sort must be false or a comparison function";
    if (!1 !== this.settings.filter && !l.isFunction(this.settings.filter) && "string" !== l.type(this.settings.filter)) throw"filter must be false, a string or a filter function"
  }, r.prototype.retrieveSuffixRanges = function () {
    var t = [];
    for (var i in this.settings.sizeRangeSuffixes) this.settings.sizeRangeSuffixes.hasOwnProperty(i) && t.push(parseInt(i, 10));
    return t.sort(function (t, i) {
      return i < t ? 1 : t < i ? -1 : 0
    }), t
  }, r.prototype.updateSettings = function (t) {
    this.settings = l.extend({}, this.settings, t), this.checkSettings(), this.border = 0 <= this.settings.border ? this.settings.border : this.settings.margins, this.maxRowHeight = this.retrieveMaxRowHeight(), this.suffixRanges = this.retrieveSuffixRanges()
  }, r.prototype.defaults = {
    sizeRangeSuffixes: {},
    thumbnailPath: void 0,
    rowHeight: 120,
    maxRowHeight: !1,
    margins: 1,
    border: -1,
    lastRow: "nojustify",
    justifyThreshold: .9,
    waitThumbnailsLoad: !0,
    captions: !0,
    cssAnimation: !0,
    imagesAnimationDuration: 500,
    captionSettings: {animationDuration: 500, visibleOpacity: .7, nonVisibleOpacity: 0},
    rel: null,
    target: null,
    extension: /\.[^.\\/]+$/,
    refreshTime: 200,
    refreshSensitivity: 0,
    randomize: !1,
    rtl: !1,
    sort: !1,
    filter: !1,
    selector: "a, div:not(.spinner)",
    imgSelector: "> img, > a > img, > svg, > a > svg",
    triggerEvent: function (t) {
      this.$gallery.trigger(t)
    }
  }, l.fn.justifiedGallery = function (n) {
    return this.each(function (t, i) {
      var e = l(i);
      e.addClass("justified-gallery");
      var s = e.data("jg.controller");
      if (void 0 === s) {
        if (null != n && "object" !== l.type(n)) {
          if ("destroy" === n) return;
          throw"The argument must be an object"
        }
        s = new r(e, l.extend({}, r.prototype.defaults, n)), e.data("jg.controller", s)
      } else if ("norewind" === n) ; else {
        if ("destroy" === n) return void s.destroy();
        s.updateSettings(n), s.rewind()
      }
      s.updateEntries("norewind" === n) && s.init()
    })
  }
});


/*=================================
    fullPage 2.7.4
====================================*/


/*!
 * fullPage 2.7.4
 * https://github.com/alvarotrigo/fullPage.js
 * @license MIT licensed
 *
 * Copyright (C) 2015 alvarotrigo.com - A project by Alvaro Trigo
 */


(function (c, k) {
  "function" === typeof define && define.amd ? define(["jquery"], function (m) {
    return k(m, c, c.document, c.Math)
  }) : "undefined" !== typeof exports ? module.exports = k(require("jquery"), c, c.document, c.Math) : k(jQuery, c, c.document, c.Math)
})("undefined" !== typeof window ? window : this, function (c, k, m, p, D) {
  var n = c(k), t = c(m);
  c.fn.fullpage = function (d) {
    function La() {
      d.css3 && (d.css3 = Ma());
      d.anchors.length || (d.anchors = c("[data-anchor]").map(function () {
        return c(this).data("anchor").toString()
      }).get());
      Na();
      e.setAllowScrolling(!0);
      q = n.height();
      e.setAutoScrolling(d.autoScrolling, "internal");
      var a = c(".fp-section.active").find(".fp-slide.active");
      a.length && (0 !== c(".fp-section.active").index(".fp-section") || 0 === c(".fp-section.active").index(".fp-section") && 0 !== a.index()) && T(a);
      ja();
      ka();
      n.on("load", function () {
        var a = k.location.hash.replace("#", "").split("/"), c = a[0], a = a[1];
        c && (d.animateAnchor ? U(c, a) : e.silentMoveTo(c, a))
      })
    }

    function Na() {
      h.css({height: "100%", position: "relative"});
      h.addClass("fullpage-wrapper");
      c("html").addClass("fp-enabled");
      h.removeClass("fp-destroyed");
      Oa();
      c(".fp-section").each(function (a) {
        var b = c(this), g = b.find(".fp-slide"), f = g.length;
        a || 0 !== c(".fp-section.active").length || b.addClass("active");
        b.css("height", q + "px");
        d.paddingTop && b.css("padding-top", d.paddingTop);
        d.paddingBottom && b.css("padding-bottom", d.paddingBottom);
        "undefined" !== typeof d.sectionsColor[a] && b.css("background-color", d.sectionsColor[a]);
        "undefined" !== typeof d.anchors[a] && b.attr("data-anchor", d.anchors[a]);
        "undefined" !== typeof d.anchors[a] && b.hasClass("active") &&
        V(d.anchors[a], a);
        d.menu && d.css3 && c(d.menu).closest(".fullpage-wrapper").length && c(d.menu).appendTo(r);
        0 < f ? Pa(b, g, f) : d.verticalCentered && la(b)
      });
      d.fixedElements && d.css3 && c(d.fixedElements).appendTo(r);
      d.navigation && Qa();
      d.scrollOverflow ? ("complete" === m.readyState && ma(), n.on("load", ma)) : na()
    }

    function Pa(a, b, g) {
      var f = 100 * g, e = 100 / g;
      b.wrapAll('<div class="fp-slidesContainer" />');
      b.parent().wrap('<div class="fp-slides" />');
      a.find(".fp-slidesContainer").css("width", f + "%");
      1 < g && (d.controlArrows && Ra(a),
      d.slidesNavigation && Sa(a, g));
      b.each(function (a) {
        c(this).css("width", e + "%");
        d.verticalCentered && la(c(this))
      });
      a = a.find(".fp-slide.active");
      a.length && (0 !== c(".fp-section.active").index(".fp-section") || 0 === c(".fp-section.active").index(".fp-section") && 0 !== a.index()) ? T(a) : b.eq(0).addClass("active")
    }

    function Oa() {
      c(d.sectionSelector).each(function () {
        c(this).addClass("fp-section")
      });
      c(d.slideSelector).each(function () {
        c(this).addClass("fp-slide")
      })
    }

    function Ra(a) {
      a.find(".fp-slides").after('<div class="fp-controlArrow fp-prev"></div><div class="fp-controlArrow fp-next"></div>');
      "#fff" != d.controlArrowColor && (a.find(".fp-controlArrow.fp-next").css("border-color", "transparent transparent transparent " + d.controlArrowColor), a.find(".fp-controlArrow.fp-prev").css("border-color", "transparent " + d.controlArrowColor + " transparent transparent"));
      d.loopHorizontal || a.find(".fp-controlArrow.fp-prev").hide()
    }

    function Qa() {
      r.append('<div id="fp-nav"><ul></ul></div>');
      var a = c("#fp-nav");
      a.addClass(function () {
        return d.showActiveTooltip ? "fp-show-active " + d.navigationPosition : d.navigationPosition
      });
      for (var b = 0; b < c(".fp-section").length; b++) {
        var g = "";
        d.anchors.length && (g = d.anchors[b]);
        var g = '<li><a href="#' + g + '"><span></span></a>', f = d.navigationTooltips[b];
        "undefined" !== typeof f && "" !== f && (g += '<div class="fp-tooltip ' + d.navigationPosition + '">' + f + "</div>");
        g += "</li>";
        a.find("ul").append(g)
      }
      c("#fp-nav").css("margin-top", "-" + c("#fp-nav").height() / 2 + "px");
      c("#fp-nav").find("li").eq(c(".fp-section.active").index(".fp-section")).find("a").addClass("active")
    }

    function ma() {
      c(".fp-section").each(function () {
        var a =
          c(this).find(".fp-slide");
        a.length ? a.each(function () {
          I(c(this))
        }) : I(c(this))
      });
      na()
    }

    function na() {
      var a = c(".fp-section.active"), b = a.find("SLIDES_WRAPPER"), g = a.find(".fp-scrollable");
      b.length && (g = b.find(".fp-slide.active"));
      g.mouseover();
      J(a);
      oa(a);
      c.isFunction(d.afterLoad) && d.afterLoad.call(a, a.data("anchor"), a.index(".fp-section") + 1);
      c.isFunction(d.afterRender) && d.afterRender.call(h)
    }

    function pa() {
      var a;
      if (!d.autoScrolling || d.scrollBar) {
        for (var b = n.scrollTop(), g = 0, f = p.abs(b - m.querySelectorAll(".fp-section")[0].offsetTop),
               e = m.querySelectorAll(".fp-section"), h = 0; h < e.length; ++h) {
          var k = p.abs(b - e[h].offsetTop);
          k < f && (g = h, f = k)
        }
        a = c(e).eq(g);
        if (!a.hasClass("active") && !a.hasClass("fp-auto-height")) {
          W = !0;
          b = c(".fp-section.active");
          g = b.index(".fp-section") + 1;
          f = X(a);
          e = a.data("anchor");
          h = a.index(".fp-section") + 1;
          k = a.find(".fp-slide.active");
          if (k.length) var l = k.data("anchor"), q = k.index();
          u && (a.addClass("active").siblings().removeClass("active"), c.isFunction(d.onLeave) && d.onLeave.call(b, g, h, f), c.isFunction(d.afterLoad) && d.afterLoad.call(a,
            e, h), J(a), V(e, h - 1), d.anchors.length && (y = e, Y(q, l, e, h)));
          clearTimeout(Z);
          Z = setTimeout(function () {
            W = !1
          }, 100)
        }
        d.fitToSection && (clearTimeout(aa), aa = setTimeout(function () {
          u && d.fitToSection && (c(".fp-section.active").is(a) && requestAnimFrame(function () {
            v = !0
          }), z(a), requestAnimFrame(function () {
            v = !1
          }))
        }, d.fitToSectionDelay))
      }
    }

    function qa(a) {
      return a.find(".fp-slides").length ? a.find(".fp-slide.active").find(".fp-scrollable") : a.find(".fp-scrollable")
    }

    function K(a, b) {
      if (l.m[a]) {
        var d, c;
        "down" == a ? (d = "bottom", c = e.moveSectionDown) :
          (d = "top", c = e.moveSectionUp);
        if (0 < b.length) if (d = "top" === d ? !b.scrollTop() : "bottom" === d ? b.scrollTop() + 1 + b.innerHeight() >= b[0].scrollHeight : void 0, d) c(); else return !0; else c()
      }
    }

    function Ta(a) {
      var b = a.originalEvent;
      if (!ra(a.target) && ba(b)) {
        d.autoScrolling && a.preventDefault();
        a = c(".fp-section.active");
        var g = qa(a);
        u && !w && (b = sa(b), E = b.y, L = b.x, a.find(".fp-slides").length && p.abs(M - L) > p.abs(F - E) ? p.abs(M - L) > n.width() / 100 * d.touchSensitivity && (M > L ? l.m.right && e.moveSlideRight() : l.m.left && e.moveSlideLeft()) : d.autoScrolling &&
          p.abs(F - E) > n.height() / 100 * d.touchSensitivity && (F > E ? K("down", g) : E > F && K("up", g)))
      }
    }

    function ra(a, b) {
      b = b || 0;
      var g = c(a).parent();
      return b < d.normalScrollElementTouchThreshold && g.is(d.normalScrollElements) ? !0 : b == d.normalScrollElementTouchThreshold ? !1 : ra(g, ++b)
    }

    function ba(a) {
      return "undefined" === typeof a.pointerType || "mouse" != a.pointerType
    }

    function Ua(a) {
      a = a.originalEvent;
      d.fitToSection && x.stop();
      ba(a) && (a = sa(a), F = a.y, M = a.x)
    }

    function ta(a, b) {
      for (var d = 0, c = a.slice(p.max(a.length - b, 1)), e = 0; e < c.length; e++) d +=
        c[e];
      return p.ceil(d / b)
    }

    function A(a) {
      var b = (new Date).getTime();
      if (d.autoScrolling && !N) {
        a = a || k.event;
        var g = a.wheelDelta || -a.deltaY || -a.detail, f = p.max(-1, p.min(1, g)),
          e = "undefined" !== typeof a.wheelDeltaX || "undefined" !== typeof a.deltaX,
          e = p.abs(a.wheelDeltaX) < p.abs(a.wheelDelta) || p.abs(a.deltaX) < p.abs(a.deltaY) || !e;
        149 < B.length && B.shift();
        B.push(p.abs(g));
        d.scrollBar && (a.preventDefault ? a.preventDefault() : a.returnValue = !1);
        a = c(".fp-section.active");
        a = qa(a);
        g = b - ua;
        ua = b;
        200 < g && (B = []);
        u && (b = ta(B, 10), g = ta(B,
          70), b >= g && e && (0 > f ? K("down", a) : K("up", a)));
        return !1
      }
      d.fitToSection && x.stop()
    }

    function va(a) {
      var b = c(".fp-section.active").find(".fp-slides"), g = b.find(".fp-slide").length;
      if (!(!b.length || w || 2 > g)) {
        var g = b.find(".fp-slide.active"), f = null, f = "prev" === a ? g.prev(".fp-slide") : g.next(".fp-slide");
        if (!f.length) {
          if (!d.loopHorizontal) return;
          f = "prev" === a ? g.siblings(":last") : g.siblings(":first")
        }
        w = !0;
        G(b, f)
      }
    }

    function wa() {
      c(".fp-slide.active").each(function () {
        T(c(this), "internal")
      })
    }

    function z(a, b, g) {
      requestAnimFrame(function () {
        var f =
          a.position();
        if ("undefined" !== typeof f) {
          var e = a.hasClass("fp-auto-height") ? f.top - q + a.height() : f.top, f = {
            element: a,
            callback: b,
            isMovementUp: g,
            dest: f,
            dtop: e,
            yMovement: X(a),
            anchorLink: a.data("anchor"),
            sectionIndex: a.index(".fp-section"),
            activeSlide: a.find(".fp-slide.active"),
            activeSection: c(".fp-section.active"),
            leavingSection: c(".fp-section.active").index(".fp-section") + 1,
            localIsResizing: v
          };
          if (!(f.activeSection.is(a) && !v || d.scrollBar && n.scrollTop() === f.dtop && !a.hasClass("fp-auto-height"))) {
            if (f.activeSlide.length) var h =
              f.activeSlide.data("anchor"), k = f.activeSlide.index();
            d.autoScrolling && d.continuousVertical && "undefined" !== typeof f.isMovementUp && (!f.isMovementUp && "up" == f.yMovement || f.isMovementUp && "down" == f.yMovement) && (f.isMovementUp ? c(".fp-section.active").before(f.activeSection.nextAll(".fp-section")) : c(".fp-section.active").after(f.activeSection.prevAll(".fp-section").get().reverse()), H(c(".fp-section.active").position().top), wa(), f.wrapAroundElements = f.activeSection, f.dest = f.element.position(), f.dtop = f.dest.top,
              f.yMovement = X(f.element));
            if (c.isFunction(d.onLeave) && !f.localIsResizing) {
              if (!1 === d.onLeave.call(f.activeSection, f.leavingSection, f.sectionIndex + 1, f.yMovement)) return;
              Va(f.activeSection)
            }
            a.addClass("active").siblings().removeClass("active");
            J(a);
            u = !1;
            Y(k, h, f.anchorLink, f.sectionIndex);
            Wa(f);
            y = f.anchorLink;
            V(f.anchorLink, f.sectionIndex)
          }
        }
      })
    }

    function Wa(a) {
      if (d.css3 && d.autoScrolling && !d.scrollBar) xa("translate3d(0px, -" + a.dtop + "px, 0px)", !0), d.scrollingSpeed ? ca = setTimeout(function () {
          da(a)
        }, d.scrollingSpeed) :
        da(a); else {
        var b = Xa(a);
        c(b.element).animate(b.options, d.scrollingSpeed, d.easing).promise().done(function () {
          da(a)
        })
      }
    }

    function Xa(a) {
      var b = {};
      d.autoScrolling && !d.scrollBar ? (b.options = {top: -a.dtop}, b.element = ".fullpage-wrapper") : (b.options = {scrollTop: a.dtop}, b.element = "html, body");
      return b
    }

    function da(a) {
      a.wrapAroundElements && a.wrapAroundElements.length && (a.isMovementUp ? c(".fp-section:first").before(a.wrapAroundElements) : c(".fp-section:last").after(a.wrapAroundElements), H(c(".fp-section.active").position().top),
        wa());
      a.element.find(".fp-scrollable").mouseover();
      c.isFunction(d.afterLoad) && !a.localIsResizing && d.afterLoad.call(a.element, a.anchorLink, a.sectionIndex + 1);
      oa(a.element);
      u = !0;
      c.isFunction(a.callback) && a.callback.call(this)
    }

    function J(a) {
      var b = a.find(".fp-slide.active");
      b.length && (a = c(b));
      a.find("img[data-src], source[data-src], audio[data-src]").each(function () {
        c(this).attr("src", c(this).data("src"));
        c(this).removeAttr("data-src");
        c(this).is("source") && c(this).closest("video").get(0).load()
      })
    }

    function oa(a) {
      a.find("video, audio").each(function () {
        var a =
          c(this).get(0);
        a.hasAttribute("autoplay") && "function" === typeof a.play && a.play()
      })
    }

    function Va(a) {
      a.find("video, audio").each(function () {
        var a = c(this).get(0);
        a.hasAttribute("data-ignore") || "function" !== typeof a.pause || a.pause()
      })
    }

    function ya() {
      if (!W && !d.lockAnchors) {
        var a = k.location.hash.replace("#", "").split("/"), b = a[0], a = a[1], c = "undefined" === typeof y,
          f = "undefined" === typeof y && "undefined" === typeof a && !w;
        b.length && (b && b !== y && !c || f || !w && ea != a) && U(b, a)
      }
    }

    function Ya(a) {
      u && (a.pageY < O ? e.moveSectionUp() :
        a.pageY > O && e.moveSectionDown());
      O = a.pageY
    }

    function G(a, b) {
      var g = b.position(), f = b.index(), e = a.closest(".fp-section"), h = e.index(".fp-section"),
        k = e.data("anchor"), l = e.find(".fp-slidesNav"), m = fa(b), n = v;
      if (d.onSlideLeave) {
        var q = e.find(".fp-slide.active"), r = q.index(), t;
        t = r == f ? "none" : r > f ? "left" : "right";
        if (!n && "none" !== t && c.isFunction(d.onSlideLeave) && !1 === d.onSlideLeave.call(q, k, h + 1, r, t, f)) {
          w = !1;
          return
        }
      }
      b.addClass("active").siblings().removeClass("active");
      n || J(b);
      !d.loopHorizontal && d.controlArrows && (e.find(".fp-controlArrow.fp-prev").toggle(0 !==
        f), e.find(".fp-controlArrow.fp-next").toggle(!b.is(":last-child")));
      e.hasClass("active") && Y(f, m, k, h);
      var u = function () {
        n || c.isFunction(d.afterSlideLoad) && d.afterSlideLoad.call(b, k, h + 1, m, f);
        w = !1
      };
      d.css3 ? (g = "translate3d(-" + p.round(g.left) + "px, 0px, 0px)", za(a.find(".fp-slidesContainer"), 0 < d.scrollingSpeed).css(Aa(g)), ga = setTimeout(function () {
        u()
      }, d.scrollingSpeed, d.easing)) : a.animate({scrollLeft: p.round(g.left)}, d.scrollingSpeed, d.easing, function () {
        u()
      });
      l.find(".active").removeClass("active");
      l.find("li").eq(f).find("a").addClass("active")
    }

    function Ba() {
      ja();
      if (P) {
        var a = c(m.activeElement);
        a.is("textarea") || a.is("input") || a.is("select") || (a = n.height(), p.abs(a - ha) > 20 * p.max(ha, a) / 100 && (e.reBuild(!0), ha = a))
      } else clearTimeout(ia), ia = setTimeout(function () {
        e.reBuild(!0)
      }, 350)
    }

    function ja() {
      var a = d.responsive || d.responsiveWidth, b = d.responsiveHeight, c = a && n.width() < a,
        f = b && n.height() < b;
      a && b ? e.setResponsive(c || f) : a ? e.setResponsive(c) : b && e.setResponsive(f)
    }

    function za(a) {
      var b = "all " + d.scrollingSpeed + "ms " + d.easingcss3;
      a.removeClass("fp-notransition");
      return a.css({"-webkit-transition": b, transition: b})
    }

    function Za(a, b) {
      if (825 > a || 900 > b) {
        var c = p.min(100 * a / 825, 100 * b / 900).toFixed(2);
        r.css("font-size", c + "%")
      } else r.css("font-size", "100%")
    }

    function V(a, b) {
      d.menu && (c(d.menu).find(".active").removeClass("active"), c(d.menu).find('[data-menuanchor="' + a + '"]').addClass("active"));
      d.navigation && (c("#fp-nav").find(".active").removeClass("active"), a ? c("#fp-nav").find('a[href="#' + a + '"]').addClass("active") : c("#fp-nav").find("li").eq(b).find("a").addClass("active"))
    }

    function X(a) {
      var b = c(".fp-section.active").index(".fp-section");
      a = a.index(".fp-section");
      return b == a ? "none" : b > a ? "up" : "down"
    }

    function I(a) {
      a.css("overflow", "hidden");
      var b = a.closest(".fp-section"), c = a.find(".fp-scrollable"), f;
      c.length ? f = c.get(0).scrollHeight : (f = a.get(0).scrollHeight, d.verticalCentered && (f = a.find(".fp-tableCell").get(0).scrollHeight));
      b = q - parseInt(b.css("padding-bottom")) - parseInt(b.css("padding-top"));
      f > b ? c.length ? c.css("height", b + "px").parent().css("height", b + "px") : (d.verticalCentered ?
        a.find(".fp-tableCell").wrapInner('<div class="fp-scrollable" />') : a.wrapInner('<div class="fp-scrollable" />'), a.find(".fp-scrollable").slimScroll({
        allowPageScroll: !0,
        height: b + "px",
        size: "10px",
        alwaysVisible: !0
      })) : Ca(a);
      a.css("overflow", "")
    }

    function Ca(a) {
      a.find(".fp-scrollable").children().first().unwrap().unwrap();
      a.find(".slimScrollBar").remove();
      a.find(".slimScrollRail").remove()
    }

    function la(a) {
      a.addClass("fp-table").wrapInner('<div class="fp-tableCell" style="height:' + Da(a) + 'px;" />')
    }

    function Da(a) {
      var b =
        q;
      if (d.paddingTop || d.paddingBottom) b = a, b.hasClass("fp-section") || (b = a.closest(".fp-section")), a = parseInt(b.css("padding-top")) + parseInt(b.css("padding-bottom")), b = q - a;
      return b
    }

    function xa(a, b) {
      b ? za(h) : h.addClass("fp-notransition");
      h.css(Aa(a));
      setTimeout(function () {
        h.removeClass("fp-notransition")
      }, 10)
    }

    function Ea(a) {
      var b = c('.fp-section[data-anchor="' + a + '"]');
      b.length || (b = c(".fp-section").eq(a - 1));
      return b
    }

    function U(a, b) {
      var c = Ea(a);
      "undefined" === typeof b && (b = 0);
      a === y || c.hasClass("active") ? Fa(c,
        b) : z(c, function () {
        Fa(c, b)
      })
    }

    function Fa(a, b) {
      if ("undefined" !== typeof b) {
        var c = a.find(".fp-slides"), d;
        d = a.find(".fp-slides");
        var e = d.find('.fp-slide[data-anchor="' + b + '"]');
        e.length || (e = d.find(".fp-slide").eq(b));
        d = e;
        d.length && G(c, d)
      }
    }

    function Sa(a, b) {
      a.append('<div class="fp-slidesNav"><ul></ul></div>');
      var c = a.find(".fp-slidesNav");
      c.addClass(d.slidesNavPosition);
      for (var f = 0; f < b; f++) c.find("ul").append('<li><a href="#"><span></span></a></li>');
      c.css("margin-left", "-" + c.width() / 2 + "px");
      c.find("li").first().find("a").addClass("active")
    }

    function Y(a, b, c, f) {
      f = "";
      d.anchors.length && !d.lockAnchors && (a ? ("undefined" !== typeof c && (f = c), "undefined" === typeof b && (b = a), ea = b, Ga(f + "/" + b)) : ("undefined" !== typeof a && (ea = b), Ga(c)));
      ka()
    }

    function Ga(a) {
      if (d.recordHistory) location.hash = a; else if (P || Q) history.replaceState(D, D, "#" + a); else {
        var b = k.location.href.split("#")[0];
        k.location.replace(b + "#" + a)
      }
    }

    function fa(a) {
      var b = a.data("anchor");
      a = a.index();
      "undefined" === typeof b && (b = a);
      return b
    }

    function ka() {
      var a = c(".fp-section.active"), b = a.find(".fp-slide.active"),
        d = fa(a), f = fa(b);
      a.index(".fp-section");
      a = String(d);
      b.length && (a = a + "-" + f);
      a = a.replace("/", "-").replace("#", "");
      r[0].className = r[0].className.replace(RegExp("\\b\\s?fp-viewing-[^\\s]+\\b", "g"), "");
      r.addClass("fp-viewing-" + a)
    }

    function Ma() {
      var a = m.createElement("p"), b, c = {
        webkitTransform: "-webkit-transform",
        OTransform: "-o-transform",
        msTransform: "-ms-transform",
        MozTransform: "-moz-transform",
        transform: "transform"
      };
      m.body.insertBefore(a, null);
      for (var d in c) a.style[d] !== D && (a.style[d] = "translate3d(1px,1px,1px)",
        b = k.getComputedStyle(a).getPropertyValue(c[d]));
      m.body.removeChild(a);
      return b !== D && 0 < b.length && "none" !== b
    }

    function $a() {
      if (P || Q) {
        var a = Ha();
        c(".fullpage-wrapper").off("touchstart " + a.down).on("touchstart " + a.down, Ua);
        c(".fullpage-wrapper").off("touchmove " + a.move).on("touchmove " + a.move, Ta)
      }
    }

    function ab() {
      if (P || Q) {
        var a = Ha();
        c(".fullpage-wrapper").off("touchstart " + a.down);
        c(".fullpage-wrapper").off("touchmove " + a.move)
      }
    }

    function Ha() {
      return k.PointerEvent ? {down: "pointerdown", move: "pointermove"} :
        {down: "MSPointerDown", move: "MSPointerMove"}
    }

    function sa(a) {
      var b = [];
      b.y = "undefined" !== typeof a.pageY && (a.pageY || a.pageX) ? a.pageY : a.touches[0].pageY;
      b.x = "undefined" !== typeof a.pageX && (a.pageY || a.pageX) ? a.pageX : a.touches[0].pageX;
      Q && ba(a) && d.scrollBar && (b.y = a.touches[0].pageY, b.x = a.touches[0].pageX);
      return b
    }

    function T(a, b) {
      e.setScrollingSpeed(0, "internal");
      "undefined" !== typeof b && (v = !0);
      G(a.closest(".fp-slides"), a);
      "undefined" !== typeof b && (v = !1);
      e.setScrollingSpeed(C.scrollingSpeed, "internal")
    }

    function H(a) {
      d.scrollBar ?
        h.scrollTop(a) : d.css3 ? xa("translate3d(0px, -" + a + "px, 0px)", !1) : h.css("top", -a)
    }

    function Aa(a) {
      return {"-webkit-transform": a, "-moz-transform": a, "-ms-transform": a, transform: a}
    }

    function Ia(a, b, c) {
      switch (b) {
        case "up":
          l[c].up = a;
          break;
        case "down":
          l[c].down = a;
          break;
        case "left":
          l[c].left = a;
          break;
        case "right":
          l[c].right = a;
          break;
        case "all":
          "m" == c ? e.setAllowScrolling(a) : e.setKeyboardScrolling(a)
      }
    }

    function bb() {
      H(0);
      c("#fp-nav, .fp-slidesNav, .fp-controlArrow").remove();
      c(".fp-section").css({
        height: "", "background-color": "",
        padding: ""
      });
      c(".fp-slide").css({width: ""});
      h.css({height: "", position: "", "-ms-touch-action": "", "touch-action": ""});
      x.css({overflow: "", height: ""});
      c("html").removeClass("fp-enabled");
      c.each(r.get(0).className.split(/\s+/), function (a, b) {
        0 === b.indexOf("fp-viewing") && r.removeClass(b)
      });
      c(".fp-section, .fp-slide").each(function () {
        Ca(c(this));
        c(this).removeClass("fp-table active")
      });
      h.addClass("fp-notransition");
      h.find(".fp-tableCell, .fp-slidesContainer, .fp-slides").each(function () {
        c(this).replaceWith(this.childNodes)
      });
      x.scrollTop(0)
    }

    function R(a, b, c) {
      d[a] = b;
      "internal" !== c && (C[a] = b)
    }

    function S(a, b) {
      console && console[a] && console[a]("fullPage: " + b)
    }

    var x = c("html, body"), r = c("body"), e = c.fn.fullpage;
    d = c.extend({
      menu: !1,
      anchors: [],
      lockAnchors: !1,
      navigation: !1,
      navigationPosition: "right",
      navigationTooltips: [],
      showActiveTooltip: !1,
      slidesNavigation: !1,
      slidesNavPosition: "bottom",
      scrollBar: !1,
      css3: !0,
      scrollingSpeed: 700,
      autoScrolling: !0,
      fitToSection: !0,
      fitToSectionDelay: 1E3,
      easing: "easeInOutCubic",
      easingcss3: "ease",
      loopBottom: !1,
      loopTop: !1,
      loopHorizontal: !0,
      continuousVertical: !1,
      normalScrollElements: null,
      scrollOverflow: !1,
      touchSensitivity: 5,
      normalScrollElementTouchThreshold: 5,
      keyboardScrolling: !0,
      animateAnchor: !0,
      recordHistory: !0,
      controlArrows: !0,
      controlArrowColor: "#fff",
      verticalCentered: !0,
      resize: !1,
      sectionsColor: [],
      paddingTop: 0,
      paddingBottom: 0,
      fixedElements: null,
      responsive: 0,
      responsiveWidth: 0,
      responsiveHeight: 0,
      sectionSelector: ".section",
      slideSelector: ".slide",
      afterLoad: null,
      onLeave: null,
      afterRender: null,
      afterResize: null,
      afterReBuild: null,
      afterSlideLoad: null,
      onSlideLeave: null
    }, d);
    (function () {
      d.continuousVertical && (d.loopTop || d.loopBottom) && (d.continuousVertical = !1, S("warn", "Option `loopTop/loopBottom` is mutually exclusive with `continuousVertical`; `continuousVertical` disabled"));
      d.scrollBar && d.scrollOverflow && S("warn", "Option `scrollBar` is mutually exclusive with `scrollOverflow`. Sections with scrollOverflow might not work well in Firefox");
      d.continuousVertical && d.scrollBar && (d.continuousVertical = !1, S("warn",
        "Option `scrollBar` is mutually exclusive with `continuousVertical`; `continuousVertical` disabled"));
      c.each(d.anchors, function (a, b) {
        (c("#" + b).length || c('[name="' + b + '"]').length) && S("error", "data-anchor tags can not have the same value as any `id` element on the site (or `name` element for IE).")
      })
    })();
    c.extend(c.easing, {
      easeInOutCubic: function (a, b, c, d, e) {
        return 1 > (b /= e / 2) ? d / 2 * b * b * b + c : d / 2 * ((b -= 2) * b * b + 2) + c
      }
    });
    c.extend(c.easing, {
      easeInQuart: function (a, b, c, d, e) {
        return d * (b /= e) * b * b * b + c
      }
    });
    e.setAutoScrolling =
      function (a, b) {
        R("autoScrolling", a, b);
        var g = c(".fp-section.active");
        d.autoScrolling && !d.scrollBar ? (x.css({
          overflow: "hidden",
          height: "100%"
        }), e.setRecordHistory(C.recordHistory, "internal"), h.css({
          "-ms-touch-action": "none",
          "touch-action": "none"
        }), g.length && H(g.position().top)) : (x.css({
          overflow: "visible",
          height: "initial"
        }), e.setRecordHistory(!1, "internal"), h.css({
          "-ms-touch-action": "",
          "touch-action": ""
        }), H(0), g.length && x.scrollTop(g.position().top))
      };
    e.setRecordHistory = function (a, b) {
      R("recordHistory",
        a, b)
    };
    e.setScrollingSpeed = function (a, b) {
      R("scrollingSpeed", a, b)
    };
    e.setFitToSection = function (a, b) {
      R("fitToSection", a, b)
    };
    e.setLockAnchors = function (a) {
      d.lockAnchors = a
    };
    e.setMouseWheelScrolling = function (a) {
      if (a) {
        a = "";
        var b;
        k.addEventListener ? b = "addEventListener" : (b = "attachEvent", a = "on");
        var c = "onwheel" in m.createElement("div") ? "wheel" : m.onmousewheel !== D ? "mousewheel" : "DOMMouseScroll";
        if ("DOMMouseScroll" == c) m[b](a + "MozMousePixelScroll", A, !1); else m[b](a + c, A, !1)
      } else m.addEventListener ? (m.removeEventListener("mousewheel",
        A, !1), m.removeEventListener("wheel", A, !1), m.removeEventListener("MozMousePixelScroll", A, !1)) : m.detachEvent("onmousewheel", A)
    };
    e.setAllowScrolling = function (a, b) {
      "undefined" !== typeof b ? (b = b.replace(/ /g, "").split(","), c.each(b, function (b, c) {
        Ia(a, c, "m")
      })) : a ? (e.setMouseWheelScrolling(!0), $a()) : (e.setMouseWheelScrolling(!1), ab())
    };
    e.setKeyboardScrolling = function (a, b) {
      "undefined" !== typeof b ? (b = b.replace(/ /g, "").split(","), c.each(b, function (b, c) {
        Ia(a, c, "k")
      })) : d.keyboardScrolling = a
    };
    e.moveSectionUp = function () {
      var a =
        c(".fp-section.active").prev(".fp-section");
      a.length || !d.loopTop && !d.continuousVertical || (a = c(".fp-section").last());
      a.length && z(a, null, !0)
    };
    e.moveSectionDown = function () {
      var a = c(".fp-section.active").next(".fp-section");
      a.length || !d.loopBottom && !d.continuousVertical || (a = c(".fp-section").first());
      a.length && z(a, null, !1)
    };
    e.silentMoveTo = function (a, b) {
      requestAnimFrame(function () {
        e.setScrollingSpeed(0, "internal")
      });
      e.moveTo(a, b);
      requestAnimFrame(function () {
        e.setScrollingSpeed(C.scrollingSpeed, "internal")
      })
    };
    e.moveTo = function (a, b) {
      var c = Ea(a);
      "undefined" !== typeof b ? U(a, b) : 0 < c.length && z(c)
    };
    e.moveSlideRight = function () {
      va("next")
    };
    e.moveSlideLeft = function () {
      va("prev")
    };
    e.reBuild = function (a) {
      if (!h.hasClass("fp-destroyed")) {
        requestAnimFrame(function () {
          v = !0
        });
        var b = n.width();
        q = n.height();
        d.resize && Za(q, b);
        c(".fp-section").each(function () {
          var a = c(this).find(".fp-slides"), b = c(this).find(".fp-slide");
          d.verticalCentered && c(this).find(".fp-tableCell").css("height", Da(c(this)) + "px");
          c(this).css("height", q + "px");
          d.scrollOverflow && (b.length ? b.each(function () {
            I(c(this))
          }) : I(c(this)));
          1 < b.length && G(a, a.find(".fp-slide.active"))
        });
        (b = c(".fp-section.active").index(".fp-section")) && e.silentMoveTo(b + 1);
        requestAnimFrame(function () {
          v = !1
        });
        c.isFunction(d.afterResize) && a && d.afterResize.call(h);
        c.isFunction(d.afterReBuild) && !a && d.afterReBuild.call(h)
      }
    };
    e.setResponsive = function (a) {
      var b = h.hasClass("fp-responsive");
      a ? b || (e.setAutoScrolling(!1, "internal"), e.setFitToSection(!1, "internal"), c("#fp-nav").hide(), h.addClass("fp-responsive")) :
        b && (e.setAutoScrolling(C.autoScrolling, "internal"), e.setFitToSection(C.autoScrolling, "internal"), c("#fp-nav").show(), h.removeClass("fp-responsive"))
    };
    var w = !1,
      P = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|playbook|silk|BlackBerry|BB10|Windows Phone|Tizen|Bada|webOS|IEMobile|Opera Mini)/),
      Q = "ontouchstart" in k || 0 < navigator.msMaxTouchPoints || navigator.maxTouchPoints, h = c(this),
      q = n.height(), v = !1, Ja = !0, y, ea, u = !0, B = [], N, l = {m: {up: !0, down: !0, left: !0, right: !0}};
    l.k = c.extend(!0, {}, l.m);
    var C = c.extend(!0,
      {}, d), ia, ca, ga, Z, aa, Ka;
    c(this).length && La();
    var W = !1;
    n.on("scroll", pa);
    var F = 0, M = 0, E = 0, L = 0, ua = (new Date).getTime();
    k.requestAnimFrame = function () {
      return k.requestAnimationFrame || k.webkitRequestAnimationFrame || k.mozRequestAnimationFrame || k.oRequestAnimationFrame || k.msRequestAnimationFrame || function (a) {
        a()
      }
    }();
    n.on("hashchange", ya);
    t.keydown(function (a) {
      clearTimeout(Ka);
      var b = c(":focus");
      b.is("textarea") || b.is("input") || b.is("select") || !d.keyboardScrolling || !d.autoScrolling || (-1 < c.inArray(a.which, [40,
        38, 32, 33, 34]) && a.preventDefault(), N = a.ctrlKey, Ka = setTimeout(function () {
        var b = a.shiftKey;
        switch (a.which) {
          case 38:
          case 33:
            l.k.up && e.moveSectionUp();
            break;
          case 32:
            if (b && l.k.up) {
              e.moveSectionUp();
              break
            }
          case 40:
          case 34:
            l.k.down && e.moveSectionDown();
            break;
          case 36:
            l.k.up && e.moveTo(1);
            break;
          case 35:
            l.k.down && e.moveTo(c(".fp-section").length);
            break;
          case 37:
            l.k.left && e.moveSlideLeft();
            break;
          case 39:
            l.k.right && e.moveSlideRight()
        }
      }, 150))
    });
    t.keyup(function (a) {
      Ja && (N = a.ctrlKey)
    });
    c(k).blur(function () {
      N = Ja = !1
    });
    h.mousedown(function (a) {
      2 == a.which && (O = a.pageY, h.on("mousemove", Ya))
    });
    h.mouseup(function (a) {
      2 == a.which && h.off("mousemove")
    });
    var O = 0;
    t.on("click touchstart", "#fp-nav a", function (a) {
      a.preventDefault();
      a = c(this).parent().index();
      z(c(".fp-section").eq(a))
    });
    t.on("click touchstart", ".fp-slidesNav a", function (a) {
      a.preventDefault();
      a = c(this).closest(".fp-section").find(".fp-slides");
      var b = a.find(".fp-slide").eq(c(this).closest("li").index());
      G(a, b)
    });
    d.normalScrollElements && (t.on("mouseenter", d.normalScrollElements,
      function () {
        e.setMouseWheelScrolling(!1)
      }), t.on("mouseleave", d.normalScrollElements, function () {
      e.setMouseWheelScrolling(!0)
    }));
    c(".fp-section").on("click touchstart", ".fp-controlArrow", function () {
      c(this).hasClass("fp-prev") ? l.m.left && e.moveSlideLeft() : l.m.right && e.moveSlideRight()
    });
    n.resize(Ba);
    var ha = q;
    e.destroy = function (a) {
      e.setAutoScrolling(!1, "internal");
      e.setAllowScrolling(!1);
      e.setKeyboardScrolling(!1);
      h.addClass("fp-destroyed");
      clearTimeout(ga);
      clearTimeout(ca);
      clearTimeout(ia);
      clearTimeout(Z);
      clearTimeout(aa);
      n.off("scroll", pa).off("hashchange", ya).off("resize", Ba);
      t.off("click", "#fp-nav a").off("mouseenter", "#fp-nav li").off("mouseleave", "#fp-nav li").off("click", ".fp-slidesNav a").off("mouseover", d.normalScrollElements).off("mouseout", d.normalScrollElements);
      c(".fp-section").off("click", ".fp-controlArrow");
      clearTimeout(ga);
      clearTimeout(ca);
      a && bb()
    }
  }
});


/*=================================
    particles js Plugin
===================================*/

/* -----------------------------------------------
/* Author : Vincent Garreau  - vincentgarreau.com
/* MIT license: http://opensource.org/licenses/MIT
/* Demo / Generator : vincentgarreau.com/particles.js
/* GitHub : github.com/VincentGarreau/particles.js
/* How to use? : Check the GitHub README
/* v2.0.0
/* ----------------------------------------------- */
function hexToRgb(e) {
  var a = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
  e = e.replace(a, function (e, a, t, i) {
    return a + a + t + t + i + i
  });
  var t = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(e);
  return t ? {r: parseInt(t[1], 16), g: parseInt(t[2], 16), b: parseInt(t[3], 16)} : null
}

function clamp(e, a, t) {
  return Math.min(Math.max(e, a), t)
}

function isInArray(e, a) {
  return a.indexOf(e) > -1
}

var pJS = function (e, a) {
  var t = document.querySelector("#" + e + " > .particles-js-canvas-el");
  this.pJS = {
    canvas: {el: t, w: t.offsetWidth, h: t.offsetHeight},
    particles: {
      number: {value: 400, density: {enable: !0, value_area: 800}},
      color: {value: "#fff"},
      shape: {
        type: "circle",
        stroke: {width: 0, color: "#ff0000"},
        polygon: {nb_sides: 5},
        image: {src: "", width: 100, height: 100}
      },
      opacity: {value: 1, random: !1, anim: {enable: !1, speed: 2, opacity_min: 0, sync: !1}},
      size: {value: 20, random: !1, anim: {enable: !1, speed: 20, size_min: 0, sync: !1}},
      line_linked: {enable: !0, distance: 100, color: "#fff", opacity: 1, width: 1},
      move: {
        enable: !0,
        speed: 2,
        direction: "none",
        random: !1,
        straight: !1,
        out_mode: "out",
        bounce: !1,
        attract: {enable: !1, rotateX: 3e3, rotateY: 3e3}
      },
      array: []
    },
    interactivity: {
      detect_on: "canvas",
      events: {onhover: {enable: !0, mode: "grab"}, onclick: {enable: !0, mode: "push"}, resize: !0},
      modes: {
        grab: {distance: 100, line_linked: {opacity: 1}},
        bubble: {distance: 200, size: 80, duration: .4},
        repulse: {distance: 200, duration: .4},
        push: {particles_nb: 4},
        remove: {particles_nb: 2}
      },
      mouse: {}
    },
    retina_detect: !1,
    fn: {interact: {}, modes: {}, vendors: {}},
    tmp: {}
  };
  var i = this.pJS;
  a && Object.deepExtend(i, a), i.tmp.obj = {
    size_value: i.particles.size.value,
    size_anim_speed: i.particles.size.anim.speed,
    move_speed: i.particles.move.speed,
    line_linked_distance: i.particles.line_linked.distance,
    line_linked_width: i.particles.line_linked.width,
    mode_grab_distance: i.interactivity.modes.grab.distance,
    mode_bubble_distance: i.interactivity.modes.bubble.distance,
    mode_bubble_size: i.interactivity.modes.bubble.size,
    mode_repulse_distance: i.interactivity.modes.repulse.distance
  }, i.fn.retinaInit = function () {
    i.retina_detect && window.devicePixelRatio > 1 ? (i.canvas.pxratio = window.devicePixelRatio, i.tmp.retina = !0) : (i.canvas.pxratio = 1, i.tmp.retina = !1), i.canvas.w = i.canvas.el.offsetWidth * i.canvas.pxratio, i.canvas.h = i.canvas.el.offsetHeight * i.canvas.pxratio, i.particles.size.value = i.tmp.obj.size_value * i.canvas.pxratio, i.particles.size.anim.speed = i.tmp.obj.size_anim_speed * i.canvas.pxratio, i.particles.move.speed = i.tmp.obj.move_speed * i.canvas.pxratio, i.particles.line_linked.distance = i.tmp.obj.line_linked_distance * i.canvas.pxratio, i.interactivity.modes.grab.distance = i.tmp.obj.mode_grab_distance * i.canvas.pxratio, i.interactivity.modes.bubble.distance = i.tmp.obj.mode_bubble_distance * i.canvas.pxratio, i.particles.line_linked.width = i.tmp.obj.line_linked_width * i.canvas.pxratio, i.interactivity.modes.bubble.size = i.tmp.obj.mode_bubble_size * i.canvas.pxratio, i.interactivity.modes.repulse.distance = i.tmp.obj.mode_repulse_distance * i.canvas.pxratio
  }, i.fn.canvasInit = function () {
    i.canvas.ctx = i.canvas.el.getContext("2d")
  }, i.fn.canvasSize = function () {
    i.canvas.el.width = i.canvas.w, i.canvas.el.height = i.canvas.h, i && i.interactivity.events.resize && window.addEventListener("resize", function () {
      i.canvas.w = i.canvas.el.offsetWidth, i.canvas.h = i.canvas.el.offsetHeight, i.tmp.retina && (i.canvas.w *= i.canvas.pxratio, i.canvas.h *= i.canvas.pxratio), i.canvas.el.width = i.canvas.w, i.canvas.el.height = i.canvas.h, i.particles.move.enable || (i.fn.particlesEmpty(), i.fn.particlesCreate(), i.fn.particlesDraw(), i.fn.vendors.densityAutoParticles()), i.fn.vendors.densityAutoParticles()
    })
  }, i.fn.canvasPaint = function () {
    i.canvas.ctx.fillRect(0, 0, i.canvas.w, i.canvas.h)
  }, i.fn.canvasClear = function () {
    i.canvas.ctx.clearRect(0, 0, i.canvas.w, i.canvas.h)
  }, i.fn.particle = function (e, a, t) {
    if (this.radius = (i.particles.size.random ? Math.random() : 1) * i.particles.size.value, i.particles.size.anim.enable && (this.size_status = !1, this.vs = i.particles.size.anim.speed / 100, i.particles.size.anim.sync || (this.vs = this.vs * Math.random())), this.x = t ? t.x : Math.random() * i.canvas.w, this.y = t ? t.y : Math.random() * i.canvas.h, this.x > i.canvas.w - 2 * this.radius ? this.x = this.x - this.radius : this.x < 2 * this.radius && (this.x = this.x + this.radius), this.y > i.canvas.h - 2 * this.radius ? this.y = this.y - this.radius : this.y < 2 * this.radius && (this.y = this.y + this.radius), i.particles.move.bounce && i.fn.vendors.checkOverlap(this, t), this.color = {}, "object" == typeof e.value) if (e.value instanceof Array) {
      var s = e.value[Math.floor(Math.random() * i.particles.color.value.length)];
      this.color.rgb = hexToRgb(s)
    } else void 0 != e.value.r && void 0 != e.value.g && void 0 != e.value.b && (this.color.rgb = {
      r: e.value.r,
      g: e.value.g,
      b: e.value.b
    }), void 0 != e.value.h && void 0 != e.value.s && void 0 != e.value.l && (this.color.hsl = {
      h: e.value.h,
      s: e.value.s,
      l: e.value.l
    }); else "random" == e.value ? this.color.rgb = {
      r: Math.floor(256 * Math.random()) + 0,
      g: Math.floor(256 * Math.random()) + 0,
      b: Math.floor(256 * Math.random()) + 0
    } : "string" == typeof e.value && (this.color = e, this.color.rgb = hexToRgb(this.color.value));
    this.opacity = (i.particles.opacity.random ? Math.random() : 1) * i.particles.opacity.value, i.particles.opacity.anim.enable && (this.opacity_status = !1, this.vo = i.particles.opacity.anim.speed / 100, i.particles.opacity.anim.sync || (this.vo = this.vo * Math.random()));
    var n = {};
    switch (i.particles.move.direction) {
      case"top":
        n = {x: 0, y: -1};
        break;
      case"top-right":
        n = {x: .5, y: -.5};
        break;
      case"right":
        n = {x: 1, y: -0};
        break;
      case"bottom-right":
        n = {x: .5, y: .5};
        break;
      case"bottom":
        n = {x: 0, y: 1};
        break;
      case"bottom-left":
        n = {x: -.5, y: 1};
        break;
      case"left":
        n = {x: -1, y: 0};
        break;
      case"top-left":
        n = {x: -.5, y: -.5};
        break;
      default:
        n = {x: 0, y: 0}
    }
    i.particles.move.straight ? (this.vx = n.x, this.vy = n.y, i.particles.move.random && (this.vx = this.vx * Math.random(), this.vy = this.vy * Math.random())) : (this.vx = n.x + Math.random() - .5, this.vy = n.y + Math.random() - .5), this.vx_i = this.vx, this.vy_i = this.vy;
    var r = i.particles.shape.type;
    if ("object" == typeof r) {
      if (r instanceof Array) {
        var c = r[Math.floor(Math.random() * r.length)];
        this.shape = c
      }
    } else this.shape = r;
    if ("image" == this.shape) {
      var o = i.particles.shape;
      this.img = {
        src: o.image.src,
        ratio: o.image.width / o.image.height
      }, this.img.ratio || (this.img.ratio = 1), "svg" == i.tmp.img_type && void 0 != i.tmp.source_svg && (i.fn.vendors.createSvgImg(this), i.tmp.pushing && (this.img.loaded = !1))
    }
  }, i.fn.particle.prototype.draw = function () {
    function e() {
      i.canvas.ctx.drawImage(r, a.x - t, a.y - t, 2 * t, 2 * t / a.img.ratio)
    }

    var a = this;
    if (void 0 != a.radius_bubble) var t = a.radius_bubble; else var t = a.radius;
    if (void 0 != a.opacity_bubble) var s = a.opacity_bubble; else var s = a.opacity;
    if (a.color.rgb) var n = "rgba(" + a.color.rgb.r + "," + a.color.rgb.g + "," + a.color.rgb.b + "," + s + ")"; else var n = "hsla(" + a.color.hsl.h + "," + a.color.hsl.s + "%," + a.color.hsl.l + "%," + s + ")";
    switch (i.canvas.ctx.fillStyle = n, i.canvas.ctx.beginPath(), a.shape) {
      case"circle":
        i.canvas.ctx.arc(a.x, a.y, t, 0, 2 * Math.PI, !1);
        break;
      case"edge":
        i.canvas.ctx.rect(a.x - t, a.y - t, 2 * t, 2 * t);
        break;
      case"triangle":
        i.fn.vendors.drawShape(i.canvas.ctx, a.x - t, a.y + t / 1.66, 2 * t, 3, 2);
        break;
      case"polygon":
        i.fn.vendors.drawShape(i.canvas.ctx, a.x - t / (i.particles.shape.polygon.nb_sides / 3.5), a.y - t / .76, 2.66 * t / (i.particles.shape.polygon.nb_sides / 3), i.particles.shape.polygon.nb_sides, 1);
        break;
      case"star":
        i.fn.vendors.drawShape(i.canvas.ctx, a.x - 2 * t / (i.particles.shape.polygon.nb_sides / 4), a.y - t / 1.52, 2 * t * 2.66 / (i.particles.shape.polygon.nb_sides / 3), i.particles.shape.polygon.nb_sides, 2);
        break;
      case"image":
        if ("svg" == i.tmp.img_type) var r = a.img.obj; else var r = i.tmp.img_obj;
        r && e()
    }
    i.canvas.ctx.closePath(), i.particles.shape.stroke.width > 0 && (i.canvas.ctx.strokeStyle = i.particles.shape.stroke.color, i.canvas.ctx.lineWidth = i.particles.shape.stroke.width, i.canvas.ctx.stroke()), i.canvas.ctx.fill()
  }, i.fn.particlesCreate = function () {
    for (var e = 0; e < i.particles.number.value; e++) i.particles.array.push(new i.fn.particle(i.particles.color, i.particles.opacity.value))
  }, i.fn.particlesUpdate = function () {
    for (var e = 0; e < i.particles.array.length; e++) {
      var a = i.particles.array[e];
      if (i.particles.move.enable) {
        var t = i.particles.move.speed / 2;
        a.x += a.vx * t, a.y += a.vy * t
      }
      if (i.particles.opacity.anim.enable && (1 == a.opacity_status ? (a.opacity >= i.particles.opacity.value && (a.opacity_status = !1), a.opacity += a.vo) : (a.opacity <= i.particles.opacity.anim.opacity_min && (a.opacity_status = !0), a.opacity -= a.vo), a.opacity < 0 && (a.opacity = 0)), i.particles.size.anim.enable && (1 == a.size_status ? (a.radius >= i.particles.size.value && (a.size_status = !1), a.radius += a.vs) : (a.radius <= i.particles.size.anim.size_min && (a.size_status = !0), a.radius -= a.vs), a.radius < 0 && (a.radius = 0)), "bounce" == i.particles.move.out_mode) var s = {
        x_left: a.radius,
        x_right: i.canvas.w,
        y_top: a.radius,
        y_bottom: i.canvas.h
      }; else var s = {
        x_left: -a.radius,
        x_right: i.canvas.w + a.radius,
        y_top: -a.radius,
        y_bottom: i.canvas.h + a.radius
      };
      switch (a.x - a.radius > i.canvas.w ? (a.x = s.x_left, a.y = Math.random() * i.canvas.h) : a.x + a.radius < 0 && (a.x = s.x_right, a.y = Math.random() * i.canvas.h), a.y - a.radius > i.canvas.h ? (a.y = s.y_top, a.x = Math.random() * i.canvas.w) : a.y + a.radius < 0 && (a.y = s.y_bottom, a.x = Math.random() * i.canvas.w), i.particles.move.out_mode) {
        case"bounce":
          a.x + a.radius > i.canvas.w ? a.vx = -a.vx : a.x - a.radius < 0 && (a.vx = -a.vx), a.y + a.radius > i.canvas.h ? a.vy = -a.vy : a.y - a.radius < 0 && (a.vy = -a.vy)
      }
      if (isInArray("grab", i.interactivity.events.onhover.mode) && i.fn.modes.grabParticle(a), (isInArray("bubble", i.interactivity.events.onhover.mode) || isInArray("bubble", i.interactivity.events.onclick.mode)) && i.fn.modes.bubbleParticle(a), (isInArray("repulse", i.interactivity.events.onhover.mode) || isInArray("repulse", i.interactivity.events.onclick.mode)) && i.fn.modes.repulseParticle(a), i.particles.line_linked.enable || i.particles.move.attract.enable) for (var n = e + 1; n < i.particles.array.length; n++) {
        var r = i.particles.array[n];
        i.particles.line_linked.enable && i.fn.interact.linkParticles(a, r), i.particles.move.attract.enable && i.fn.interact.attractParticles(a, r), i.particles.move.bounce && i.fn.interact.bounceParticles(a, r)
      }
    }
  }, i.fn.particlesDraw = function () {
    i.canvas.ctx.clearRect(0, 0, i.canvas.w, i.canvas.h), i.fn.particlesUpdate();
    for (var e = 0; e < i.particles.array.length; e++) {
      var a = i.particles.array[e];
      a.draw()
    }
  }, i.fn.particlesEmpty = function () {
    i.particles.array = []
  }, i.fn.particlesRefresh = function () {
    cancelRequestAnimFrame(i.fn.checkAnimFrame), cancelRequestAnimFrame(i.fn.drawAnimFrame), i.tmp.source_svg = void 0, i.tmp.img_obj = void 0, i.tmp.count_svg = 0, i.fn.particlesEmpty(), i.fn.canvasClear(), i.fn.vendors.start()
  }, i.fn.interact.linkParticles = function (e, a) {
    var t = e.x - a.x, s = e.y - a.y, n = Math.sqrt(t * t + s * s);
    if (n <= i.particles.line_linked.distance) {
      var r = i.particles.line_linked.opacity - n / (1 / i.particles.line_linked.opacity) / i.particles.line_linked.distance;
      if (r > 0) {
        var c = i.particles.line_linked.color_rgb_line;
        i.canvas.ctx.strokeStyle = "rgba(" + c.r + "," + c.g + "," + c.b + "," + r + ")", i.canvas.ctx.lineWidth = i.particles.line_linked.width, i.canvas.ctx.beginPath(), i.canvas.ctx.moveTo(e.x, e.y), i.canvas.ctx.lineTo(a.x, a.y), i.canvas.ctx.stroke(), i.canvas.ctx.closePath()
      }
    }
  }, i.fn.interact.attractParticles = function (e, a) {
    var t = e.x - a.x, s = e.y - a.y, n = Math.sqrt(t * t + s * s);
    if (n <= i.particles.line_linked.distance) {
      var r = t / (1e3 * i.particles.move.attract.rotateX), c = s / (1e3 * i.particles.move.attract.rotateY);
      e.vx -= r, e.vy -= c, a.vx += r, a.vy += c
    }
  }, i.fn.interact.bounceParticles = function (e, a) {
    var t = e.x - a.x, i = e.y - a.y, s = Math.sqrt(t * t + i * i), n = e.radius + a.radius;
    n >= s && (e.vx = -e.vx, e.vy = -e.vy, a.vx = -a.vx, a.vy = -a.vy)
  }, i.fn.modes.pushParticles = function (e, a) {
    i.tmp.pushing = !0;
    for (var t = 0; e > t; t++) i.particles.array.push(new i.fn.particle(i.particles.color, i.particles.opacity.value, {
      x: a ? a.pos_x : Math.random() * i.canvas.w,
      y: a ? a.pos_y : Math.random() * i.canvas.h
    })), t == e - 1 && (i.particles.move.enable || i.fn.particlesDraw(), i.tmp.pushing = !1)
  }, i.fn.modes.removeParticles = function (e) {
    i.particles.array.splice(0, e), i.particles.move.enable || i.fn.particlesDraw()
  }, i.fn.modes.bubbleParticle = function (e) {
    function a() {
      e.opacity_bubble = e.opacity, e.radius_bubble = e.radius
    }

    function t(a, t, s, n, c) {
      if (a != t) if (i.tmp.bubble_duration_end) {
        if (void 0 != s) {
          var o = n - p * (n - a) / i.interactivity.modes.bubble.duration, l = a - o;
          d = a + l, "size" == c && (e.radius_bubble = d), "opacity" == c && (e.opacity_bubble = d)
        }
      } else if (r <= i.interactivity.modes.bubble.distance) {
        if (void 0 != s) var v = s; else var v = n;
        if (v != a) {
          var d = n - p * (n - a) / i.interactivity.modes.bubble.duration;
          "size" == c && (e.radius_bubble = d), "opacity" == c && (e.opacity_bubble = d)
        }
      } else "size" == c && (e.radius_bubble = void 0), "opacity" == c && (e.opacity_bubble = void 0)
    }

    if (i.interactivity.events.onhover.enable && isInArray("bubble", i.interactivity.events.onhover.mode)) {
      var s = e.x - i.interactivity.mouse.pos_x, n = e.y - i.interactivity.mouse.pos_y, r = Math.sqrt(s * s + n * n),
        c = 1 - r / i.interactivity.modes.bubble.distance;
      if (r <= i.interactivity.modes.bubble.distance) {
        if (c >= 0 && "mousemove" == i.interactivity.status) {
          if (i.interactivity.modes.bubble.size != i.particles.size.value) if (i.interactivity.modes.bubble.size > i.particles.size.value) {
            var o = e.radius + i.interactivity.modes.bubble.size * c;
            o >= 0 && (e.radius_bubble = o)
          } else {
            var l = e.radius - i.interactivity.modes.bubble.size, o = e.radius - l * c;
            o > 0 ? e.radius_bubble = o : e.radius_bubble = 0
          }
          if (i.interactivity.modes.bubble.opacity != i.particles.opacity.value) if (i.interactivity.modes.bubble.opacity > i.particles.opacity.value) {
            var v = i.interactivity.modes.bubble.opacity * c;
            v > e.opacity && v <= i.interactivity.modes.bubble.opacity && (e.opacity_bubble = v)
          } else {
            var v = e.opacity - (i.particles.opacity.value - i.interactivity.modes.bubble.opacity) * c;
            v < e.opacity && v >= i.interactivity.modes.bubble.opacity && (e.opacity_bubble = v)
          }
        }
      } else a();
      "mouseleave" == i.interactivity.status && a()
    } else if (i.interactivity.events.onclick.enable && isInArray("bubble", i.interactivity.events.onclick.mode)) {
      if (i.tmp.bubble_clicking) {
        var s = e.x - i.interactivity.mouse.click_pos_x, n = e.y - i.interactivity.mouse.click_pos_y,
          r = Math.sqrt(s * s + n * n), p = ((new Date).getTime() - i.interactivity.mouse.click_time) / 1e3;
        p > i.interactivity.modes.bubble.duration && (i.tmp.bubble_duration_end = !0), p > 2 * i.interactivity.modes.bubble.duration && (i.tmp.bubble_clicking = !1, i.tmp.bubble_duration_end = !1)
      }
      i.tmp.bubble_clicking && (t(i.interactivity.modes.bubble.size, i.particles.size.value, e.radius_bubble, e.radius, "size"), t(i.interactivity.modes.bubble.opacity, i.particles.opacity.value, e.opacity_bubble, e.opacity, "opacity"))
    }
  }, i.fn.modes.repulseParticle = function (e) {
    function a() {
      var a = Math.atan2(d, p);
      if (e.vx = u * Math.cos(a), e.vy = u * Math.sin(a), "bounce" == i.particles.move.out_mode) {
        var t = {x: e.x + e.vx, y: e.y + e.vy};
        t.x + e.radius > i.canvas.w ? e.vx = -e.vx : t.x - e.radius < 0 && (e.vx = -e.vx), t.y + e.radius > i.canvas.h ? e.vy = -e.vy : t.y - e.radius < 0 && (e.vy = -e.vy)
      }
    }

    if (i.interactivity.events.onhover.enable && isInArray("repulse", i.interactivity.events.onhover.mode) && "mousemove" == i.interactivity.status) {
      var t = e.x - i.interactivity.mouse.pos_x, s = e.y - i.interactivity.mouse.pos_y, n = Math.sqrt(t * t + s * s),
        r = {x: t / n, y: s / n}, c = i.interactivity.modes.repulse.distance, o = 100,
        l = clamp(1 / c * (-1 * Math.pow(n / c, 2) + 1) * c * o, 0, 50), v = {x: e.x + r.x * l, y: e.y + r.y * l};
      "bounce" == i.particles.move.out_mode ? (v.x - e.radius > 0 && v.x + e.radius < i.canvas.w && (e.x = v.x), v.y - e.radius > 0 && v.y + e.radius < i.canvas.h && (e.y = v.y)) : (e.x = v.x, e.y = v.y)
    } else if (i.interactivity.events.onclick.enable && isInArray("repulse", i.interactivity.events.onclick.mode)) if (i.tmp.repulse_finish || (i.tmp.repulse_count++, i.tmp.repulse_count == i.particles.array.length && (i.tmp.repulse_finish = !0)), i.tmp.repulse_clicking) {
      var c = Math.pow(i.interactivity.modes.repulse.distance / 6, 3), p = i.interactivity.mouse.click_pos_x - e.x,
        d = i.interactivity.mouse.click_pos_y - e.y, m = p * p + d * d, u = -c / m * 1;
      c >= m && a()
    } else 0 == i.tmp.repulse_clicking && (e.vx = e.vx_i, e.vy = e.vy_i)
  }, i.fn.modes.grabParticle = function (e) {
    if (i.interactivity.events.onhover.enable && "mousemove" == i.interactivity.status) {
      var a = e.x - i.interactivity.mouse.pos_x, t = e.y - i.interactivity.mouse.pos_y, s = Math.sqrt(a * a + t * t);
      if (s <= i.interactivity.modes.grab.distance) {
        var n = i.interactivity.modes.grab.line_linked.opacity - s / (1 / i.interactivity.modes.grab.line_linked.opacity) / i.interactivity.modes.grab.distance;
        if (n > 0) {
          var r = i.particles.line_linked.color_rgb_line;
          i.canvas.ctx.strokeStyle = "rgba(" + r.r + "," + r.g + "," + r.b + "," + n + ")", i.canvas.ctx.lineWidth = i.particles.line_linked.width, i.canvas.ctx.beginPath(), i.canvas.ctx.moveTo(e.x, e.y), i.canvas.ctx.lineTo(i.interactivity.mouse.pos_x, i.interactivity.mouse.pos_y), i.canvas.ctx.stroke(), i.canvas.ctx.closePath()
        }
      }
    }
  }, i.fn.vendors.eventsListeners = function () {
    "window" == i.interactivity.detect_on ? i.interactivity.el = window : i.interactivity.el = i.canvas.el, (i.interactivity.events.onhover.enable || i.interactivity.events.onclick.enable) && (i.interactivity.el.addEventListener("mousemove", function (e) {
      if (i.interactivity.el == window) var a = e.clientX, t = e.clientY; else var a = e.offsetX || e.clientX,
        t = e.offsetY || e.clientY;
      i.interactivity.mouse.pos_x = a, i.interactivity.mouse.pos_y = t, i.tmp.retina && (i.interactivity.mouse.pos_x *= i.canvas.pxratio, i.interactivity.mouse.pos_y *= i.canvas.pxratio), i.interactivity.status = "mousemove"
    }), i.interactivity.el.addEventListener("mouseleave", function (e) {
      i.interactivity.mouse.pos_x = null, i.interactivity.mouse.pos_y = null, i.interactivity.status = "mouseleave"
    })), i.interactivity.events.onclick.enable && i.interactivity.el.addEventListener("click", function () {
      if (i.interactivity.mouse.click_pos_x = i.interactivity.mouse.pos_x, i.interactivity.mouse.click_pos_y = i.interactivity.mouse.pos_y, i.interactivity.mouse.click_time = (new Date).getTime(), i.interactivity.events.onclick.enable) switch (i.interactivity.events.onclick.mode) {
        case"push":
          i.particles.move.enable ? i.fn.modes.pushParticles(i.interactivity.modes.push.particles_nb, i.interactivity.mouse) : 1 == i.interactivity.modes.push.particles_nb ? i.fn.modes.pushParticles(i.interactivity.modes.push.particles_nb, i.interactivity.mouse) : i.interactivity.modes.push.particles_nb > 1 && i.fn.modes.pushParticles(i.interactivity.modes.push.particles_nb);
          break;
        case"remove":
          i.fn.modes.removeParticles(i.interactivity.modes.remove.particles_nb);
          break;
        case"bubble":
          i.tmp.bubble_clicking = !0;
          break;
        case"repulse":
          i.tmp.repulse_clicking = !0, i.tmp.repulse_count = 0, i.tmp.repulse_finish = !1, setTimeout(function () {
            i.tmp.repulse_clicking = !1
          }, 1e3 * i.interactivity.modes.repulse.duration)
      }
    })
  }, i.fn.vendors.densityAutoParticles = function () {
    if (i.particles.number.density.enable) {
      var e = i.canvas.el.width * i.canvas.el.height / 1e3;
      i.tmp.retina && (e /= 2 * i.canvas.pxratio);
      var a = e * i.particles.number.value / i.particles.number.density.value_area, t = i.particles.array.length - a;
      0 > t ? i.fn.modes.pushParticles(Math.abs(t)) : i.fn.modes.removeParticles(t)
    }
  }, i.fn.vendors.checkOverlap = function (e, a) {
    for (var t = 0; t < i.particles.array.length; t++) {
      var s = i.particles.array[t], n = e.x - s.x, r = e.y - s.y, c = Math.sqrt(n * n + r * r);
      c <= e.radius + s.radius && (e.x = a ? a.x : Math.random() * i.canvas.w, e.y = a ? a.y : Math.random() * i.canvas.h, i.fn.vendors.checkOverlap(e))
    }
  }, i.fn.vendors.createSvgImg = function (e) {
    var a = i.tmp.source_svg, t = /#([0-9A-F]{3,6})/gi, s = a.replace(t, function (a, t, i, s) {
        if (e.color.rgb) var n = "rgba(" + e.color.rgb.r + "," + e.color.rgb.g + "," + e.color.rgb.b + "," + e.opacity + ")"; else var n = "hsla(" + e.color.hsl.h + "," + e.color.hsl.s + "%," + e.color.hsl.l + "%," + e.opacity + ")";
        return n
      }), n = new Blob([s], {type: "image/svg+xml;charset=utf-8"}), r = window.URL || window.webkitURL || window,
      c = r.createObjectURL(n), o = new Image;
    o.addEventListener("load", function () {
      e.img.obj = o, e.img.loaded = !0, r.revokeObjectURL(c), i.tmp.count_svg++
    }), o.src = c
  }, i.fn.vendors.destroypJS = function () {
    cancelAnimationFrame(i.fn.drawAnimFrame), t.remove(), pJSDom = null
  }, i.fn.vendors.drawShape = function (e, a, t, i, s, n) {
    var r = s * n, c = s / n, o = 180 * (c - 2) / c, l = Math.PI - Math.PI * o / 180;
    e.save(), e.beginPath(), e.translate(a, t), e.moveTo(0, 0);
    for (var v = 0; r > v; v++) e.lineTo(i, 0), e.translate(i, 0), e.rotate(l);
    e.fill(), e.restore()
  }, i.fn.vendors.exportImg = function () {
    window.open(i.canvas.el.toDataURL("image/png"), "_blank")
  }, i.fn.vendors.loadImg = function (e) {
    if (i.tmp.img_error = void 0, "" != i.particles.shape.image.src) if ("svg" == e) {
      var a = new XMLHttpRequest;
      a.open("GET", i.particles.shape.image.src), a.onreadystatechange = function (e) {
        4 == a.readyState && (200 == a.status ? (i.tmp.source_svg = e.currentTarget.response, i.fn.vendors.checkBeforeDraw()) : (console.log("Error pJS - Image not found"), i.tmp.img_error = !0))
      }, a.send()
    } else {
      var t = new Image;
      t.addEventListener("load", function () {
        i.tmp.img_obj = t, i.fn.vendors.checkBeforeDraw()
      }), t.src = i.particles.shape.image.src
    } else console.log("Error pJS - No image.src"), i.tmp.img_error = !0
  }, i.fn.vendors.draw = function () {
    "image" == i.particles.shape.type ? "svg" == i.tmp.img_type ? i.tmp.count_svg >= i.particles.number.value ? (i.fn.particlesDraw(), i.particles.move.enable ? i.fn.drawAnimFrame = requestAnimFrame(i.fn.vendors.draw) : cancelRequestAnimFrame(i.fn.drawAnimFrame)) : i.tmp.img_error || (i.fn.drawAnimFrame = requestAnimFrame(i.fn.vendors.draw)) : void 0 != i.tmp.img_obj ? (i.fn.particlesDraw(), i.particles.move.enable ? i.fn.drawAnimFrame = requestAnimFrame(i.fn.vendors.draw) : cancelRequestAnimFrame(i.fn.drawAnimFrame)) : i.tmp.img_error || (i.fn.drawAnimFrame = requestAnimFrame(i.fn.vendors.draw)) : (i.fn.particlesDraw(), i.particles.move.enable ? i.fn.drawAnimFrame = requestAnimFrame(i.fn.vendors.draw) : cancelRequestAnimFrame(i.fn.drawAnimFrame))
  }, i.fn.vendors.checkBeforeDraw = function () {
    "image" == i.particles.shape.type ? "svg" == i.tmp.img_type && void 0 == i.tmp.source_svg ? i.tmp.checkAnimFrame = requestAnimFrame(check) : (cancelRequestAnimFrame(i.tmp.checkAnimFrame), i.tmp.img_error || (i.fn.vendors.init(), i.fn.vendors.draw())) : (i.fn.vendors.init(), i.fn.vendors.draw())
  }, i.fn.vendors.init = function () {
    i.fn.retinaInit(), i.fn.canvasInit(), i.fn.canvasSize(), i.fn.canvasPaint(), i.fn.particlesCreate(), i.fn.vendors.densityAutoParticles(), i.particles.line_linked.color_rgb_line = hexToRgb(i.particles.line_linked.color)
  }, i.fn.vendors.start = function () {
    isInArray("image", i.particles.shape.type) ? (i.tmp.img_type = i.particles.shape.image.src.substr(i.particles.shape.image.src.length - 3), i.fn.vendors.loadImg(i.tmp.img_type)) : i.fn.vendors.checkBeforeDraw()
  }, i.fn.vendors.eventsListeners(), i.fn.vendors.start()
};
Object.deepExtend = function (e, a) {
  for (var t in a) a[t] && a[t].constructor && a[t].constructor === Object ? (e[t] = e[t] || {}, arguments.callee(e[t], a[t])) : e[t] = a[t];
  return e
}, window.requestAnimFrame = function () {
  return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function (e) {
    window.setTimeout(e, 1e3 / 60)
  }
}(), window.cancelRequestAnimFrame = function () {
  return window.cancelAnimationFrame || window.webkitCancelRequestAnimationFrame || window.mozCancelRequestAnimationFrame || window.oCancelRequestAnimationFrame || window.msCancelRequestAnimationFrame || clearTimeout
}(), window.pJSDom = [], window.particlesJS = function (e, a) {
  "string" != typeof e && (a = e, e = "particles-js"), e || (e = "particles-js");
  var t = document.getElementById(e),
    s = t.getElementsByClassName("particles-js-canvas-el");
  if (s.length) for (; s.length > 0;) t.removeChild(s[0]);
  var n = document.createElement("canvas");
  n.className = i, n.style.width = "100%", n.style.height = "100%";
  var r = document.getElementById(e).appendChild(n);
  null != r && pJSDom.push(new pJS(e, a))
}, window.particlesJS.load = function (e, a, t) {
  var i = new XMLHttpRequest;
  i.open("GET", a), i.onreadystatechange = function (a) {
    if (4 == i.readyState) if (200 == i.status) {
      var s = JSON.parse(a.currentTarget.response);
      window.particlesJS(e, s), t && t()
    } else console.log("Error pJS - XMLHttpRequest status: " + i.status), console.log("Error pJS - File config not found")
  }, i.send()
};

/*====================================
    Ajax Mail js
======================================*/
$(function () {

  // Get the form.
  var form = $('#contact-form');

  // Get the messages div.
  var formMessages = $('.form-messege');

  // Set up an event listener for the contact form.
  $(form).submit(function (e) {
    // Stop the browser from submitting the form.
    e.preventDefault();

    // Serialize the form data.
    var formData = $(form).serialize();

    // Submit the form using AJAX.
    $.ajax({
      type: 'POST',
      url: $(form).attr('action'),
      data: formData
    })
      .done(function (response) {
        // Make sure that the formMessages div has the 'success' class.
        $(formMessages).removeClass('error');
        $(formMessages).addClass('success');

        // Set the message text.
        $(formMessages).text(response);

        // Clear the form.
        $('#contact-form input,#contact-form textarea').val('');
      })
      .fail(function (data) {
        // Make sure that the formMessages div has the 'error' class.
        $(formMessages).removeClass('success');
        $(formMessages).addClass('error');

        // Set the message text.
        if (data.responseText !== '') {
          $(formMessages).text(data.responseText);
        } else {
          $(formMessages).text('Oops! An error occured and your message could not be sent.');
        }
      });
  });

});
