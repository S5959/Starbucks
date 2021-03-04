
$(document).ready(function() {
	
	/* btn_search */
	var searchInput = false;
	
	//$('.sub_gnb_wrap_inner .btn_search').append(btnSearch);
 	$('.sub_gnb_wrap_inner .btn_search a').click(function () {
		if (searchInput == false) {
			$('.sub_gnb_wrap_inner .btn_search').css( { 'background':'#fff', 'width':'180px' });
			$('.sub_gnb_wrap_inner .btn_search input').css('display', 'inline-block');
			$('.sub_gnb_wrap_inner nav.util_nav').css('right', '232px');
			$('.sub_gnb_wrap_inner .btn_search input').fadeIn();
			searchInput = true;
		} else {
			$('.sub_gnb_wrap_inner nav.util_nav').removeAttr('style');
			$('.sub_gnb_wrap_inner .btn_search').removeAttr('style');
			$('.sub_gnb_wrap_inner .btn_search input').removeAttr('style');			
			$('.sub_gnb_wrap_inner .btn_search input').fadeOut();
			searchInput = false;
		}
	});
	/* btn_search end */
	
	/* gnb */
	$('.sub_gnb_nav_inner > ul > li > h2 > a').bind('mouseover focus', function (e) {
		$('.sub_gnb_nav_inner > ul > li > h2 > a').removeClass('on');
		$('.gnb_sub_wrap').hide();

		$(this).addClass('on');
		$(this).parent().next().stop(true, true).slideDown();

		e.preventDefault();
	});

	$('.sub_gnb_nav_inner').bind('mouseleave', function () {
		$('.sub_gnb_nav_inner > ul > li > h2 > a').removeClass('on');
		$('.gnb_sub_wrap').slideUp();
	});
	/* gnb end*/
	
	
	/* 서브메뉴 정렬 */
	var myWindow = $(window).width();
	$(window).resize(function() {
		myWindow = $(window).width();
		console.log(myWindow);
	});
	
	if (myWindow > 1100) {
		$('.gnb_sub_inner ul:nth-of-type(6)').css({ 'padding-top': '30px' });
		$('.gnb_sub_inner ul:nth-of-type(7)').css({ 'padding-top': '30px' });
		$('.gnb_sub_inner ul:nth-of-type(8)').css({ 'padding-top': '30px' });
	} else if (myWindow <= 1100 && myWindow > 960) {
		$('.gnb_sub_inner ul:nth-of-type(5)').css({ 'padding-top': '30px' });
		$('.gnb_sub_inner ul:nth-of-type(6)').css({ 'padding-top': '30px' });
		$('.gnb_sub_inner ul:nth-of-type(7)').css({ 'padding-top': '30px' });
		$('.gnb_sub_inner ul:nth-of-type(8)').css({ 'padding-top': '30px' });
	}
		
	if (myWindow > 1100) {
		$('.gnb_sub_inner ul:nth-of-type(6)').css({ 'clear': 'both' });
	} else if(myWindow <= 1100 && myWindow > 960) {
		$('.gnb_sub_inner ul:nth-of-type(5)').css({ 'clear': 'both' });
		$('.gnb_sub_inner ul:nth-of-type(6)').css({ 'clear': '' });
	}
	/* 서브메뉴 정렬 end */
	
	
	/* mob_gnb */
	//메뉴버튼 누르면
	$('.tablet_gnb04 a').click(function () {
		$('.mob_gnb_dimm').show();
		$('.mob_gnb_wrap').animate({
			'right': '0'
		});
	});
	
	$('.btn_gnb_close a').click(function () {
		//fn_hideGnbMenu();
		$('.mob_gnb_dimm').hide();
		$('.mob_gnb_wrap').animate({
			'right': '-100%'
		});
	});
	
	//메뉴 gnb 
	$('.mob_gnb_menus > ul > li, .mob_gnb_menus ul li ul li').hide();
	$('.mob_gnb_menus ul li.mob_gnb_ttl1, .mob_gnb_menus ul li.mob_gnb_ttl2').show();
	
	$('.mob_gnb_menus ul li.mob_gnb_ttl1 a').click(function (e) {
		$(this).parent().siblings().stop(true, true).slideToggle();
		$(this).toggleClass('mob_gnb_arrow_up');
	});
 	
 	$('.mob_gnb_menus ul li.mob_gnb_ttl2 a').click(function (e) {
		$(this).parent().siblings().stop(true, true).slideToggle();
		$(this).toggleClass('mob_gnb_arrow_up');
	});

	$('.mob_gnb_menus ul li a').click(function (e) {
		$(this).siblings().children().stop(true, true).slideToggle();
		$(this).children().toggleClass('mob_gnb_arrow_up');
	});
	/* mob_gnb end*/
	
	
});

