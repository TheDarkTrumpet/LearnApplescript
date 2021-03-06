-- Download Bibliographic Metadata
-- (c) Kai Müller May 05, 2019
-- Renamed, simplified, enhanced and updated for smart rules by Christian Grunenberg

-- 	1. Retrieves the digital object identifier (DOI) of the document 
--	2. Downloads bibliographic metadata, renames document to title and sets DOI, ISSN, Link, Date, Journal, Volume, Issue, Publisher, Type, Authors and Citation
--	NOTE: Every downloaded PDF publication (e.g. from Google Scholar or any Journal) might work.

on performSmartRule(theRecords)
	tell application id "DNtp"
		try
			show progress indicator "Downloading Bibliographic Metadata" steps (count of theRecords) without cancel button
			
			repeat with theRecord in theRecords
				set theName to name of theRecord
				step progress indicator theName
				
				try
					set customMetaData to custom meta data of theRecord
					set doi to mddoi of customMetaData
					if doi begins with "http://dx.doi.org/" then
						set doi to (characters 19 thru -1 of doi) as string
					else if doi begins with "https://dx.doi.org/" then
						set doi to (characters 20 thru -1 of doi) as string
					end if
				on error
					set doi to ""
					try
						set doi to digital object identifier of theRecord
						if doi is missing value then error
					on error
						set doi to ""
					end try
				end try
				
				if doi is not "" then
					try
						add custom meta data doi for "doi" to theRecord
						
						set the doi to "http://dx.doi.org/" & doi
						set the json_record to download JSON from doi
						
						set theRecord's name to (title of json_record) as string
						
						try
							set the json_created to created of json_record
							add custom meta data |date-time| of json_created for "date" to theRecord
						end try
						
						try
							if exists (|published-print| of json_record) then
								set pubyear to item 1 of item 1 of |date-parts| of |published-print| of json_record
							else
								set pubyear to item 1 of item 1 of |date-parts| of |published-online| of json_record
							end if
							
							set the authors to author of json_record
							set the citation to ""
							set cnt to count of authors
							
							if cnt < 3 then
								repeat with i from 1 to cnt
									set author to item i of authors
									if i > 1 then
										set citation to citation & " & " & family of author
									else
										set citation to citation & family of author
									end if
								end repeat
							else if cnt > 0 then
								set author to item 1 of authors
								set citation to family of author & " et al."
							end if
							
							add custom meta data (citation & " " & pubyear) for "citation" to theRecord
							
							set the authorsList to ""
							repeat with author in authors
								set authorsList to authorsList & |given| of author
								set authorsList to authorsList & " " & family of author & return -- return ensures that DEVONthink automatically defines this field as text and not as a string
							end repeat
							
							add custom meta data authorsList for "authors" to theRecord
						end try
						
						try
							set the articletype to |type| of json_record
							add custom meta data articletype for "type" to theRecord
						end try
						
						try
							set the link to |URL| of json_record
							add custom meta data link for "link" to theRecord
						end try
						
						try
							set the publisher to publisher of json_record
							add custom meta data publisher for "publisher" to theRecord
						end try
						
						try
							set the issn to item 1 of issn of json_record
							add custom meta data issn for "is?n" to theRecord
						end try
						
						try
							set the journal to |container-title| of json_record
							add custom meta data journal for "journal" to theRecord
						end try
						
						try
							set the volume to volume of json_record
							add custom meta data volume for "volume" to theRecord
						end try
						
						try
							set the issue to issue of json_record
							add custom meta data issue for "issue" to theRecord
						end try
						
						try
							set the page to page of json_record
							add custom meta data page for "page" to theRecord
						end try
					on error error_message number error_number
						log message theName info error_message
					end try
				end if
			end repeat
			
			hide progress indicator
		on error error_message number error_number
			hide progress indicator
			if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
		end try
	end tell
end performSmartRule
