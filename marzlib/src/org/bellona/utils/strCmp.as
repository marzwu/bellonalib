package org.bellona.utils
{
	
	/**
	 * 字符串简单比较
	 * @author marzwu@gmail.com
	 * @date 2013-5-2
	 */
	public function strCmp(str0:String, str1:String):int
	{
		if(str0 < str1){
			return -1;
		}else if(str0 == str1){
			return 0;
		}else{
			return 1;
		}
	}
}