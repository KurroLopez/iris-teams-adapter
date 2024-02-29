Class St.Teams.Msg.Common.Base Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

/// Type of message
Property Type As %String(%JSONFIELDNAME = "type") [ InitialExpression = "message" ];

/// List of attachments cards
Property Attachments As list Of St.Teams.Msg.Common.AttachmentBase(%JSONFIELDNAME = "attachments", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="BaseState">
<Value name="1">
<Value>Type</Value>
</Value>
<Value name="2">
<Value>Attachments</Value>
</Value>
</Data>
<State>BaseState</State>
<StreamLocation>^St.Teams.Msg.Common.BaseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
