set the_folder to path to desktop
tell application "Database Events"
  set the_db to make new database with properties {name:"cars", location:the_folder}
  tell the_db
	 set the_record to make new record with properties {name:"Toyota"}
	 make new record with properties {name:"Mercedes"}
  end tell
  tell the_record
	 make new field with properties {name:"Make", value:"Toyota"}
	 make new field with properties {name:"Model", value:"Camry"}
	 make new field with properties {name:"Year", value:1993}
  end tell
  tell record "Mercedes" of the_db
	 make new field with properties {name:"Make", value:"Mercedes-Benz"}
	 make new field with properties {name:"Model", value:"300TD"}
	 make new field with properties {name:"Year", value:1997}
  end tell
  save the_db
end tell


