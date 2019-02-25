$(function() {

    $('#myfiles-form-link').click(function(e) {
		$("#myfiles-form").delay(100).fadeIn(100);
 		$("#sharedbyme-form").fadeOut(100);
		$("#sharedwithme-form").fadeOut(100);
		$('#sharedbyme-form-link').removeClass('active');
		$('#sharedwithme-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#sharedbyme-form-link').click(function(e) {
		$("#sharedbyme-form").delay(100).fadeIn(100);
 		$("#myfiles-form").fadeOut(100);
		$("#sharedwithme-form").fadeOut(100);
		$('#myfiles-form-link').removeClass('active');
		$('#sharedwithme-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#sharedwithme-form-link').click(function(e) {
		$("#sharedwithme-form").delay(100).fadeIn(100);
 		$("#myfiles-form").fadeOut(100);
		$("#sharedbyme-form").fadeOut(100);
		$('#myfiles-form-link').removeClass('active');
		$('#sharedbyme-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});
