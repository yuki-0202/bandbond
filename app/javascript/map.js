const { end } = require("@popperjs/core");

function map (){
  const prefectures = document.querySelectorAll(".prefecture");
  prefectures.forEach(function(pref) {
    pref.addEventListener('click', function() {
      if (document.getElementById("test-prefecture") != null) {
        document.getElementById("test-prefecture").value = pref.id;
      } else {
// 追加実装（falseの場合、クリックした地域で絞り込みされたブッキング一覧が表示される）
      }
    });
  });
};

window.addEventListener('load', map);
