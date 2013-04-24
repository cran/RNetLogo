package nlcon;

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
