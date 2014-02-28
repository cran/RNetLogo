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

import javax.swing.JOptionPane;

public class Preprocess {
	
	public String cpsettings(String nl_path) 
	{
		String savedUserDir = System.getProperty("user.dir");
		// resolve NetLogo dependencies at runtime...
		String seperator = "/";
		String libpath = "lib";
		//String windowsdllpath = "Windows";
		try {
			// extend classpath with NetLogo.jar and dependencies
			//JavaLibraryPath.addFile(nl_path);
			//JavaLibraryPath.addFile(nl_path+seperator+"models");
			JavaLibraryPath.addFile(nl_path+seperator+"NetLogo.jar");
			/*JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"asm-3.0.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"asm-commons-3.0.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"asm-util-3.0.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"gluegen-rt.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"jhotdraw.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"jmf.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"jogl.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"log4j-1.2.14.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"MRJAdapter.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"quaqua.jar");
			JavaLibraryPath.addFile(nl_path+seperator+libpath+seperator+"swing-layout.jar");
			*/
			// if os is windows, then load dlls for jogl...
	  		//if (System.getProperty("os.name").startsWith("Windows")) {
				//JavaLibraryPath.addLibraryPath(new java.io.File(nl_path+seperator+libpath+seperator+windowsdllpath));
		  		//System.loadLibrary("gluegen-rt");	
		  		//System.loadLibrary("jogl");
		  		//System.loadLibrary("jogl_awt");
	  		//}
	  		// change current working directory (change back after quit NetLogo)
	  		System.setProperty("user.dir",nl_path);	  		
		}
		catch (Exception ex) {
			//System.out.println("Error in setting cp. Class path is: "+System.getProperty("java.class.path"));
			JOptionPane.showMessageDialog(null, "Error in setting cp. Class path is \n:"+System.getProperty("java.class.path"), "Error", JOptionPane.OK_CANCEL_OPTION);
		}
		return savedUserDir;
	}
}
