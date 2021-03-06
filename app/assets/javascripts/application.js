//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require jquery.raty
//= require ratyrate
$(document).ready(function() {
  //Add turbolinks event listener for jQuery
  $(document).on('turbolinks:load', function() {
    //Check boxes
    var $checkBox = $('.uncheck');

    //Only one check at a time
    $checkBox.click(function() {
      $checkBox.prop('checked', false);
      $(this).prop('checked', true);
    });

    //User form input animations
    $(".field-input").focus(function() {
      $(this).parent().addClass("active complete");
    });

    $(".field-input").focusout(function() {
      if($(this).val() === "")
        $(this).parent().removeClass("complete");
        $(this).parent().removeClass("active");
    });

  });
});
