/// 
Class Demo.Rule.AlertRules Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="Demo.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="1" comment="">
<send transform="St.Teams.DT.EnsAlertToAdaptiveRequest" target="St.Teams.BO.Api.Teams"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
