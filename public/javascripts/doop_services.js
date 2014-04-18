/*
使用方法
调用效果: Effect(1,2);
  其中1为: 被改变对象的id
  其中2为: 控制容器的id  可在使用:  this.parentNode.id  取得(父标签的id)
注意给对象ID的时候一定不要重复.
*/
function $G(Read_Id) { return document.getElementById(Read_Id) }
function Effect(ObjectId,parentId){
aDisplay=$G(ObjectId).style.display;
$G(ObjectId).style.display='block';
$G(ObjectId).style.height='auto';
aHeight=$G(ObjectId).offsetHeight;
aDisplay=='none'?$G(ObjectId).style.display='none':$G(ObjectId).style.display='block';
var Obj_Display = $G(ObjectId).style.display;
	if (Obj_Display == 'none'){
	Start(ObjectId,'Opens');
	$G(parentId).innerHTML = "<a href=javascript:void(null) onClick=javascript:Effect('"+ObjectId+"','"+parentId+"'); class='doop_b'></a>"
	}else{ 
	Start(ObjectId,'Close');
	$G(parentId).innerHTML = "<a href=javascript:void(null) onClick=javascript:Effect('"+ObjectId+"','"+parentId+"'); class='doop_a'></a>"
	}
}
function Start(ObjId,method){
var BoxHeight = $G(ObjId).offsetHeight;   			//获取对象高度
var MinHeight = 5;									//定义对象最小高度
var MaxHeight = aHeight;					 			//定义对象最大高度
var BoxAddMax = 1;									//递增量初始值
var Every_Add = 0.15;								//每次的递(减)增量  [数值越大速度越快]
var Reduce    = (BoxAddMax - Every_Add);
var Add       = (BoxAddMax + Every_Add);
//关闭动作**************************************
if (method == "Close"){
var Alter_Close = function(){						//构建一个虚拟的[递减]循环
	BoxAddMax /= Reduce;
	BoxHeight -= BoxAddMax;
	if (BoxHeight <= MinHeight){
		$G(ObjId).style.display = "none";
		window.clearInterval(BoxAction);
	}
	else $G(ObjId).style.height = BoxHeight+'px';
}
var BoxAction = window.setInterval(Alter_Close,1);
}
//打开动作**************************************
else if (method == "Opens"){
var Alter_Opens = function(){
	BoxAddMax *= Add;
	BoxHeight += BoxAddMax;
	if (BoxHeight >= aHeight){
		$G(ObjId).style.height = MaxHeight+'px';
		window.clearInterval(BoxAction);
	}else{
	$G(ObjId).style.display= "block";
	$G(ObjId).style.height = BoxHeight+'px';
	}
}
var BoxAction = window.setInterval(Alter_Opens,1);
}
}