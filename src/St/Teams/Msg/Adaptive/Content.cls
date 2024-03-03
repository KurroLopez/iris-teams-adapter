Class St.Teams.Msg.Adaptive.Content Extends St.Teams.Msg.Common.ContentBase
{

/// Description
Method %OnNew() As %Status
{
    set valid = $$$OK
    set ..Type = "AdaptiveCard"
    set ..Schema = "http://adaptivecards.io/schemas/adaptive-card.json"
    set ..Version = "1.2"
    set valid = ..%ValidateObject() // validate the new object
    quit valid
}

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
