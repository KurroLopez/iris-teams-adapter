Class St.Teams.BO.Api.Teams Extends EnsLib.REST.Operation
{

/// Send an adaptive card
Method SendAdaptiveCard(pRequest As St.Teams.Msg.Adaptive.Request, Output pResponse As Ens.StringResponse) As %Status
{
    // Create the message to convert the alert to a Teams Card
    set tSC = ..CallApi(pRequest,.pResponse)
    quit $$$OK
}

Method CallApi(pParameter = "", Output pResponse As Ens.StringResponse) As %Status
{
    #Dim excepcion As %Exception.AbstractException

    set ret = $$$OK
    try
    {
        $$$LOGINFO("HTTPServer: "_..Adapter.HTTPServer)
        set tSC = ..InicializaRest(..Adapter.HTTPServer, .tHttpRequest)
        $$$ThrowOnError(tSC)
        set pResponse = ##class(Ens.StringResponse).%New()

        // The parameters class is serialized as JSon
        set tStream = ##class(%Stream.GlobalCharacter).%New()
        do pParameter.%JSONExportToStream(.tStream)
        $$$LOGINFO("JSON: "_tStream.Read())
        do tHttpRequest.EntityBody.CopyFrom(tStream)

        set tSC = ..Adapter.SendFormDataArray(.tHttpResponse, "POST", tHttpRequest,,,"/")
        if $$$ISERR(tSC) $$$ThrowStatus(tSC)
        // Check status code
        set statusCode = tHttpResponse.StatusCode
        set content = ""
        while (tHttpResponse.Data.AtEnd = 0)
        {
            set content = content_tHttpResponse.Data.Read()
        }

        // If statusCode is not 200, throw the exception and add the error message
        if (statusCode '= 200)
        {
	        $$$TRACE("Content: "_content)
            $$$ThrowStatus($$$ERROR($$$GeneralError, "Error "_statusCode_" - "_content))
        }

        set pResponse.StringValue = content
    }
    catch excepcion
    {
        $$$TRACE("Error: "_excepcion)
        set ret = excepcion.AsStatus()
    }
    
    Quit ret
}

/// Initialize the common parameters to start a HTTPRequest
Method InicializaRest(server As %String, Output pRequest As %Net.HttpRequest) As %Status
{
    set pRequest=##class(%Net.HttpRequest).%New()
	set pRequest.Server = server
    set pRequest.ContentType = "application/json; charset=utf-8"
    Quit $$$OK
}

/// MessageMap
XData MessageMap
{
<MapItems>
    <MapItem MessageType="St.Teams.Msg.Adaptive.Request">
        <Method>SendAdaptiveCard</Method>
    </MapItem>
</MapItems>
}

}
