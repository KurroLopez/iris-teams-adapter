Class St.Teams.Msg.Common.AttachmentBase Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

/// Contentype of the attachment message
Property ContentType As %String(%JSONFIELDNAME = "contentType", MAXLEN = "");

/// Content of the attachment message
Property Content As St.Teams.Msg.Adaptive.Content(%JSONFIELDNAME = "content");

Storage Default
{
<Data name="AttachmentBaseState">
<Value name="1">
<Value>ContentType</Value>
</Value>
<Value name="2">
<Value>Content</Value>
</Value>
</Data>
<State>AttachmentBaseState</State>
<StreamLocation>^St.Teams.Ms8790.AttachmentBaseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
