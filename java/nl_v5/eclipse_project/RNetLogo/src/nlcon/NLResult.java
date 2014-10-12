package nlcon;

/*
This file is part of RNetLogo.
Contact: jthiele at gwdg.de

Copyright (C) 2011-2013 Jan C. Thiele

RNetLogo is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with RNetLogo. If not, see <http://www.gnu.org/licenses/>.
Linking this library statically or dynamically with other modules is making a combined work based on this library.
Thus, the terms and conditions of the GNU General Public License cover the whole combination.
As a special exception, the copyright holders of this library give you permission to link this library with independent modules to produce an executable,
regardless of the license terms of these independent modules, and to copy and distribute the resulting executable under terms of your choice,
provided that you also meet, for each linked independent module, the terms and conditions of the license of that module.
An independent module is a module which is not derived from or based on this library.
If you modify this library, you may extend this exception to your version of the library, but you are not obligated to do so.
If you do not wish to do so, delete this exception statement from your version.
*/ 

import java.text.ParseException;
import org.nlogo.api.LogoList;

public class NLResult {

	private String type = null;
	private Object resultValue = null;
	
	public void setResultValue(Object o) throws Exception {
		logoToType(o);
	}
	
	public String getType() {
		return type;
	}

	public String getResultAsString() {
		return (String)resultValue;
	}
	
	public double getResultAsDouble() {
		return ((Double)resultValue).doubleValue();
	}
	
	public boolean getResultAsBoolean() {
		return ((Boolean)resultValue).booleanValue();
	}
	
	//public Integer getResultAsInteger() {
	//	return (Integer)resultValue;
	//}
	
	public double[] getResultAsDoubleArray() {
		return (double[])resultValue;
	}

	public boolean[] getResultAsBooleanArray() {
		return (boolean[])resultValue;
	}

	public String[] getResultAsStringArray() {
		return (String[])resultValue;
	}	
	
	public Object getResultAsObject() {
		return resultValue;
	}
	
	public Object[] getResultAsObjectArray() {
		return (Object[])resultValue;
	}
	
	
	
	private void logoToType( Object o ) throws Exception {
		if(o instanceof LogoList)
		{
			type = "LogoList";
			org.nlogo.api.LogoList loli = (org.nlogo.api.LogoList)o;
			resultValue = cast_logolist(loli, false);
		}
		else if (o instanceof String) {
			type = "String";
			resultValue = ((String)o);
		}
		//else if (o instanceof Integer) {
		//	type = "Integer";
		//	resultValue = ((Integer)o);
		//}
		else if (o instanceof Double) {
			type = "Double";
			resultValue = ((Double)o);
		}
		else if (o instanceof Boolean) {
			type = "Boolean";
			resultValue = ((Boolean)o);
		}
		else {
			type = "Unknown";
			resultValue = null;
			throw new Exception("Found unknown datatype: "+o);
		}
	}
	
	
	/**
	 * Method to transform a NetLogo List and put via rni.
	 * @param obj instance of LogoList
	 * @return long containing rni reference value
	 */	
	private Object cast_logolist(LogoList logolist, Boolean recursive) throws Exception
	{
		try
		{
			
    		if (logolist.get(0) instanceof LogoList)
    		{ 
    			Object[] lilist = new Object[logolist.size()];
    			for (int i=0; i<logolist.size(); i++)
				{
					NLResult nestedResult = new NLResult();
					nestedResult.setResultValue(logolist.get(i));
					lilist[i] = nestedResult; //cast_logolist((LogoList)logolist.get(i), true);
				}
    			type = "NestedList";
				return lilist;
    		}
    	    // create an R-variable with String[]-value
    	    if (logolist.get(0) instanceof java.lang.String)
    	    {
           		String[] stringlist = new String[logolist.size()];
				for (int i=0; i<logolist.size(); i++)
				{
					stringlist[i] = (String)logolist.get(i);
				}
				if (!recursive)
					type = "StringList";
				return stringlist;
    	    }		    	    
    	    // create an R-variable with Double[]-Value
    	    if (logolist.get(0) instanceof java.lang.Double)
    	    {
				double[] dblist = new double[logolist.size()];
				//Double[] dblist = new Double[logolist.size()];
				for (int i=0; i<logolist.size(); i++)
				{
					dblist[i] = ((java.lang.Double)logolist.get(i)).doubleValue();
					//dblist[i] = (java.lang.Double)logolist.get(i);
				}     	
				if (!recursive)
					type = "DoubleList";
				return dblist; 	
    	   }   		    	   
    	   // create an R-variable with Boolean[]/int[]-Value
    	   if (logolist.get(0) instanceof java.lang.Boolean)
    	   {
    	       	//int[] intbool= new int[logolist.size()];
    	       	boolean[] boollist = new boolean[logolist.size()];
				for (int i=0; i<logolist.size(); i++)
				{
					//if ((Boolean)logolist.get(i))
    	       		//	intbool[i] = 1;
    	       		//else
    	       		//	intbool[i] = 0;
					if (!recursive)
						type = "BoolList";
					boollist[i] = ((java.lang.Boolean)logolist.get(i)).booleanValue();
				}
				//invalue = intbool; 	
				return boollist;
    	   }
		}
		catch (Exception ex)
		{
			//System.out.println("Error in putRNI: "+ex);
			throw new ParseException("Java error in converting result: "+ex, 1);
		}
		return null;
	}
	
	
}
