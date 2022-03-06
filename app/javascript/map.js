const { end } = require("@popperjs/core");

function map (){
  const prefectures = document.querySelectorAll(".prefecture");
  prefectures.forEach(function(pref) {
    pref.addEventListener('click', function() {
      if (document.getElementById("area-select") != null) {
        document.getElementById("area-select").value = pref.id;
      } else {
        document.getElementById("search-area-select").value = pref.id;
        document.getElementById("search-submit").click();
      }
    });
  });
};

window.addEventListener('load', map);

