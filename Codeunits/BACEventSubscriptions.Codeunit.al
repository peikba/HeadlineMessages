codeunit 78500 "BAC Event Subscriptions"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"RC Headlines Page Common", OnAfterCreateDocumentationText, '', false, false)]
    local procedure SetHeadlineText(var DocumentationText: Text[250])
    var
        CompanyInf: Record "Company Information";
        DocumentText: Text[250];
        HeadlineTranslation: Record "BAC Headline Translation";
        Language: Record Language;

    begin
        if not HeadlineSetup.Get() then
            exit;
        CompanyInf.Get();
        if HeadlineSetup."Default Message Text" <> '' then begin
            DocumentText := HeadlineSetup."Default Message Text";
            Language.SetRange("Windows Language ID", GlobalLanguage);
            if Language.FindFirst() then
                if HeadlineTranslation.Get(0, Language.Code) then
                    DocumentText := HeadlineTranslation.Translation;
            if DocumentText.Contains('%1') then
                DocumentationText := StrSubstNo(DocumentText, CompanyInf.Name)
            else
                DocumentationText := HeadlineSetup."Default Message Text";
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"RC Headlines Page Common", OnAfterDocumentationUrlTxt, '', false, false)]
    local procedure SetDocumentationURL(var Result: Text)
    begin
        if not HeadlineSetup.Get() then
            exit;
        if HeadlineSetup."Default Message URL" <> '' then
            Result := HeadlineSetup."Default Message URL";
    end;

    var
        HeadlineSetup: Record "BAC Headline Setup";
}