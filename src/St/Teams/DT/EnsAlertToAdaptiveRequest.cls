Class St.Teams.DT.EnsAlertToAdaptiveRequest Extends Ens.DataTransformDTL [ DependsOn = (Ens.AlertRequest, St.Teams.Msg.Adaptive.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Ens.AlertRequest' targetClass='St.Teams.Msg.Adaptive.Request' create='new' language='objectscript' >
<annotation>Convert a Ens.AlertRequest to a Adpative Card request</annotation>
<assign value='##class(St.Teams.Msg.Adaptive.Attachment).%New()' property='target.Attachments.(1)' action='set' />
<assign value='##class(St.Teams.Msg.Adaptive.Content).%New()' property='target.Attachments.(1).Content' action='set' />
<assign value='"Container"' property='target.Attachments.(1).Content.Body.(1).Type' action='set' />
<assign value='"TextBlock"' property='target.Attachments.(1).Content.Body.(1).Items.(1).Type' action='set' />
<assign value='"Unhandled error"' property='target.Attachments.(1).Content.Body.(1).Items.(1).Text' action='set' />
<assign value='"bolder"' property='target.Attachments.(1).Content.Body.(1).Items.(1).Weight' action='set' />
<assign value='"medium"' property='target.Attachments.(1).Content.Body.(1).Items.(1).Size' action='set' />
<assign value='"TextBlock"' property='target.Attachments.(1).Content.Body.(1).Items.(2).Type' action='set' />
<assign value='source.SourceConfigName  ' property='target.Attachments.(1).Content.Body.(1).Items.(2).Text' action='set' />
<assign value='"bolder"' property='target.Attachments.(1).Content.Body.(1).Items.(2).Weight' action='set' />
<assign value='"small"' property='target.Attachments.(1).Content.Body.(1).Items.(2).Size' action='set' />
<assign value='1' property='target.Attachments.(1).Content.Body.(1).Items.(2).IsSubtitle' action='set' />
<assign value='"TextBlock"' property='target.Attachments.(1).Content.Body.(1).Items.(3).Type' action='set' />
<assign value='"1"' property='target.Attachments.(1).Content.Body.(1).Items.(3).Wrap' action='set' />
<assign value='source.AlertText' property='target.Attachments.(1).Content.Body.(1).Items.(3).Text' action='set' />
<assign value='"FactSet"' property='target.Attachments.(1).Content.Body.(1).Items.(4).Type' action='set' />
<assign value='"SessionId"' property='target.Attachments.(1).Content.Body.(1).Items.(4).Facts.(1).Title' action='set' />
<assign value='source.SessionId' property='target.Attachments.(1).Content.Body.(1).Items.(4).Facts.(1).Value' action='set' />
<assign value='"Time"' property='target.Attachments.(1).Content.Body.(1).Items.(4).Facts.(2).Title' action='set' />
<assign value='source.AlertTime' property='target.Attachments.(1).Content.Body.(1).Items.(4).Facts.(2).Value' action='set' />
</transform>
}

}
