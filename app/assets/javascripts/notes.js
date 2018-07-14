$(function(){
  $("#new-note").on("submit", function(e){
    e.preventDefault();
    var url = this.action;
    const data = $(this).serialize();
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
    }
  });
});

function Note(id, user_id, booking_id, text) {
  this.id = id;
  this.user_id = user_id;
  this.booking_id = booking_id;
  this.text = text;
}

Note.prototype.formatNote = function(){
  let noteHtml = '';
  noteHtml += `<li>${this.text}</li>`
  return noteHtml;
}
});
