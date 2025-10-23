page 78500 "BAC Headline Setup"
{
    Caption = 'Headline Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BAC Headline Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                Visible = ShowEssentialBusinessHeadlinesWarning;
                field(EssentialBusinessHeadlinesWarningText; EssentialBusinessHeadlinesWarningText)
                {
                    Editable = false;
                    ShowCaption = false;
                    Visible = ShowEssentialBusinessHeadlinesWarning;
                    MultiLine = true;
                }
            }
            group(Heading)
            {
                Caption = 'General';
                field("Default Message Text"; Rec."Default Message Text")
                {
                    Caption = 'Default Message Text';
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Enter the Default Document Text to be shown on the Role Center - %1 in the text will insert the company name';
                }
                field("Default Message URL"; Rec."Default Message URL")
                {
                    Caption = 'Default Message URL';
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Enter the URL to be used on the Role Center when clicking on the headline';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Translations)
            {
                Caption = 'Translations';
                Promoted = true;
                PromotedCategory = Process;
                Image = List;
                RunObject = page "BAC Translations";
                ApplicationArea = All;
            }
            action(HeadlineSelections)
            {
                Caption = 'Headline Selections';
                ToolTip = 'Define which headline pages should be included';
                Promoted = true;
                PromotedCategory = Process;
                Image = List;
                RunObject = page "BAC Headline Pages";
                ApplicationArea = All;
            }
            action(HeadlineSegments)
            {
                Caption = 'Headline Segments';
                ToolTip = 'Define the entities to receive messages e.g. departments';
                Promoted = true;
                PromotedCategory = Process;
                Image = List;
                RunObject = page "BAC Headline Segments";
                ApplicationArea = All;
            }
            action(UserSetup)
            {
                Caption = 'User Setup';
                ToolTip = 'Define Which Users belong to which segments';
                Promoted = true;
                PromotedCategory = Process;
                Image = List;
                RunObject = page "User Setup";
                ApplicationArea = All;
            }
            action(Messages)
            {
                Caption = 'Messages';
                ToolTip = 'Define the messages to be sent to each segment';
                Promoted = true;
                PromotedCategory = Process;
                Image = List;
                RunObject = page "BAC Headline Messages";
                ApplicationArea = All;
            }
        }
    }

    var
        ShowEssentialBusinessHeadlinesWarning: Boolean;
        EssentialBusinessHeadlinesWarningText: Text;

    trigger OnOpenPage()
    var
        PublishedApp: Record "NAV App Installed App";
        EssentialBusinessHeadlinesWarninglbl: Label 'The Extension %1 is installed in the system. This will prevent the headline of the %2 to be shown. Uninstall Extension %1 to have the %2 shown. All other messages will still appear';
    begin
        if not rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        PublishedApp.SetRange("App ID", '2a89f298-7ffd-44a5-a7ce-e08dac98abce');
        ShowEssentialBusinessHeadlinesWarning := PublishedApp.FindFirst();
        if ShowEssentialBusinessHeadlinesWarning then
            EssentialBusinessHeadlinesWarningText := StrSubstNo(EssentialBusinessHeadlinesWarninglbl, PublishedApp.Name, Rec.FieldCaption("Default Message Text"));
    end;
}