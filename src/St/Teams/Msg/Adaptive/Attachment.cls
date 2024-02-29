Class St.Teams.Msg.Adaptive.Attachment Extends St.Teams.Msg.Common.AttachmentBase
{

/// Description
Method %OnNew() As %Status
{
    set valid = $$$OK
    set ..ContentType = "application/vnd.microsoft.card.adaptive"
    set valid = ..%ValidateObject() // validate the new object
    quit valid
}

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
