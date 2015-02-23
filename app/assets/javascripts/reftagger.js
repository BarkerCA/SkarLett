var refTagger = {
  settings: {
    bibleVersion: "ESV",      
    roundCorners: true,     
    customStyle : {
      heading: {
        color : "#3AB54A"
      },
      body   : {
        color : "#595758",
        moreLink : {
          color: "#3AB54A"
        }
      }
    }
  }
};
(function(d, t) {
  var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
  g.src = "//api.reftagger.com/v2/RefTagger.js";
  s.parentNode.insertBefore(g, s);
}(document, "script"));