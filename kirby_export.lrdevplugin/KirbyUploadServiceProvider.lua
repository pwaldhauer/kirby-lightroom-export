require "KirbyUploadExportDialogSections"
require "KirbyUploadTask"


return {
	
	hideSections = { 'exportLocation' },

	allowFileFormats = nil, -- nil equates to all available formats
	
	allowColorSpaces = nil, -- nil equates to all color spaces

	exportPresetFields = {
		{ key = 'kirbyUrl', default = 'https://example.com' },
	},

	startDialog = KirbyUploadExportDialogSections.startDialog,
	sectionsForTopOfDialog = KirbyUploadExportDialogSections.sectionsForBottomOfDialog,
	
	processRenderedPhotos = KirbyUploadTask.processRenderedPhotos,
	
}
