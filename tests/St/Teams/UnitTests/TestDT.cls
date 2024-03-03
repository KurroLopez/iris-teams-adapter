Class St.Teams.UnitTests.TestDT Extends %UnitTest.TestCase
{

Method TestTransform()
{
    set alert = ##class(Ens.AlertRequest).%New()
    set alert.AlertText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis massa."
    set alert.SourceConfigName = "St.Teams.UnitTests.TestDT"
    set alert.AlertTime = $HOROLOG
    set alert.SessionId = 42

    Set tExpected = 1
    set tResults = ##class(St.Teams.DT.EnsAlertToAdaptiveRequest).Transform(alert, .outResult)
    Do $$$AssertEquals(tResults,tExpected,tExpected_" = "_tResults)
    Do $$$AssertEquals(outResult.Type,"message",outResult.Type_" = "_"message")
    Do $$$AssertEquals(outResult.Attachments.GetAt(1).Content.Type,"AdaptiveCard",outResult.Attachments.GetAt(1).Content.Type_" = AdaptiveCard")
    Do $$$AssertEquals(outResult.Attachments.GetAt(1).Content.Body.GetAt(1).Type,"Container",outResult.Attachments.GetAt(1).Content.Body.GetAt(1).Type_" = Container")
    ;Check the SourceConfigName expected
    Do $$$AssertEquals(outResult.Attachments.GetAt(1).Content.Body.GetAt(1).Items.GetAt(2).Text,"St.Teams.UnitTests.TestDT",outResult.Attachments.GetAt(1).Content.Body.GetAt(1).Items.GetAt(2).Text_" = St.Teams.UnitTests.TestDT")
    ;Check the SessionId expected
    Do $$$AssertEquals(outResult.Attachments.GetAt(1).Content.Body.GetAt(1).Items.GetAt(4).Facts.GetAt(1).Value,42,outResult.Attachments.GetAt(1).Content.Body.GetAt(1).Items.GetAt(4).Facts.GetAt(1).Value_" = "_42)
}

}
