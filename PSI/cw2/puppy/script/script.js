$(document).ready(function(){
	
	var slideShow = $('#slideShow'),
		ul = slideShow.find('ul'),
		li = ul.find('li'),
		cnt = li.length;
	
	/**
		zdjecia sa pozycjonowane z wykorzystaniem absolute domyslnie, wiec
		ostatnie zdjecie byloby pokazywane w ramce, updateZindex() usprawnia to
		zachowujac odpowiednia kolejnosc 
	*/

	updateZindex();

	if($.support.transform){
	
		li.find('img').css('rotate',function(i){
			return (-90*i) + 'deg';
		}); // obrot 
		//zbindowanie obrotu
		slideShow.bind('rotateContainer',function(e,direction,degrees){
			
			
			slideShow.animate({
				width		: 510,
				height		: 510,
				marginTop	: 0,
				marginLeft	: 0
			},'fast',function(){
				
				if(direction == 'next'){
					
					$('li:first').fadeOut('slow',function(){
						$(this).remove().appendTo(ul).show();
						updateZindex();
					});
				}
				else {
					
					var liLast = $('li:last').hide().remove().prependTo(ul);
					updateZindex();
					liLast.fadeIn('slow');
				}
				slideShow.animate({				
					rotate:Math.round($.rotate.radToDeg(slideShow.css('rotate'))+degrees) + 'deg'
				},'slow').animate({
					width		: 490,
					height		: 490,
					marginTop	: 10,
					marginLeft	: 10
				},'fast');
			});
		});
		
		slideShow.bind('showNext',function(){
			slideShow.trigger('rotateContainer',['next',90]);
		});
		
		slideShow.bind('showPrevious',function(){
			slideShow.trigger('rotateContainer',['previous',-90]);
		});
	}
	
	else{
		
		
		slideShow.bind('showNext',function(){
			$('li:first').fadeOut('slow',function(){
				$(this).remove().appendTo(ul).show();
				updateZindex();
			});
		});
		
		slideShow.bind('showPrevious',function(){
			var liLast = $('li:last').hide().remove().prependTo(ul);
			updateZindex();
			liLast.fadeIn('slow');
		});
	}
	
	
	$('#previousLink').click(function(){
		if(slideShow.is(':animated')){
			return false;
		}
		
		slideShow.trigger('showPrevious');
		return false;
	});
	
	$('#nextLink').click(function(){
		if(slideShow.is(':animated')){
			return false;
		}
		
		slideShow.trigger('showNext');
		return false;
	});
	function updateZindex(){
		
		ul.find('li').css('z-index',function(i){
			return cnt-i;
		});
	}

});