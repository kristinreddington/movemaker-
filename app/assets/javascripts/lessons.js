var url = "lessons/"
$(function () {
  $(".js-load").on('click', function() {
    $.get("/lessons" + ".json", function(array) {
      array.forEach(function(object) {
        let newLesson = new Lesson(object.id, object.name, object.genre, object.level, object.date, object.time, object.description);
        let formattedLesson = newLesson.formatLesson();

      });
    })
  })

  $('.js-sort').click(function(e){
    e.preventDefault()
    var grabDiv = $("h4").closest("div")
    var switching = true;
    while (switching) {
      switching = false;
      var l = $("p");
      for (i = 0; i < (l.length - 1); i++) {
        var shouldSwitch = false;

      if (l[i].innerHTML.toLowerCase() > l[i + 1].innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      l[i].parentNode.insertBefore(l[i + 1], l[i]);
      console.log(l[i].parentNode)
      switching = true;
    }
  }
})

  function Lesson(id, name, genre, level, date, time, description) {
    this.id = id;
    this.name = name;
    this.genre = genre;
    this.level = level;
    this.date = date;
    this.time = time;
    this.description = description;
    this.url = url + `${this.id}`

  }

  prettyDate = function(dateString) {
    var day, formatted, jsDate, month;
    jsDate = new Date(dateString);
    day = jsDate.getMonth() + 1 < 10 ? "0" + (jsDate.getMonth() + 1) : "" + (jsDate.getMonth() + 1);
    month = jsDate.getDate() < 10 ? "0" + (jsDate.getDate()) : "" + (jsDate.getDate());
    formatted = "" + day + "/" + month + "/" + (jsDate.getFullYear());
    return formatted;
  };

  Lesson.prototype.formatLesson = function() {
    let lessonNameContainer = (this.name);
    var text = "more info";
    let textLink = text.link(`${this.url}`);
    let newDate = prettyDate(this.date);
    let formatDate = $("<p></p>").text(newDate);
    let lessonHtml = '';
    lessonHtml += `<p> ${lessonNameContainer} | ${newDate} | ${textLink}</p>`
    $(".pre-scrollable").append(lessonHtml)
  };

});
