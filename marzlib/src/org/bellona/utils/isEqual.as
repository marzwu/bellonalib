package org.bellona.utils
{

    /**
     * 比较浮点数是否相等
     * @author Marz
     * @date 2013-2-20
     */
    public function isEqual(n1:Number, n2:Number, precise:Number = 0.00001):Boolean
    {
        return Math.abs(n1 - n2) < precise;
    }
}
