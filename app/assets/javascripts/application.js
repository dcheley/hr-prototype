//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
$(document).ready(function() {
  //Add turbolinks event listener for jQuery
  $(document).on('turbolinks:load', function() {
    //Check boxes
    var $checkBox = $('input[type=checkbox]');

    //Only one check at a time
    $checkBox.click(function() {
      $checkBox.prop('checked', false);
      $(this).prop('checked', true);
    });

    //Carousel
    $('.carousel').carousel({
      interval: 3000
    })

    //User form input animations
    $(".field-input").focus(function() {
      $(this).parent().addClass("active complete");
    });

    $(".field-input").focusout(function() {
      if($(this).val() === "")
        $(this).parent().removeClass("complete");
        $(this).parent().removeClass("active");
    });

    //Endorsement animations
    $("#like_<%= @badge.id %>").removeClass('glyphicon-thumbs-up').addClass('glyphicon-thumbs-down');
    $("#like_<%= @badge.id %>").attr("href", '/badges/<%= @badge.id %>/unlike');
    $("#likes_<%= @badge.id %>").html("<%= j (render partial: 'badges/likes', locals: { badge: @badge } ) %>");

    $("#like_<%= @recognition.id %>").removeClass('glyphicon-thumbs-up').addClass('glyphicon-thumbs-down');
    $("#like_<%= @recognition.id %>").attr("href", '/recognitions/<%= @recognition.id %>/unlike');
    $("#likes_<%= @recognition.id %>").html("<%= j (render partial: 'recognitions/likes', locals: { recognition: @recognition } ) %>");

  });

});
