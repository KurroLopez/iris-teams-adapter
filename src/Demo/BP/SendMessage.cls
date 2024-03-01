/// Send a personal message
Class Demo.BP.SendMessage Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.StringRequest' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='adaptiveCard' type='St.Teams.Msg.Adaptive.Request' instantiate='0' />
</context>
<sequence xend='200' yend='550' >
<code name='Prepare message' xpos='200' ypos='250' >
<![CDATA[ set context.adaptiveCard = ##class(St.Teams.Msg.Adaptive.Request).%New()
 set attach = ##class(St.Teams.Msg.Adaptive.Attachment).%New()
 set content = ##class(St.Teams.Msg.Adaptive.Content).%New()
 
 set container = ##class(St.Teams.Msg.Common.Item).%New()
 set container.Type = "Container"
 
 set item1=##class(St.Teams.Msg.Common.Item).%New()
 set item1.Type = "TextBlock"
 set item1.Text = "Personal message"
 set item1.Weight = "bolder"
 set item1.Size = "large"
 
 set item2=##class(St.Teams.Msg.Common.Item).%New()
 set item2.Type = "TextBlock"
 set item2.Text = request.StringValue
 set item2.Wrap = 1
 
 do container.Items.Insert(item1)
 do container.Items.Insert(item2)
 
 do content.Body.Insert(container)
 set attach.Content = content

 do context.adaptiveCard.Attachments.Insert(attach)]]>
</code>
<call name='Call API' target='St.Teams.BO.Api.Teams' async='1' xpos='200' ypos='350' >
<request type='St.Teams.Msg.Adaptive.Request' >
<assign property="callrequest" value="context.adaptiveCard" action="set" />
</request>
<response type='Ens.StringResponse' />
</call>
<sync name='Wait Call APi' calls='Call API' type='all' xpos='200' ypos='450' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
