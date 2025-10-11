pageextension 78508 "BAC Serv.Dispatcher Headlines" extends "Headline RC Serv. Dispatcher"
{
    layout
    {
        addlast(content)
        {
            group("BAC Messages")
            {
                ShowCaption = false;
                field(DocumentationText1; GetDocumentationText(1))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Documentation headline';
                    DrillDown = false;
                    Editable = false;
                    Visible = DefaultFields1Visible;
                }
                field(DocumentationText2; GetDocumentationText(2))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Documentation headline';
                    DrillDown = false;
                    Editable = false;
                    Visible = DefaultFields2Visible;
                }
                field(DocumentationText3; GetDocumentationText(3))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Documentation headline';
                    DrillDown = false;
                    Editable = false;
                    Visible = DefaultFields3Visible;
                }
                field(DocumentationText4; GetDocumentationText(4))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Documentation headline';
                    DrillDown = false;
                    Editable = false;
                    Visible = DefaultFields4Visible;
                }
                field(DocumentationText5; GetDocumentationText(5))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Documentation headline';
                    DrillDown = false;
                    Editable = false;
                    Visible = DefaultFields5Visible;
                }

            }
        }
    }

    trigger OnOpenPage()
    var
        RCSelection: Record "BAC Headline Selection";
    begin
        if not RCSelection.Get(1448) then
            Clear(RCSelection);
        DefaultFields1Visible := RCSelection.Selected and (GetDocumentationText(1) <> '');
        DefaultFields2Visible := RCSelection.Selected and (GetDocumentationText(2) <> '');
        DefaultFields3Visible := RCSelection.Selected and (GetDocumentationText(3) <> '');
        DefaultFields3Visible := RCSelection.Selected and (GetDocumentationText(4) <> '');
        DefaultFields4Visible := RCSelection.Selected and (GetDocumentationText(5) <> '');
    end;

    var
        DefaultFields1Visible: Boolean;
        DefaultFields2Visible: Boolean;
        DefaultFields3Visible: Boolean;
        DefaultFields4Visible: Boolean;
        DefaultFields5Visible: Boolean;


    local procedure GetDocumentationText(inMessage: Integer): Text
    var
        HeadlineMgt: Codeunit "BAC Headline Mgt";
    begin
        Exit(HeadlineMgt.GetUserMessages(inMessage));
    end;
}