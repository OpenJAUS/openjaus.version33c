project "ojVehicleSim"
  language "C++"
  kind "ConsoleApp"
  files { "**.h", "**.c", "**.cpp" }
  includedirs { "include", "../libjaus/include", "../libopenJaus/include"}
  objdir ".build"
  links { "openJaus", "jaus", "pthread", "ncurses" }
  targetdir "bin"  
  
  configuration "Debug"
    defines { "DEBUG" }
    flags { "Symbols" }

  configuration "Release"
    defines { "NDEBUG" }
    flags { "Symbols" }

