//Org Chart:
var $levelParentClass = '.level';
var $listParentClass = '.list';
var $activeParentClass = '.active';

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