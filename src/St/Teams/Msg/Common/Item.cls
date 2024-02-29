Class St.Teams.Msg.Common.Item Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

/// Type of Item
Property Type As %String(%JSONFIELDNAME = "type", VALUELIST = ",TextBlock,Container,ColumnSet,Column,FactSet") [ Required ];

/// Text of the item
Property Text As %String(%JSONFIELDNAME = "text", MAXLEN = "");

/// Weight of the text.
/// Values: default, lighter o bolder
Property Weight As %String(%JSONFIELDNAME = "weight", VALUELIST = ",default,lighter,bolder") [ InitialExpression = "default" ];

/// Size of the characters
/// Values: default, small, medium, large or extraLarge
Property Size As %String(%JSONFIELDNAME = "size", VALUELIST = ",default,small,medium,large,extraLarge") [ InitialExpression = "default" ];

/// Width of Column (only for Type Column)
Property Width As %String(%JSONFIELDNAME = "width", VALUELIST = ",auto,stretch") [ InitialExpression = "auto" ];

/// Height of Column (only for Type Column)
Property Height As %String(%JSONFIELDNAME = "height", VALUELIST = ",auto,stretch") [ InitialExpression = "auto" ];

/// Set the text as subtitle
Property IsSubtitle As %Boolean(%JSONFIELDNAME = "isSubtle") [ InitialExpression = 0 ];

/// Set wrap text
Property Wrap As %Boolean(%JSONFIELDNAME = "wrap") [ InitialExpression = 0 ];

/// Items attached (other columns, TextBlock, etc..)
Property Items As list Of St.Teams.Msg.Common.Item(%JSONFIELDNAME = "items", XMLPROJECTION = "ELEMENT");

/// Items of columns (Only fgor type ColumnSet)
Property Columns As list Of St.Teams.Msg.Common.Item(%JSONFIELDNAME = "columns", XMLPROJECTION = "ELEMENT");

/// Fact items list
Property Facts As list Of St.Teams.Msg.Common.FactItem(%JSONFIELDNAME = "facts", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="ItemState">
<Value name="1">
<Value>Type</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
<Value name="3">
<Value>Weight</Value>
</Value>
<Value name="4">
<Value>Size</Value>
</Value>
<Value name="5">
<Value>Width</Value>
</Value>
<Value name="6">
<Value>Height</Value>
</Value>
<Value name="7">
<Value>IsSubtitle</Value>
</Value>
<Value name="8">
<Value>Wrap</Value>
</Value>
<Value name="9">
<Value>Items</Value>
</Value>
<Value name="10">
<Value>Columns</Value>
</Value>
<Value name="11">
<Value>Facts</Value>
</Value>
</Data>
<State>ItemState</State>
<StreamLocation>^St.Teams.Msg.Common.ItemS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
