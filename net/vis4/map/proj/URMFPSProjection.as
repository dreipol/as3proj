﻿/*
Copyright 2006 Jerry Huxtable

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

/*
 * This file was semi-automatically converted from the public-domain USGS PROJ source.
 */

/*
 * This file was manually ported to actionscript by Gregor Aisch, vis4.net
 */

 package net.vis4.map.proj 
{
	import flash.geom.Point;
	import net.vis4.map.MapMath;
	
	public class URMFPSProjection extends Projection
	{
		private static const C_x:Number = 0.8773826753;
		private static const Cy:Number = 1.139753528477;
	
		private var _n:Number = 0.8660254037844386467637231707;// wag1
		private var C_y:Number;
		
		override public function project(lplam:Number, lpphi:Number, out:Point):Point 
		{
			out.y = MapMath.asin(n * Math.sin(lpphi));
			out.x = C_x * lplam * Math.cos(lpphi);
			out.y = C_y * lpphi;
			return out;
		}
		
		override public function projectInverse(xyx:Number, xyy:Number, out:Point):Point 
		{
			xyy /= C_y;
			out.x = xyx / (C_x * Math.cos(xyy));
			out.y = MapMath.asin(Math.sin(xyy) / n);
			return out;
		}
		
		override public function hasInverse():Boolean 
		{
			return true;
		}
		
		override public function initialize():void 
		{
			super.initialize();
			if (n <= 0. || n > 1.)
				throw new ProjectionError("-40");
			C_y = Cy / n;
		}
		
		override public function toString():String 
		{
			return "Urmaev Flat-Polar Sinusoidal";
		}
		
		override public function get shortName():String { return "Urmaev"; }
		
		public function get n():Number { return _n; }
		
		public function set n(value:Number):void 
		{
			_n = value;
		}
		
	}

}