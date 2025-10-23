page 78505 "BAC User Headline Segments"
{
    Caption = 'User Headline Segments';
    PageType = List;
    SourceTable = "BAC User Headline Segment";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Headline Segment Code"; Rec."Headline Segment Code")
                {

                }
                field("Headline Segment Description"; Rec."Headline Segment Description")
                {

                }
            }
        }
    }
}