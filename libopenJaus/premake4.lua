project "openJaus"
  language "C"
  kind "StaticLib"
  files { "**.h", "**.c", "**.cpp" }
  includedirs { "include", "../libjaus/include" }
  targetdir "lib"
  objdir ".build"
    
  configuration "Debug"
    defines { "DEBUG" }
    flags { "Symbols" }
      
  configuration "Release"
    defines { "NDEBUG" }
    flags { "Symbols" }

