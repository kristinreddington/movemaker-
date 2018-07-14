$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/lessons/" + id + "/info" + ".json", function(data) {
      console.log(data);
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
  let levelLetter = this.level;
  let capitalizeLevel = levelLetter.charAt(0).toUpperCase() + levelLetter.slice(1)
  let formatTime = this.time.slice(12,16)
  let formatDate = this.date.slice(5).replace("-", "|")
  lessonHtml += `${capitalizeLevel} ${this.genre} on ${formatDate} at ${formatTime}`
  return lessonHtml;
  }
});
