console.log('questions.js loaded ')
$(document).on('page:change', function() {
  console.log('page:change happened')
  $('#new_question').on('submit', function(event) {
    event.preventDefault();

    var request = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });

    request.done(function(response){
      console.log("success beginning");
      var questionTemplate = $(".question").first().clone();
      console.log(questionTemplate);
      questionTemplate.find('h2 a').text(response.title);
      questionTemplate.find('p').text(response.content);
      questionTemplate.find('.upvote').children().attr('action', ("/questions/" + response.id + "/votes"));
      questionTemplate.find('.downvote a').attr('href', ("/questions/" + response.id + "/votes"));
      $("#all_questions").prepend(questionTemplate);
      $("#question_title").val("");
      $("#question_content").val("");
      console.log("success end");
      });

    request.fail(function(response){
      console.log("FAILLLLLLLLLRE");
    });
  });
})

// $(document).on('page:change', function() {
//   $('#new_todo').on('submit', function(event) {
//     event.preventDefault();

//     var submission = $.ajax({
//       type: 'POST',
//       url: $(this).attr('action'),
//       data: $(this).serialize(),
//       dataType: 'JSON'
//     });

//     submission.done(function(data) {
//       $('.error_messages').remove();
//       var content = data.description;
//       $('.todos').append('<li>' + content + '</li>');
//     });

//     submission.fail(function(data) {
//       var error_messages = data.responseJSON;
//       var error_messages_div = $('<div class="error_messages"></div>');

//       for(var i=0; i<error_messages.length; i++) {
//         error_messages_div.append('<p>' + error_messages[i] + '</p>');
//       }

//       $('#new_todo').prepend(error_messages_div);
//       $('#new_todo .error_messages').prepend("Errors prevented this todo from being saved:");
//     });
//   });
// });
