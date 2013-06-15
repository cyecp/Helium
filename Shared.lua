require "Dependencies/Helium"
require "Dependencies/tbb"
require "Dependencies/fbx"

require "Helium"

project( prefix .. "Engine" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Engine", "ENGINE" )
	Helium.DoTbbProjectSettings()

	files
	{
		"Engine/*",
	}

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
		}

project( prefix .. "EngineJobs" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "EngineJobs", "ENGINE_JOBS" )
	Helium.DoTbbProjectSettings()

	files
	{
		"EngineJobs/*",
	}

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
		}

project( prefix .. "Windowing" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Windowing", "WINDOWING" )

	files
	{
		"Windowing/*",
	}

	configuration "windows"
		excludes
		{
			"Platform/*Mac.*",
			"Platform/*Lin.*",
		}

	configuration "macosx"
		excludes
		{
			"Platform/*Win.*",
			"Platform/*Lin.*",
		}

	configuration "linux"
		excludes
		{
			"Platform/*Win.*",
			"Platform/*Mac.*",
		}

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Framework",
		}

project( prefix .. "Rendering" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Rendering", "RENDERING" )
	Helium.DoGraphicsProjectSettings()

	files
	{
		"Rendering/*",
	}

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
		}

project( prefix .. "GraphicsTypes" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "GraphicsTypes", "GRAPHICS_TYPES" )
	Helium.DoGraphicsProjectSettings()

	files
	{
		"GraphicsTypes/*",
	}

	if haveGranny then
		includedirs
		{
			"Integrations/Granny",
			"Integrations/Granny/granny_sdk/include",
		}
		defines
		{
			"HELIUM_HAVE_GRANNY=1",
		}
	else
		defines
		{
			"HELIUM_HAVE_GRANNY=0",
		}
	end

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Rendering",
		}

	if haveGranny then
		configuration { "windows", "x32" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win32",
			}
		configuration { "windows", "x64" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win64",
			}
		configuration "x32"
			links
			{
				"granny2",
			}
		configuration "x64"
			links
			{
				"granny2_x64",
			}
	end

project( prefix .. "GraphicsJobs" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "GraphicsJobs", "GRAPHICS_JOBS" )
	Helium.DoGraphicsProjectSettings()
	Helium.DoTbbProjectSettings()

	files
	{
		"GraphicsJobs/*",
	}

	if haveGranny then
		includedirs
		{
			"Integrations/Granny",
			"Integrations/Granny/granny_sdk/include",
		}
		defines
		{
			"HELIUM_HAVE_GRANNY=1",
		}
	else
		defines
		{
			"HELIUM_HAVE_GRANNY=0",
		}
	end

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Rendering",
			prefix .. "GraphicsTypes",
		}

	if haveGranny then
		configuration { "windows", "x32" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win32",
			}
		configuration { "windows", "x64" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win64",
			}
		configuration "x32"
			links
			{
				"granny2",
			}
		configuration "x64"
			links
			{
				"granny2_x64",
			}
	end

project( prefix .. "Graphics" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Graphics", "GRAPHICS" )
	Helium.DoGraphicsProjectSettings()
	Helium.DoTbbProjectSettings()

	files
	{
		"Graphics/*",
	}

	if haveGranny then
		includedirs
		{
			"Integrations/Granny",
			"Integrations/Granny/granny_sdk/include",
		}
		defines
		{
			"HELIUM_HAVE_GRANNY=1",
		}
	else
		defines
		{
			"HELIUM_HAVE_GRANNY=0",
		}
	end

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "Framework",
			prefix .. "EngineJobs",
			prefix .. "Rendering",
			prefix .. "GraphicsTypes",
			prefix .. "GraphicsJobs",
		}

	if haveGranny then
		configuration { "windows", "x32" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win32",
			}
		configuration { "windows", "x64" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win64",
			}
		configuration "x32"
			links
			{
				"granny2",
			}
		configuration "x64"
			links
			{
				"granny2_x64",
			}
	end
	
project( prefix .. "Components" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Components", "COMPONENTS" )
	Helium.DoGraphicsProjectSettings()
	Helium.DoTbbProjectSettings()

	files
	{
		"Components/*",
	}

	if haveGranny then
		defines
		{
			"HELIUM_HAVE_GRANNY=1",
		}
	else
		defines
		{
			"HELIUM_HAVE_GRANNY=0",
		}
	end

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Framework",
			prefix .. "Rendering",
			prefix .. "GraphicsTypes",
			prefix .. "GraphicsJobs",
			prefix .. "Graphics",
			prefix .. "Ois"
		}
	
		
project( prefix .. "Bullet" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Bullet", "BULLET" )
	Helium.DoGraphicsProjectSettings()
	Helium.DoTbbProjectSettings()

	files
	{
		"Bullet/*",
	}

	includedirs
	{
		"Dependencies/bullet/src",
	}

	if haveGranny then
		defines
		{
			"HELIUM_HAVE_GRANNY=1",
		}
	else
		defines
		{
			"HELIUM_HAVE_GRANNY=0",
		}
	end

	configuration "SharedLib"
		links
		{
			-- dependencies
			"bullet",

			-- projects
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Framework",
			prefix .. "Components",
			prefix .. "Rendering", -- (for debug drawing)
			prefix .. "GraphicsTypes", -- (for debug drawing)
			prefix .. "Graphics", -- (for debug drawing)
			
		}
		
				
project( prefix .. "Ois" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Ois", "OIS" )
	Helium.DoGraphicsProjectSettings()
	Helium.DoTbbProjectSettings()

	files
	{
		"Ois/*",
	}

	includedirs
	{
		"Dependencies/ois/includes",
	}

	if haveGranny then
		defines
		{
			"HELIUM_HAVE_GRANNY=1",
		}
	else
		defines
		{
			"HELIUM_HAVE_GRANNY=0",
		}
	end

	configuration "SharedLib"
		links
		{
			-- dependencies
			"ois",

			-- projects
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Framework",
			prefix .. "Rendering",
			prefix .. "GraphicsTypes",
			prefix .. "GraphicsJobs",
			prefix .. "Graphics",
		}

project( prefix .. "Framework" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "Framework", "FRAMEWORK" )
	Helium.DoTbbProjectSettings()

	files
	{
		"Framework/*",
	}

	if haveGranny then
		includedirs
		{
			"Integrations/Granny",
			"Integrations/Granny/granny_sdk/include",
		}
		defines
		{
			"HELIUM_HAVE_GRANNY=1",
		}
	else
		defines
		{
			"HELIUM_HAVE_GRANNY=0",
		}
	end

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs"--,
			--prefix .. "Windowing"--,
			--prefix .. "Rendering",
			--prefix .. "GraphicsTypes",
			--prefix .. "GraphicsJobs",
			--prefix .. "Graphics",
		}

	if haveGranny then
		configuration { "windows", "x32" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win32",
			}
		configuration { "windows", "x64" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win64",
			}
		configuration "x32"
			links
			{
				"granny2",
			}
		configuration "x64"
			links
			{
				"granny2_x64",
			}
	end

project( prefix .. "FrameworkWin" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "FrameworkWin", "FRAMEWORK_WIN" )

	files
	{
		"FrameworkWin/*",
	}

	includedirs
	{
		"Dependencies/freetype/include",
	}

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Windowing",
			prefix .. "Rendering",
			prefix .. "GraphicsTypes",
			prefix .. "GraphicsJobs",
			prefix .. "Graphics",
			prefix .. "Framework",
			prefix .. "RenderingD3D9",
		}

	if string.find( project().name, 'Tools.' ) then
		links
		{
			"Tools.PcSupport",
			"Tools.PreprocessingPc",
			"Tools.EditorSupport",
		}
	end

project( prefix .. "RenderingD3D9" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "RenderingD3D9", "RENDERING_D3D9" )
	Helium.DoGraphicsProjectSettings()

	files
	{
		"RenderingD3D9/*",
	}

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Rendering",
		}

project( prefix .. "TestJobs" )

	Helium.DoModuleProjectSettings( ".", "HELIUM", "TestJobs", "TEST_JOBS" )
	Helium.DoTbbProjectSettings()
	
	files
	{
		"TestJobs/**",
	}

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
		}

project( prefix .. "TestApp" )

	kind "WindowedApp"

	Helium.DoGraphicsProjectSettings()
	Helium.DoTbbProjectSettings()

	files
	{
		"TestApp/**.cpp",
		"TestApp/**.h",
		"TestApp/**.ico",
		"TestApp/**.rc"
	}

	flags
	{
		"WinMain",
	}

	defines
	{
		"HELIUM_MODULE=TestApp",
	}

	includedirs
	{
		"Dependencies/freetype/include",
		"Dependencies/bullet/src",
	}

	links
	{
		"Core.Platform",
		"Core.Foundation",
		"Core.Reflect",
		"Core.Persist",
		"Core.Math",
		"Core.MathSimd",
		prefix .. "Engine",
		prefix .. "EngineJobs",
		prefix .. "Windowing",
		prefix .. "Rendering",
		prefix .. "GraphicsTypes",
		prefix .. "GraphicsJobs",
		prefix .. "Graphics",
		prefix .. "Framework",
		prefix .. "FrameworkWin",
		prefix .. "RenderingD3D9",
		prefix .. "TestJobs",
		prefix .. "Components",
		prefix .. "Bullet",
		prefix .. "Ois",
	}

	if string.find( project().name, 'Tools.' ) then
		links
		{
			"Tools.PcSupport",
			"Tools.PreprocessingPc",
			"Tools.EditorSupport",
		}
	end

	pchheader( "TestAppPch.h" )
	pchsource( "TestApp/TestAppPch.cpp" )

	Helium.DoBasicProjectSettings()
	Helium.DoFbxProjectSettings()

	-- TestApp is a bit odd because it includes custom game objects and a main().
	-- So we need the dll export #defines. But calling DoModuleProjectSettings(...) above
	-- seems to blow away the libs we try to import when we call DoBasicProjectSettings()
	configuration { "windows", "Debug" }
		defines
		{
			"HELIUM_TEST_APP_EXPORTS",
		}

	if haveGranny then
		configuration { "windows", "x32" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win32",
			}
		configuration { "windows", "x64" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win64",
			}
		configuration "x32"
			links
			{
				"granny2",
			}
		configuration "x64"
			links
			{
				"granny2_x64",
			}
	end

project( prefix .. "ExampleGame" )

	Helium.DoModuleProjectSettings( "Example", "", "ExampleGame", "EXAMPLE_GAME" )

	Helium.DoBasicProjectSettings()
	Helium.DoFbxProjectSettings()
	
	files
	{
		"Example/ExampleGame/**",
	}

	includedirs
	{
		"Dependencies/freetype/include",
		"Dependencies/bullet/src",
		"Example",
	}
	
	pchheader( "ExampleGamePch.h" )
	pchsource( "Example/ExampleGame/ExampleGamePch.cpp" )

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Windowing",
			prefix .. "Rendering",
			prefix .. "GraphicsTypes",
			prefix .. "GraphicsJobs",
			prefix .. "Graphics",
			prefix .. "Framework",
			prefix .. "FrameworkWin",
			prefix .. "RenderingD3D9",
			prefix .. "Components",
			prefix .. "Bullet",
			prefix .. "Ois",
		}

	if string.find( project().name, 'Tools.' ) then
		links
		{
			"Tools.PcSupport",
			"Tools.PreprocessingPc",
			"Tools.EditorSupport",
		}
	end

project( prefix .. "ExampleMain_PhysicsDemo" )

	Helium.DoExampleMainProjectSettings( "PhysicsDemo" )
		
project( prefix .. "ExampleMain_ShapeShooter" )

	Helium.DoExampleMainProjectSettings( "ShapeShooter" )

project( prefix .. "EmptyGame" )

	Helium.DoModuleProjectSettings( "Empty", "", "EmptyGame", "EMPTY_GAME" )

	Helium.DoBasicProjectSettings()
	Helium.DoFbxProjectSettings()
	
	files
	{
		"Example/EmptyGame/**",
	}

	includedirs
	{
		"Dependencies/freetype/include",
		"Dependencies/bullet/src",
		"Example",
	}
	
	pchheader( "EmptyGamePch.h" )
	pchsource( "Example/EmptyGame/EmptyGamePch.cpp" )

	configuration "SharedLib"
		links
		{
			"Core.Platform",
			"Core.Foundation",
			"Core.Reflect",
			"Core.Persist",
			"Core.Math",
			"Core.MathSimd",
			prefix .. "Engine",
			prefix .. "EngineJobs",
			prefix .. "Windowing",
			prefix .. "Rendering",
			prefix .. "GraphicsTypes",
			prefix .. "GraphicsJobs",
			prefix .. "Graphics",
			prefix .. "Framework",
			prefix .. "FrameworkWin",
			prefix .. "RenderingD3D9",
			prefix .. "Components",
			prefix .. "Bullet",
			prefix .. "Ois",
		}

	if string.find( project().name, 'Tools.' ) then
		links
		{
			"Tools.PcSupport",
			"Tools.PreprocessingPc",
			"Tools.EditorSupport",
		}
	end

project( prefix .. "EmptyMain" )

	kind "WindowedApp"

	Helium.DoGraphicsProjectSettings()
	Helium.DoTbbProjectSettings()

	files
	{
		"Example/EmptyMain/*",
	}

	flags
	{
		"WinMain",
	}

	defines
	{
		"HELIUM_MODULE=EmptyMain",
	}

	includedirs
	{
		"Dependencies/freetype/include",
		"Dependencies/bullet/src",
		"Example",
	}

	links
	{
		"Core.Platform",
		"Core.Foundation",
		"Core.Reflect",
		"Core.Persist",
		"Core.Math",
		"Core.MathSimd",
		prefix .. "Engine",
		prefix .. "EngineJobs",
		prefix .. "Windowing",
		prefix .. "Rendering",
		prefix .. "GraphicsTypes",
		prefix .. "GraphicsJobs",
		prefix .. "Graphics",
		prefix .. "Framework",
		prefix .. "FrameworkWin",
		prefix .. "RenderingD3D9",
		prefix .. "Components",
		prefix .. "Bullet",
		prefix .. "Ois",
		prefix .. "EmptyGame",
	}

	if string.find( project().name, 'Tools.' ) then
		links
		{
			"Tools.PcSupport",
			"Tools.PreprocessingPc",
			"Tools.EditorSupport",
		}
	end

	pchheader( "EmptyMainPch.h" )
	pchsource( "Example/EmptyMain/EmptyMainPch.cpp" )

	Helium.DoBasicProjectSettings()
	Helium.DoFbxProjectSettings()

	-- EmptyMain is a bit odd because it includes custom game objects and a main().
	-- So we need the dll export #defines. But calling DoModuleProjectSettings(...) above
	-- seems to blow away the libs we try to import when we call DoBasicProjectSettings()
	configuration { "windows", "Debug" }
		defines
		{
			"HELIUM_EMPTY_MAIN_EXPORTS",
		}

	if haveGranny then
		configuration { "windows", "x32" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win32",
			}
		configuration { "windows", "x64" }
			libdirs
			{
				"Integrations/Granny/granny_sdk/lib/win64",
			}
		configuration "x32"
			links
			{
				"granny2",
			}
		configuration "x64"
			links
			{
				"granny2_x64",
			}
	end

