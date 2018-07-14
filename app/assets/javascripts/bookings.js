$(function () {
  $(".js-next").on("click", function() {
    var userID = parseInt($(".js-next").attr("data-userid"));
    var nextID = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/users/" + userID + "/bookings/" + nextID + ".json", function(data) {
      $(".noteSection").empty()
      var notes = data.notes
      notes.forEach(formatNotes);
      var formatTime = (data["lesson"]["time"]).slice(12,16)
      var formatDate = (data["lesson"]["date"]).slice(5).replace("-", "|")
      console.log(formatDate)

      $(".lessonName").text(data["lesson"]["name"]);
      $(".lessonTime").text(`${formatTime}`);
      $(".lessonDate").text(`${formatDate}`);
      $(".js-next").attr("data-id", data["id"]);
    });
  });

  function formatNotes(note){
    let bookingNotesHtml = '';
    if (note.text != "") {
    bookingNotesHtml += '<ul>'
    bookingNotesHtml += `<li>${note.text}</li><br>`
    bookingNotesHtml += '</ul>'
    }
    $(".noteSection").append(bookingNotesHtml);
    return bookingNotesHtml;
  }

});
