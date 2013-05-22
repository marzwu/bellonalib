package org.bellona.ui
{
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;

    /**
     * UI的一些方便的方法
     * @author marz
     */
    public class UIUtils
    {
        /**
         * 定位到父容器的中间
         * @param src
         * @param des 父容器
         *
         */
        public static function centerToObject(self:DisplayObject, object:DisplayObject):void
        {
            self.x = 0 + ((object.width - self.width) >> 1);
            self.y = 0 + ((object.height - self.height) >> 1);
        }

        /**
         * 定位到坐标系内的某矩形的中间
         * @param src
         * @param rect 与src坐标系相同
         *
         */
        public static function centerToRect(self:DisplayObject, rect:Rectangle):void
        {
            self.x = rect.x + ((rect.width - self.width) >> 1);
            self.y = rect.y + ((rect.height - self.height) >> 1);
        }

        /**
         * 定位到des的右侧
         * @param src
         * @param des 与src坐标系相同
         *
         */
        public static function rightTo(self:DisplayObject, des:DisplayObject, gap:int = 8):void
        {
            self.x = des.x + des.width + gap;
        }

        /**
         * 定位到des的下面
         * @param src
         * @param des 与src坐标系相同
         *
         */
        public static function bottomTo(self:DisplayObject, des:DisplayObject, gap:int = 8):void
        {
            self.y = des.y + des.height + gap;
        }

        /**
         * 与des纵向居中对齐
         * @param src
         * @param des 与src坐标系相同
         *
         */
        public static function verticalMiddleTo(self:DisplayObject, des:DisplayObject):void
        {
            self.y = des.y + ((des.height - self.height) >> 1);
        }
    }
}
