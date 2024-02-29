Class St.Teams.Msg.Common.FactItem Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

/// Title of fact item
Property Title As %String(%JSONFIELDNAME = "title", MAXLEN = "");

/// Value of fact item
Property Value As %String(%JSONFIELDNAME = "value", MAXLEN = "");

Storage Default
{
<Data name="FactItemState">
<Value name="1">
<Value>Title</Value>
</Value>
<Value name="2">
<Value>Value</Value>
</Value>
</Data>
<State>FactItemState</State>
<StreamLocation>^St.Teams.Msg.Common.FactItemS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
