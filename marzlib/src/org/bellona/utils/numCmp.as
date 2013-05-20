package org.bellona.utils
{
	
	/**
	 * 数值比较
	 * @author marzwu@gmail.com
	 * @date 2013-5-2
	 */
	public function numCmp(num0:Number, num1:Number):int
	{
		if(num0 < num1){
			return -1;
		}else if(num0 == num1){
			return 0;
		}else{
			return 1;
		}
	}
}