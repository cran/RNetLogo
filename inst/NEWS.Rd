\name{NEWS}
\title{RNetLogo News}
\encoding{UTF-8}


%\section{Changes in version 1.0-3}{
%
%  \subsection{BUG FIXES}{
%
%    \itemize{
%    }
%
%  } % bug fixes
%
%  \subsection{NEW FUNCTIONS}{
%    \itemize{
%
%
%    }
%  } % new functions
%
%  \subsection{NEW FEATURES}{
%    \itemize{
%    }
%
%  } % new features
%  
%  \subsection{INSTALLATION AND BUILDING}{
%    \itemize{    
%    }
%  } % installation and building
%  
%
%} % version 1.0-3

%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------

\section{Changes in version 1.0-3}{
  \subsection{NEW FEATURES}{
  
    \itemize{  
      \item Update to NetLogo 6.0
	  \item Adding optional parameter in NLStart to specify name of netlogo.jar file as the name contains the version number in the name since NetLogo 6.0.0.
    }
 }
   
} % version 1.0-3

%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------

\section{Changes in version 1.0-2}{
  \subsection{NEW FEATURES}{
  
    \itemize{  
      \item Update to NetLogo 5.3
	  \item Changes in internal architecture of holding S4 class object for conformity to CRAN policy 
	  \item Supporting older Java version again (addressing "Unsupported major.minor version" error, however, using Java version before 8.0 is deprecated)
    }
 }
   
} % version 1.0-2

%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------

\section{Changes in version 1.0-1}{
  \subsection{NEW FEATURES}{
  
    \itemize{  
      \item Removing support for NetLogo 4.x (no nl.version argument in NLStart anymore)
	  \item Removing performanceNotes vignette
    }
 }
 
  \subsection{BUG FIXES}{

    \itemize{
      \item Fixing CRAN policy violation.
      \item Update of manual pages and code examples.
      }
  }
  
} % version 1.0-1

%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------

\section{Changes in version 1.0-0}{
  \subsection{NEW FEATURES}{
  
    \itemize{  
      \item Official release in together with the publication in Journal of Statistical Software  
    }
 }
 
  \subsection{BUG FIXES}{

    \itemize{
      \item Update of manual pages and code examples.
      }
  }
	
} % version 1.0-0

%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------

\section{Changes in version 0.9-7}{
  
  \subsection{NEW FEATURES}{
  
  \itemize{
  
    \item Massive performance improvements in NLSetAgentSet, NLSetPatches, NLSetPatchSet
    \item Change in NLSetPatchSet: identifies columns in the input data.frame by name. Expects pxcor, pycor (and, in case of 3D, pzcor) columns.
 
    }

  } % new features

} % version 0.9-7


%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------


\section{Changes in version 0.9-6}{

  \subsection{BUG FIXES}{

    \itemize{

      \item \code{NLStart(<nl.path>, ...)} failed with: \code{Error in .jnew("nlcon/Preprocess") : java.lang.UnsupportedClassVersionError: nlcon/Preprocess : Unsupported major.minor version 51.0}. This happend when using Java versions before 7. The .jar files are now compiled with support up to Java 5. 
      \item several bug fixes and changes in manual pages, code examples and tutorial
    }

  } % bug fixes

  \subsection{NEW FEATURES}{
    \itemize{

      \item Change.log moved to NEWS.Rd. Therefore, \code{news()} function is supported now.
      \item Argument \code{obj.name} in \code{NLStart} is replaced by \code{nl.obj}. In all other	functions \code{nl.obj} is now also a string instead of an reference to NetLogo. References are handled internally, now, 	and no global variables are created anymore. 
      \item More clear working directory handling strategy: stores the working directory active before creating the first NetLogo	instance. Reset to this wd after closing the last active NetLogo instance.
	    \item New \code{all} argument in \code{NLQuit} to close/quit all open NetLogo instances.
    }

  } % new features

} % version 0.9-6


%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------


\section{Changes in version 0.9-5}{

  \subsection{BUG FIXES}{

    \itemize{

      \item Just a fix to fulfill CRAN policy: limit max. parallel processes in vignette parallelProcessing.Rnw to 2 core.

    }

  } % bug fixes

} % version 0.9-5


%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------


\section{Changes in version 0.9-4}{

  \subsection{BUG FIXES}{

    \itemize{

      \item Update of manual pages.
      \item Spelling corrections in parallelProcessing guide.
      \item Small corrections due to package building warnings.
      
    }

  } % bug fixes

  \subsection{NEW FUNCTIONS}{
    \itemize{
    
      \item \code{NLSetPatchSet} added, especially usefull for NetLogo 3D as an equivalent to NLSetPatches, which works only with NetLogo 2D.

    }
  } % new functions

  \subsection{NEW FEATURES}{
    \itemize{

      \item New argument \code{max.minutes} added to \code{NLDoCommandWhile} and \code{NLDoReportWhile}. It stops the execution after a defined number of minutes (default: 10), if it is > 0.
      \item parallelProcessing.pdf and performanceNotes.pdf moved to vignettes.
    }

  } % new features


} % version 0.9-4


%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------


\section{Changes in version 0.9-3}{

  \subsection{NEW FUNCTIONS}{
    \itemize{
    
      \item Experimental function \code{NLSetAgentSet} added (may change or be deleted in future).

    }
  } % new functions

  \subsection{NEW FEATURES}{
    \itemize{

      \item NetLogo 5.0 is default in NLStart (nl.version=5) --> NetLogo 5.0 is much more faster than NetLogo 4.1.x in sending values to R!
      \item Support of NetLogo 4.0.x added (use \code{nl.version=40} in NLStart).
      \item Rewrite of functions \code{NLGetAgentSet}, \code{NLGetPatches}, \code{NLGetGraph} for markable speed improvements.
      \item Default return type of \code{NLGetAgentSet} and \code{NLGetPatches} is a \code{data.frame} instead of a list.
      \item Document "performanceNotes.pdf" added.
      \item Document "parallelProcessing.pdf" added.
      
    }

  } % new features

} % version 0.9-3



%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------


\section{Changes in version 0.9-2}{

  \subsection{BUG FIXES}{

    \itemize{

      \item Typo in manual fixed (order of arguments in \code{NLDoCommand}).
      
    }

  } % bug fixes

  \subsection{NEW FEATURES}{
    \itemize{

      \item Support for NetLogo 3D added (extra boolean argument \code{is3d} in \code{NLStart}).
      \item Better clean up at NLQuit (but this is still a problem. NetLogo offers no clean up for all threads, they just do a System.exit, which can not be used with rJava, because it will terminate the JVM, therefore also rJava and finally R as well.)
  
    }

  } % new features


} % version 0.9-2


%------------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------------


\section{Changes in version 0.9-1}{

  \subsection{BUG FIXES}{

    \itemize{

      \item JARs compiled against Java 1.5 now instead of Java 1.6.
      
    }

  } % bug fixes

} % version 0.9-1


