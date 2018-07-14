$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/lessons/" + id + "/info" + ".json", function(data) {
      let lessonInfo = new Lesson(data.genre, data.level, data.date, data.time)
      let formattedLessonInfo = lessonInfo.formatLessonInfo();
      console.log(data.genre)
      $("#info-" + id).append(formattedLessonInfo);
    });
  });

function Lesson(genre, level, date, time) {
  this.genre = genre;
  this.level = level;
  this.date = date;
  this.time = time;
}

Lesson.prototype.formatLessonInfo = function(){
  let lessonHtml = '';
  lessonHtml += `<li>${this.genre}</li>`
  lessonHtml += `<li>${this.level}</li>`
  lessonHtml += `<li>${this.date}</li>`
  lessonHtml += `<li>${this.time}</li>`
  return lessonHtml;
  }
});
