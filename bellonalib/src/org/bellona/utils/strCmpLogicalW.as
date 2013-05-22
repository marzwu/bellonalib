package org.bellona.utils
{

    /**
	 * 字符串逻辑比较，功能就不介绍了，StrCmpLogicalW的as3版
     * @author marzwu@gmail.com
     * @date 2013-5-2
     */
    public function strCmpLogicalW(str0:String, str1:String):int
    {
        var reg0:RegExp = /[+-]?\d+(\.\d+)?/;
        var reg1:RegExp = /[+-]?\d+(\.\d+)?/;
		while(true){
			if(str0.length == 0 && str1.length == 0){//都为空字符串
				return 0;
			}else if(str0.length == 0){//第一个为空字符串
				return -1
			}else if(str1.length == 0){//第二个为空字符串
				return 1;
			}
			
			var r0:* = reg0.exec(str0);
			var r1:* = reg1.exec(str1);
			
			if(r0 == null || r1 == null){//其中之一不包含数字
				return strCmp(str0, str1);
			}
			
			//把字符串拆成三个部分，数值前、数值、数值后；除了数值外，其他两项可以分别为''
			var str0_0:String = str0.substr(0, r0.index);
			var str0_1:String = str0.substr(r0.index, r0[0].length);
			str0 = str0.substr(r0.index + r0[0].length);
			
			var str1_0:String = str1.substr(0, r1.index);
			var str1_1:String = str1.substr(r1.index, r1[0].length);
			str1 = str1.substr(r1.index + r1[0].length);
			
			var r:int = strCmp(str0_0, str1_0);//先比较前面的字符串
			if(r == 0){
				var d0:Number = parseFloat(str0_1);
				var d1:Number = parseFloat(str1_1);
				r = numCmp(d0, d1);//比较后面的数值
				if(r != 0){
					return r;
				}
			}else{
				return r;
			}
		}
        return 0;
    }
}
