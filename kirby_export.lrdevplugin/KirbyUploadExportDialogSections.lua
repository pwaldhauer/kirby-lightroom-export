
local LrView = import 'LrView'


KirbyUploadExportDialogSections = {}

-------------------------------------------------------------------------------

local function updateExportStatus( propertyTable )
	
	local message = nil
	
	repeat

		if propertyTable.kirbyUrl == nil then
			message = LOC "$$$/KirbyUpload/ExportDialog/Messages/SelectPreset=URL nicht vergessen"
			break
		end
		

	until true
	
	if message then
		propertyTable.message = message
		propertyTable.hasError = true
		propertyTable.hasNoError = false
		propertyTable.LR_cantExportBecause = message
	else
		propertyTable.message = nil
		propertyTable.hasError = false
		propertyTable.hasNoError = true
		propertyTable.LR_cantExportBecause = nil
	end
	
end

-------------------------------------------------------------------------------

function KirbyUploadExportDialogSections.startDialog( propertyTable )
	
	propertyTable:addObserver( 'items', updateExportStatus )
	propertyTable:addObserver( 'kirbyUrl', updateExportStatus )

	updateExportStatus( propertyTable )
	
end

-------------------------------------------------------------------------------

function KirbyUploadExportDialogSections.sectionsForBottomOfDialog( _, propertyTable )

	local f = LrView.osFactory()
	local bind = LrView.bind
	local share = LrView.share

	local result = {
	
		{
			title = LOC "$$$/KirbyUpload/ExportDialog/KirbySettings=Kirby-Instanz",
			
			synopsis = bind { key = 'fullPath', object = propertyTable },
			
			f:row {
				f:static_text {
					title = LOC "$$$/KirbyUpload/ExportDialog/Destination=URL:",
					alignment = 'right',
					width = share 'labelWidth'
				},

				f:edit_field {
					value = bind 'kirbyUrl',
					enabled = true,
					truncation = 'middle',
					immediate = true,
					fill_horizontal = 1,
				},
	
				
			},

		
		},
	}
	
	return result
	
end
