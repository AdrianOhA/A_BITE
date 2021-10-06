package com.abite.common.annotation;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * �뒪�뀒�젅�삤 ���엯. @TODO
 * 
 * <p>�씪諛섏궗�슜�옄�쎒, 紐⑤컮�씪�궗�슜�옄�뿉�꽌 �궗�슜</p>
 * 
 * @author	osm077
 * @since	2020-01-06
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface LoginRequired {

}
