$(function () {

 //最上面通栏导航的下拉菜单切换
 if ($.browser.msie && $.browser.version == "6.0") {
 $(".menu-item").hover(function () {
 $(this).children().addClass("hover").children(".menu-bd").show();
 }, function () {
 $(this).children().removeClass("hover").children(".menu-bd").hide();
 });
 })

$(function () {
	if ($.browser.msie && $.browser.version == "6.0") {
		$(".menu-item").hover(function () {
			 $(this).children().addClass("hover").children(".menu-bd").show();							
		},function () {
 $(this).children().removeClass("hover").children(".menu-bd").hide();
 }
		}
			}