Class St.Teams.BO.Api.Teams Extends EnsLib.REST.Operation
{

/// Send an adaptive card
Method SendAdaptiveCard(pRequest As St.Teams.Msg.Adaptive.Request, Output pResponse As Ens.StringResponse) As %Status
{
    // Create the message to convert the alert to a Teams Card
    set message = ##class(St.Teams.Msg.Adaptive.Request).New()
    set tSC = ..CallApi(pRequest,.apiResponse)
    set pResponse = ##class(Ens.StringResponse).%New(apiResponse)
    quit $$$OK
}

Method CallApi(pParameter = "", Output pResponse As %String) As %Status
{
    #Dim excepcion As %Exception.AbstractException

    set ret = $$$OK
    try
    {
        set tSC = ..initializeRest(.tHttpRequest)
        $$$ThrowOnError(tSC)

        // The parameters class is serialized as JSon
        set tStream = ##class(%Stream.GlobalCharacter).%New()
        do pParameter.%JSONExportToStream(.tStream)
        do tHttpRequest.EntityBody.CopyFrom(tStream)

        set tSC = ..Adapter.SendFormDataArray(.tHttpResponse, "POST", tHttpRequest,,,url)
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
            set objError = ##class(%DynamicAbstractObject).%FromJSON(content)
            $$$ThrowStatus($$$ERROR($$$GeneralError, "Error "_statusCode_" - "_objError))
        }

        set pResponse = ##class(%DynamicAbstractObject).%FromJSON(content)
    }
    catch excepcion
    {
        set ret = excepcion.AsStatus()
    }
    
    Quit ret
}

/// Initialize the common parameters to start a HTTPRequest
Method initializeRest(Output pRequest As %Net.HttpRequest) As %Status
{
    set pRequest=##class(%Net.HttpRequest).%New()
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
