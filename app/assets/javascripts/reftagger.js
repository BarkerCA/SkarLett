var refTagger = {
  settings: {
    bibleVersion: "ESV",      
    roundCorners: true,     
    customStyle : {
      heading: {
        color : "#c61315"
      },
      body   : {
        color : "#265859",
        moreLink : {
          color: "#c61315"
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