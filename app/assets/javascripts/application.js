//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
$(document).ready(function() {
  //Add turbolinks event listener for jQuery
  $(document).on('turbolinks:load', function() {
    //Org Chart:
    var $levelParentClass = '.level';
    var $listParentClass = '.list';
    var $activeParentClass = '.active';
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

    //Moving Org Chart items
    function moveSelected($itemSelected) {
      var $levelParent = $($itemSelected).closest($levelParentClass);
      var $listParent = $($itemSelected).closest($listParentClass);
      var $itemContainer = $($itemSelected).parent();
      var $destination = $($listParent).siblings($activeParentClass).children().first();
      var $newContent = $($itemSelected).html();

      //Update selected content section
      $($destination).html($newContent);

      //Fade animation to look like refresh
      $($listParent).siblings($activeParentClass).fadeOut(0).fadeIn(300);
      $($levelParent).nextAll().not('.hidden').fadeOut(0).fadeIn(300);

      //Toggle active item
      $($itemContainer).children().removeClass('selection');
      $($itemSelected).addClass('selection');

      //Show next row (should load new items)
      $($levelParent).next().removeClass('hidden');
      $($levelParent).addClass('expanded');
    };

    //Smooth scroll to current level
    function scrollParent($scrollTarget) {
      var target = $scrollTarget;
      event.preventDefault();
        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top-15
          }, 700);
          return false;
        }
    };

    // listeners
    $(".org-header").on("click", function(){
      scrollParent($(this).closest('.level'));
      moveSelected($(this).closest('.element'));
    });

    //Org Chart hover animations
    $('.org-header', '.org-menu-header').mouseenter(function() {
      $(this).closest('.element').addClass('hover');
      $(this).closest('.level').addClass('hover-expanded');
      $(this).closest('.level').next('.level').addClass('hover-children');
    });

    $('.org-header', '.org-menu-header').mouseleave(function() {
      $(this).closest('.element').removeClass('hover');
      $(this).closest('.level').removeClass('hover-expanded');
      $(this).closest('.level').next('.level').removeClass('hover-children');
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

    //Endorsement animations
    $("#like_<%= @badge.id %>").removeClass('glyphicon-thumbs-up').addClass('glyphicon-thumbs-down');
    $("#like_<%= @badge.id %>").attr("href", '/badges/<%= @badge.id %>/unlike');
    $("#likes_<%= @badge.id %>").html("<%= j (render partial: 'badges/likes', locals: { badge: @badge } ) %>");
    
  });

});
