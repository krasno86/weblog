$(document).on('ready turbolinks:load',function() {
	$('.image-popup-no-margins').magnificPopup({
		type: 'image',
		items: {
			src: $('.image-popup-no-margins').data('url')
		}
	});
});