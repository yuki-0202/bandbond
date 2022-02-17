function map (){
  const prefectures = document.querySelectorAll(".prefecture");
  prefectures.forEach(function(pref) {
    pref.addEventListener('click', function() {
      document.getElementById("test-prefecture").value = pref.id;
    });
  });
};

window.addEventListener('load', map);
