/// an example of Installer class just to create a new clear namespace and database IRISAPP
Class Demo.Installer Extends St.Tools.Deploy
{

Parameter PRODUCTION = "Demo.Production";

ClassMethod setupInit() As %Status
{
  // Deploy the items of demo
  do ..AddItem(,"St.Teams.BO.Api.Teams","St.Teams.BO.Api.Teams")
  do ..AddItem(,"Demo.BP.RaiseError","Demo.BP.RaiseError")
  do ..AddItem(,"Demo.BP.SendMessage","Demo.BP.SendMessage")
  do ..AddDefaultSetting(,"St.Teams.BO.Api.Teams",,"SSLConfig","pm.community.intersystems.com")
  quit $$$OK
}

}
