/// an example of Installer class just to create a new clear namespace and database IRISAPP
Class Installer Extends St.Tools.Deploy
{

Parameter PRODUCTION = "Demo.Production";

ClassMethod setupInit() As %Status
{
  // Deploy the items of demo
  do ..AddItem(,"St.Teams.BO.Api.Teams","St.Teams.BO.Api.Teams")
  do ..AddItem(,"Ens.Alert","EnsLib.MsgRouter.RoutingEngine")
  
  quit $$$OK
}

}
