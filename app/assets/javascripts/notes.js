$(function(){
  $("#new-note").on("submit", function(e){
    e.preventDefault();
    var urlElement = e.action
    var url = this.action;
    console.log(this)
    const data = $(this).serialize();
    //debugger
    $.ajax({
    type: "POST",
    url: url,
    data: data,
    dataType: "json",
    success: function(response) {
      $("#note_text").val("");
      let newUserNote = new Note(response.id, response.user_id, response.booking_id, response.text);
      let formattedNote = newUserNote.formatNote();
      $(".notesList").append(formattedNote)
      $("#note-submit").attr("disabled", false)
    }
  });
});

function Note(id, userId, bookingId, text) {
  this.id = id;
  this.userId = userId;
  this.bookingId = bookingId;
  this.text = text;
}

Note.prototype.formatNote = function(){
  let noteHtml = '';
  noteHtml += `<li>${this.text}</li>`
  return noteHtml;
}
});
