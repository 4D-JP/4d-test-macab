//%attributes = {"invisible":true}
If (Current process:C322#1)
	
	CALL WORKER:C1389(1; Current method name:C684)
	
Else 
	
	$window:=Open form window:C675("TEST")
	DIALOG:C40("TEST"; *)
	
End if 