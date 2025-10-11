pageextension 78501 "BAC BusinessManager Headlines" extends "Headline RC Business Manager"
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
                    Visible = DefaultFields3Visible;
                }
                field(DocumentationText5; GetDocumentationText(5))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Documentation headline';
                    DrillDown = false;
                    Editable = false;
                    Visible = DefaultFields3Visible;
                }

            }
        }
    }

    trigger OnOpenPage()
    var
        RCSelection: Record "BAC Headline Selection";
    begin
        if not RCSelection.Get(1440) then
            Clear(RCSelection);
        DefaultFields1Visible := RCSelection.Selected and (GetDocumentationText(1) <> '');
        DefaultFields2Visible := RCSelection.Selected and (GetDocumentationText(2) <> '');
        DefaultFields3Visible := RCSelection.Selected and (GetDocumentationText(3) <> '');
        DefaultFields2Visible := RCSelection.Selected and (GetDocumentationText(4) <> '');
        DefaultFields3Visible := RCSelection.Selected and (GetDocumentationText(5) <> '');

    end;

    var
        DefaultFields1Visible: Boolean;
        DefaultFields2Visible: Boolean;
        DefaultFields3Visible: Boolean;


    local procedure GetDocumentationText(inMessage: Integer): Text
    var
        HeadlineMgt: Codeunit "BAC Headline Mgt";
    begin
        Exit(HeadlineMgt.GetUserMessages(inMessage));
    end;
}