-- Lightroom API
local LrPathUtils = import 'LrPathUtils'
local LrFileUtils = import 'LrFileUtils'
local LrHttp = import "LrHttp"


--============================================================================--

KirbyUploadTask = {}

--------------------------------------------------------------------------------

function KirbyUploadTask.processRenderedPhotos( functionContext, exportContext )

	local exportSession = exportContext.exportSession
	local exportParams = exportContext.propertyTable

	local nPhotos = exportSession:countRenditions()

	local progressScope = exportContext:configureProgress {
						title = nPhotos > 1
							   and LOC( "$$$/KirbyUpload/Upload/Progress=Uploading ^1 photos via KirbyExport", nPhotos )
							   or LOC "$$$/KirbyUpload/Upload/Progress/One=Uploading one photo via KirbyExport",
					}
	

	for _, rendition in exportContext:renditions{ stopIfCanceled = true } do
	
		local success, pathOrMessage = rendition:waitForRender()
		
	
		if progressScope:isCanceled() then break end
		
		if success then

			local filename = LrPathUtils.leafName( pathOrMessage )

			local content = { 
              {
                name = 'exportFile',
                fileName = filename,
                filePath = pathOrMessage
              }
            }


      local response, debug = LrHttp.postMultipart( exportContext.propertyTable.kirbyUrl, content )
			
			LrFileUtils.delete( pathOrMessage )
					
		end
		
	end
	
end
