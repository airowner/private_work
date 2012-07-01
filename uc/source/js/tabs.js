function scrollDoor(){
}
scrollDoor.prototype = {
	sd : function(menus,divs,openClass,closeClass){
		var _this = this;
		if(menus.length != divs.length)
		{
			alert("菜单层数量和内容层数量不一样!");
			return false;
		}				
		for(var i = 0 ; i < menus.length ; i++)
		{	
            if(!_$(menus[i])) continue;
			_$(menus[i]).value = i;				
			_$(menus[i]).onclick = function(){
					
				for(var j = 0 ; j < menus.length ; j++)
				{						
					_$(menus[j]).className = closeClass;
					_$(divs[j]).style.display = "none";
				}
				_$(menus[this.value]).className = openClass;	
				_$(divs[this.value]).style.display = "block";				
			}
		}
    }
}
window.onload = function(){
	var SDmodel = new scrollDoor();
	SDmodel.sd(["zs011","zs021","zs031"],["to011","to021","to031"],"sdd011","sdd021");
	SDmodel.sd(["zs01","zs02","zs03","zs04"],["to01","to02","to03","to04"],"sdd01","sdd02");
	SDmodel.sd(["zt01","zt02"],["nr01","nr02"],"sd01","sd02");	
}
