var new_class;
		$(function (){	
			$('span[class^="ion-social"]').on('mouseover',function(){
				var prev_class = $(this).attr('class');
				new_class = prev_class.split('-outline').join("");
				$(this).attr('class',new_class);
			});
			$('span[class^="ion-social"]').on('mouseleave',function(){
				$(this).attr('class',new_class+'-outline');
			});
		});