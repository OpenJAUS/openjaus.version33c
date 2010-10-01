solution "OpenJAUS"
	configurations { "Debug", "Release" }
	
project "jaus"
  local prj = project()
  local sol = solution()
  kind "SharedLib"
  language "C"

  prj.basedir = string.format("%s/lib%s", sol.basedir, prj.name)
  os.chdir(prj.basedir)
  printf("Project \"%s\" base directory: %s", prj.name, prj.basedir)

  targetdir "lib"
  objdir ".build"
  includedirs { "include"}

  files { "**.h", "**.c", "**.cpp" }

  configuration "Debug"
    defines { "DEBUG" }
    flags { "Symbols" }
      
  configuration "Release"
    defines { "NDEBUG" }
    flags { "Optimize" }


project "openJaus"
  local prj = project()
  local sol = solution()
  kind "SharedLib"
  language "C++"

  prj.basedir = string.format("%s/lib%s", sol.basedir, prj.name)
  os.chdir(prj.basedir)
  printf("Project \"%s\" base directory: %s", prj.name, prj.basedir)

  targetdir "lib"
  objdir ".build"
  includedirs { "include", "../libjaus/include" }

  files { "**.h", "**.c", "**.cpp" }
    
  configuration "Debug"
    defines { "DEBUG" }
    flags { "Symbols" }
      
  configuration "Release"
    defines { "NDEBUG" }
    flags { "Optimize" }


project "ojNodeManager"
  local prj = project()
  local sol = solution()
  kind "ConsoleApp"
  language "C++"

  prj.basedir = string.format("%s/%s", sol.basedir, prj.name)
  os.chdir(prj.basedir)
  printf("Project \"%s\" base directory: %s", prj.name, prj.basedir)

  targetdir "bin"  
  objdir ".build"
  includedirs { "include", "../libjaus/include", "../libopenJaus/include"}

  files { "**.cpp" }
  links { "openJaus", "jaus", "pthread" }

  configuration "Debug"
    defines { "DEBUG" }
    flags { "Symbols" }
      
  configuration "Release"
    defines { "NDEBUG" }
    flags { "Optimize" }
    
    
project "ojVehicleSim"
  local prj = project()
  local sol = solution()
  kind "ConsoleApp"
  language "C++"

  prj.basedir = string.format("%s/%s", sol.basedir, prj.name)
  os.chdir(prj.basedir)
  printf("Project \"%s\" base directory: %s", prj.name, prj.basedir)

  targetdir "bin"  
  objdir ".build"
  includedirs { "include", "../libjaus/include", "../libopenJaus/include"}
  
  files { "**.h", "**.c", "**.cpp" }
  links { "openJaus", "jaus", "pthread", "ncurses" }

  configuration "Debug"
    defines { "DEBUG" }
    flags { "Symbols" }

  configuration "Release"
    defines { "NDEBUG" }
    flags { "Optimize" }
	

