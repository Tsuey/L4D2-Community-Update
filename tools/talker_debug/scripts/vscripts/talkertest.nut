//-----------------------------------------------------
Msg("Activating test.nut file\n");

// Include the VScript Library
IncludeScript("VSlib/VSLib.nut");

function Notifications::OnConcept::TestConcept( query )
{
	// Information
	// query is the table of data about the concept that just fired
	
	// If the concept is "TLK_REMARK" or "TLK_IDLE" just return so it isn't too spammy
	if ( query.concept == "TLK_REMARK" || query.concept == "TLK_IDLE" )
		return;
	
	// General print of the concept name in-console
	printl("Concept: " + query.concept);
	Utils.PrintTable(query);
}
