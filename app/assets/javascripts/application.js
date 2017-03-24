// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {
  //Org Chart:
  var $levelParentClass = '.level';
  var $listParentClass = '.list';
  var $activeParentClass = '.active';

  // move items
  function moveSelected($itemSelected) {
    var $levelParent = $($itemSelected).closest($levelParentClass);
    var $listParent = $($itemSelected).closest($listParentClass);
    var $itemContainer = $($itemSelected).parent();
    var $destination = $($listParent).siblings($activeParentClass).children().first();
    var $newContent = $($itemSelected).html();

    // update selected content section
    $($destination).html($newContent);

    // fade animation to look like refresh
    $($listParent).siblings($activeParentClass).fadeOut(0).fadeIn(300);
    $($levelParent).nextAll().not('.hidden').fadeOut(0).fadeIn(300);

    // toggle active item
    $($itemContainer).children().removeClass('selection');
    $($itemSelected).addClass('selection');

    // show next row (should load new items)
    $($levelParent).next().removeClass('hidden');
    $($levelParent).addClass('expanded');
  }

  // smooth scroll to current level
  function scrollParent($scrollTarget) {
    var target = $scrollTarget;
    event.preventDefault();
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top-15
        }, 700);
        return false;
      }
  }

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

});
