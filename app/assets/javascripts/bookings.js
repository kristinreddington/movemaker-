$(function () {
  $(".js-next").on("click", function() {
    var userID = parseInt($(".js-next").attr("data-userid"));
    var nextID = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/users/" + userID + "/bookings/" + nextID + ".json", function(data) {
      $(".noteSection").empty()
      var notes = data.notes
      notes.forEach(formatNotes);
      
      $(".lessonName").text(data["lesson"]["name"]);
      $(".lessonTime").text(data["lesson"]["time"]);
      $(".lessonDate").text(data["lesson"]["date"]);
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
