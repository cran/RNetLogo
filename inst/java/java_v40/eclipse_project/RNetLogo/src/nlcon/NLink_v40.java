package nlcon;


// partly based on the work of Uri Wilensky's Mathematica link:
	//(C) 2007 Uri Wilensky. This code may be freely copied, distributed,
	//altered, or otherwise used by anyone for any legal purpose.


import org.nlogo.headless.HeadlessWorkspace;
import org.nlogo.api.CompilerException;
import org.nlogo.api.LogoException;
import org.nlogo.app.App;
import java.awt.EventQueue;
import java.security.Permission;
import javax.swing.JOptionPane;

import java.lang.Thread;


public class NLink_v40 {
	private org.nlogo.workspace.Controllable workspace = null;
	private java.io.IOException caughtEx = null;
	private boolean isGUIworkspace;
	private static boolean blockExit = true;
	private String userdir;

	static final SecurityManager securityManager1 = new SecurityManager()
	{
		public void checkPermission(Permission permission)
		{
			if (blockExit) {
				//This Prevents the shutting down of JVM.(in case of System.exit())
				if ("exitVM".equals(permission.getName()))
				{
					JOptionPane.showMessageDialog(null, "system.exit attemted and blocked.", "Error", JOptionPane.OK_CANCEL_OPTION);
					throw new SecurityException("System.exit attempted and blocked.");
				}
			}
		}
	     public void checkExit(int status) {
	    	 if (blockExit) {
				JOptionPane.showMessageDialog(null, "Please use NLQuit() for closing the window.", "Error", JOptionPane.OK_CANCEL_OPTION);
	    	 	//System.out.println("Thread is requesting exit permissions, will be denied");
	            throw new SecurityException("Preventing sub-tool from calling System.exit(" + Integer.toString(status) + ")!");
	    	 }
	    }
	};
	
	public void KillWorkspace()
	{
		try
		{
			blockExit = false;
			// it is not possible to close NetLogo by its own closing method, because
			// it is based on System.exit(0) which will result in a termination of 
			// the JVM, rJava and finally R.
			// Therefore, we can only dispose the thread, we can find. Not the best but 
			// currently the only way I can see. I include the risk, that not everything
			// is cleaned up.
			if (isGUIworkspace) {
				
				for (int i=0; i<((org.nlogo.app.App)workspace).getFrames().length; i++) {
					java.awt.Frame frame = ((App)workspace).getFrames()[i];
					//if (frame instanceof org.nlogo.gl.view.ObserverView) {
						frame.dispose();
					//}
				}
				//((App)workspace).workspace.dispose();
				Thread.currentThread().interrupt();
				//((App)workspace).quit();
				// cannot be used, because this will close the JVM and R
				//System.exit(0);
			}
			else {
				((HeadlessWorkspace)workspace).dispose();
			}			
		}
		catch (Exception ex) {
			JOptionPane.showMessageDialog(null, "Error in killing workspace:"+ex, "Error", JOptionPane.OK_CANCEL_OPTION);
		}
		workspace = null;
		System.gc();
		// reset current working directory
		if (userdir.length() > 0)
			System.setProperty("user.dir", userdir);
	}
	
	public NLink_v40(Boolean isGUImode, Boolean is3d, String _userdir)
	{
		userdir = _userdir;
		try
		{
			System.setSecurityManager(securityManager1);
			System.setProperty("org.nlogo.is3d" , is3d.toString());
			isGUIworkspace = isGUImode.booleanValue();
			if( isGUIworkspace ) {
				App.main( new String[] { } ) ;
				workspace = App.app;
				org.nlogo.util.Exceptions.setHandler
					( new org.nlogo.util.ExceptionsHandler() {
							public void handle( Throwable t ) {
								throw new RuntimeException(t.getMessage());
							} } );
			}
			else
				workspace = new HeadlessWorkspace();
		}
		catch (Exception ex) {
			JOptionPane.showMessageDialog(null, "Error in Constructor NLink:"+ex, "Error", JOptionPane.OK_CANCEL_OPTION);			
		}
	}

	public void loadModel(final String path)
		throws java.io.IOException, LogoException, CompilerException, InterruptedException
	{
			caughtEx = null;
			if ( isGUIworkspace ) {
				try {
					EventQueue.invokeAndWait ( 
						new Runnable() {
							public void run() {
								try
								{ App.app.open(path); }
								catch( java.io.IOException ex)
								{ caughtEx = ex; }
							} } );
				}
				catch( java.lang.reflect.InvocationTargetException ex ) {
					JOptionPane.showMessageDialog(null, "Error in loading model:"+ex, "Error", JOptionPane.OK_CANCEL_OPTION);
					throw new RuntimeException(ex.getMessage());
				}
				if( caughtEx != null ) {
					throw caughtEx;
				}
			}
			else {
				try {
					if (workspace != null)
						((HeadlessWorkspace)workspace).dispose();
					workspace = new HeadlessWorkspace() ;
					workspace.open(path);
				}
				catch( java.io.IOException ex) {
					JOptionPane.showMessageDialog(null, "Error in loading model:"+ex, "Error", JOptionPane.OK_CANCEL_OPTION);

					if (workspace != null)
						((HeadlessWorkspace)workspace).dispose();
					workspace = new HeadlessWorkspace() ;
					throw ex;
				}
			}
	}

	public void sourceFromString(final String source, final Boolean addProcedure)
	throws java.io.IOException, LogoException, CompilerException, InterruptedException
	{
		caughtEx = null;
		if ( isGUIworkspace ) {
			try {
				EventQueue.invokeAndWait ( 
					new Runnable() {
						public void run() {
							try
							{ 
								if (addProcedure)
								{
									App.app.setProcedures(App.app.getProcedures()+"\n"+source);
								}
								else
								{
									App.app.setProcedures(source);
								}
								
								App.app.compile();
							}
							catch( Exception ex)
							{ 
								//System.out.println("Error: "+ex);
							}
						} 	
					} 	
				);
			}
			catch( java.lang.reflect.InvocationTargetException ex ) {
				JOptionPane.showMessageDialog(null, "Error in model from source:"+ex, "Error", JOptionPane.OK_CANCEL_OPTION);
				throw new RuntimeException(ex.getMessage());
			}
			if( caughtEx != null ) {
				throw caughtEx;
			}
		}
	}
	
	public void command(final String s)
		throws LogoException, CompilerException
	{
		workspace.command(s);
	}

	public void command(final String[] s)
		throws LogoException, CompilerException
	{
		for(int i = 0; i < s.length; i++)
			workspace.command(s[i]);
	}

	public void doCommand(final String str, Integer iter) throws LogoException, CompilerException
	{
		for (int i=0; i<iter.intValue(); i++)
		{
			workspace.command(str);
		}
	}

	public void doCommand(final String[] s, Integer iter) throws LogoException, CompilerException
	{
		for (int i=0; i<iter.intValue(); i++)
		{
			command(s);
		}
	}


	public void doCommandWhile(final String s, final String cond, Integer maxMinutes) throws LogoException, CompilerException
	{
		if (maxMinutes > 0) {
			long startTime = System.currentTimeMillis();
			while (((Boolean)workspace.report(cond)).booleanValue())
			{
				workspace.command(s);
				// max. time exceeded
				if ((System.currentTimeMillis() - startTime) / 60000 >= maxMinutes) {
					//break;
					throw new RuntimeException("Maximum time for NLDoCommandWhile reached. Process stopped.");
				}
			}
		}
		else {		
			while (((Boolean)workspace.report(cond)).booleanValue())
			{
				workspace.command(s);
			}
		}
	}

	
	public void doCommandWhile(final String[] s, final String cond, Integer maxMinutes) throws LogoException, CompilerException
	{
		if (maxMinutes > 0) {
			long startTime = System.currentTimeMillis();
			while (((Boolean)workspace.report(cond)).booleanValue())
			{
				command(s);
				// max. time exceeded
				if ((System.currentTimeMillis() - startTime) / 60000 >= maxMinutes) {
					//break;
					throw new RuntimeException("Maximum time for NLDoCommandWhile reached. Process stopped.");
				}
			}
		}
		else {		
			while (((Boolean)workspace.report(cond)).booleanValue())
			{
				command(s);
			}
		}
	}
	

	/* returns the value of a reporter.  if it is a LogoList, it will be
	recursively converted to an array of Objects */
		public Object report(String s)
			throws LogoException, CompilerException, Exception
		{
			NLResult result = new NLResult();
			result.setResultValue(workspace.report(s));
			return result;
		}

		
	/* returns an evaluated list of reporters */
		public Object[] report(String s[])
			throws LogoException, CompilerException, Exception
		{
			Object[] results = new Object[s.length];
			for( int i = 0; i < s.length; i++ )
			{
				NLResult result = new NLResult();
				result.setResultValue(workspace.report(s[i]));
				results[i] = result; //logoToExpr(workspace.report(s[i]));
			}
			return results; //(new Expr(new Expr(Expr.SYMBOL, "List"), results));
		}

		
/* Repeats a command and returns a single reporter for n interations */
	public Object[] doReport(final String s, final String var, Integer repeats)
		throws LogoException, CompilerException, Exception
	{
		Object[] results = new Object[repeats.intValue()];
		for (int i=0; i<repeats.intValue(); i++)
		{
			workspace.command(s);
			results[i] = report(var);
		}
		return results;
	}

	
/* Repeats a command and returns a list of reporters for n interations */
	public Object[] doReport(final String s, final String[] vars, Integer repeats)
		throws LogoException, CompilerException, Exception
	{
		Object[] results = new Object[repeats.intValue()];
		for(int i=0; i < repeats.intValue(); i++) {
			workspace.command(s);
			results[i] = report(vars);
		}
		return results;
	}


	/* Repeats a command and returns a reporter until a condition is met */
	public Object[] doReportWhile(final String s, final String var, final String condition, Integer maxMinutes)
		throws LogoException, CompilerException, Exception
	{
		java.util.ArrayList<Object> varList = new java.util.ArrayList<Object>();
		if (maxMinutes > 0) {
			long startTime = System.currentTimeMillis();
			for(int i=0; ((Boolean)workspace.report(condition)).booleanValue(); i++) {
				workspace.command(s);
				varList.add(report(var));
				// max. time exceeded
				if ((System.currentTimeMillis() - startTime) / 60000 >= maxMinutes) {
					//break;
					throw new RuntimeException("Maximum time for NLDoReportWhile reached. Process stopped.");
				}
			}
		}
		else {		
			for(int i=0; ((Boolean)workspace.report(condition)).booleanValue(); i++) {
				workspace.command(s);
				varList.add(report(var));
			}
		}
		Object[] objArray = varList.toArray();
		return objArray;
	}

	
/* Repeats a command and returns a list of reporters until a condition is met */
	public Object[] doReportWhile(final String s, final String[] vars, final String condition, Integer maxMinutes)
		throws LogoException, CompilerException, Exception
	{
		java.util.ArrayList<Object> varList = new java.util.ArrayList<Object>();
		if (maxMinutes > 0) {
			long startTime = System.currentTimeMillis();
			for(int i=0; ((Boolean)workspace.report(condition)).booleanValue(); i++) {
				workspace.command(s);
				varList.add(report(vars));
				// max. time exceeded
				if ((System.currentTimeMillis() - startTime) / 60000 >= maxMinutes) {
					//break;
					throw new RuntimeException("Maximum time for NLDoReportWhile reached. Process stopped.");
				}
			}
		}
		else {		
			for(int i=0; ((Boolean)workspace.report(condition)).booleanValue(); i++) {
				workspace.command(s);
				varList.add(report(vars));
			}
		}
		Object[] objArray = varList.toArray();
		return objArray;
	}	
}

	
