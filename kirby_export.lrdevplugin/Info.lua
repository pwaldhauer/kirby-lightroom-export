return {

	LrSdkVersion = 3.0,
	LrSdkMinimumVersion = 1.3, -- minimum SDK version required by this plug-in

	LrToolkitIdentifier = 'io.pwa.kirbyexport',

	LrPluginName = LOC "$$$/KirbyExport/PluginName=Kirby Export",
	
	LrExportServiceProvider = {
		title = "KirbyExport",
		file = 'KirbyUploadServiceProvider.lua',
	},

	VERSION = { major=1, minor=0, revision=0, build="20220711", },

}
