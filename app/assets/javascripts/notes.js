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
      let newUserPet = new Comment(response.id, response.user_id, response.booking_id, response.text);
      let formattedComment = newUserPet.formatComment();
      $(".notesList").append(formattedComment)
    }
  });
});

function Comment(id, user_id, booking_id, text) {
  this.id = id;
  this.user_id = user_id;
  this.booking_id = booking_id;
  this.text = text;
}

Comment.prototype.formatComment = function(){
  let commentHtml = '';
  commentHtml += `<li>${this.text}</li>`
  return commentHtml;
}
});
