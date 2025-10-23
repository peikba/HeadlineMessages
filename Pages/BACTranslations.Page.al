page 78501 "BAC Translations"
{
    Caption = 'Translations';
    PageType = List;
    SourceTable = "BAC Headline Translation";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(DocumentText)
            {
                Caption = 'Document Text';
                field(HeadlineSetup; HeadlineSetup."Default Message Text")
                {
                    Editable = false;
                }

            }
            repeater(GroupName)
            {
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the language code for the Translation';
                }
                field(Translation; Rec.Translation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Translation for the Default Document Text - %1 in the text will insert the company name';

                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        HeadlineSetup.Get();
    end;

    var
        HeadlineSetup: Record "BAC Headline Setup";
}