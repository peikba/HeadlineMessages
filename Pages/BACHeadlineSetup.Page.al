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
                Caption = 'General';
                field("Default Document Text"; Rec."Default Document Text")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Default Document Text to be shown on the Role Center - %1 in the text will insert the company name';
                }
                field("Default Document URL"; Rec."Default Document URL")
                {
                    ApplicationArea = All;
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
        myInt: Integer;

    trigger OnOpenPage()
    begin
        if not rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}