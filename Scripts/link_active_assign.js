$(function (){
	url_fname = window.location.href.split('CT---Frontend/');
	fname_active = url_fname[1].split('.php').join("");
	if(fname_active == []) {
		fname_active = '#index';
	}
	else { 
		fname_active = '#' + fname_active; 
	}
	$(fname_active).addClass('active');
	// $(fname_active).find('.fwd-right').addClass('ion-android-arrow-forward');
	// $(fname_active).find('.fwd-right').removeClass('ion-ios7-arrow-right');
	$(fname_active).css('border-right','none');
});