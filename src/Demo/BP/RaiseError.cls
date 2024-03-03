/// Raise an error divided by zero
Class Demo.BP.RaiseError Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='errorText' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='200' yend='700' >
<scope xpos='200' ypos='250' xend='200' yend='600' >
<code name='Divided By 0' xpos='200' ypos='350' >
<![CDATA[ set value = 1/0]]>
</code>
<faulthandlers>
<catchall xpos='200' ypos='450' xend='200' yend='450' >
<code name='Capture error' xpos='200' ypos='250' >
<![CDATA[    try {
   // get info about the error that has ocurred
   set errorText = $system.Status.GetErrorText(..%Context.%LastError)   
   if ..%Context.%LastFault'="" {
     set errorText = ..%Context.%LastFault
   }
   
   // make sure the error is shown on the Ensemble log
   $$$LOGERROR("Error trapped: "_errorText)
   
   // save the error text, so we can generate an alert with this text
   set context.errorText = errorText

   } catch ex {
    // an error has happened in the error handling code!
    $$$LOGERROR("Error Handling: "_ex.DisplayString())
   }]]>
</code>
<alert value='context.errorText' xpos='200' ypos='350' />
</catchall>
</faulthandlers>
</scope>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
