vimfx.listen('getSelection', (willRemove, callback) => {
  let selection = content.getSelection();
  let s = selection.toString();
  if (willRemove) {
    selection.removeAllRanges();
  }
  callback(s);
});

// not working...
vimfx.listen('vimfxSlideShare', ({flag}, callback) => {
  let doc = content.document;
  if (doc.location.host !== 'www.slideshare.net') {
    return null;
  }
  function SlidePlayer(leftPoint, rightPoint, fullScreenPoint) {
    this.msg = "hoge";
    this.show = function() {
      return "hello";
    };
    this.next = function() { rightPoint.click(); };
    this.prev = function() { leftPoint.click(); };
    this.fullscreen = function() { fullScreenPoint.click(); };
  };
  let leftPoint = doc.getElementsByClassName('leftpoint')[0];
  let rightPoint = doc.getElementsByClassName('rightpoint')[0];
  let fullScreenPoint = doc.getElementById('#btnFullScreen');
  let player = new SlidePlayer(leftPoint, rightPoint, fullScreenPoint);

  callback(player);
});

