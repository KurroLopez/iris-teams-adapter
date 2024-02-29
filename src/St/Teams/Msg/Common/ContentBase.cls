Class St.Teams.Msg.Common.ContentBase Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

/// Type of attachment
Property Type As %String(%JSONFIELDNAME = "type");

/// Schema of the attachment
Property Schema As %String(%JSONFIELDNAME = "$schema", MAXLEN = "");

/// Version of the card
Property Version As %String(%JSONFIELDNAME = "version");

/// Collection of items to create the body of the content
Property Body As list Of St.Teams.Msg.Common.Item(%JSONFIELDNAME = "body", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="ContentBaseState">
<Value name="1">
<Value>Type</Value>
</Value>
<Value name="2">
<Value>Schema</Value>
</Value>
<Value name="3">
<Value>Version</Value>
</Value>
<Value name="4">
<Value>Body</Value>
</Value>
</Data>
<State>ContentBaseState</State>
<StreamLocation>^St.Teams.Msg.C8790.ContentBaseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
