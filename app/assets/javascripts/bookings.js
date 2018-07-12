
$(function () {
  $(".js-next").on("click", function() {
    var userID = parseInt($(".js-next").attr("data-userid"));
    var nextID = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/users/" + userID + "/bookings/" + nextID + ".json", function(data) {
      var editLink = "/users/" + userID + "/bookings/" + nextID + "/edit"
      $("#editLink").attr("href", editLink);
      $(".lessonName").text(data["lesson"]["name"]);
      var dateDisplay = data["lesson"]["date"]
      console.log(dateDisplay);
      $(".lessonTime").text(data["lesson"]["time"])
      $(".lessonDate").text(data["lesson"]["date"])
      $(".bookingComment").text(data["comment"]);
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
