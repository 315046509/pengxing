/*
ʹ�÷���
����Ч��: Effect(1,2);
  ����1Ϊ: ���ı�����id
  ����2Ϊ: ����������id  ����ʹ��:  this.parentNode.id  ȡ��(����ǩ��id)
ע�������ID��ʱ��һ����Ҫ�ظ�.
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
var BoxHeight = $G(ObjId).offsetHeight;   			//��ȡ����߶�
var MinHeight = 5;									//���������С�߶�
var MaxHeight = aHeight;					 			//����������߶�
var BoxAddMax = 1;									//��������ʼֵ
var Every_Add = 0.15;								//ÿ�εĵ�(��)����  [��ֵԽ���ٶ�Խ��]
var Reduce    = (BoxAddMax - Every_Add);
var Add       = (BoxAddMax + Every_Add);
//�رն���**************************************
if (method == "Close"){
var Alter_Close = function(){						//����һ�������[�ݼ�]ѭ��
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
//�򿪶���**************************************
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