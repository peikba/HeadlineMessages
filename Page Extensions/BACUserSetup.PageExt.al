pageextension 78515 "BAC User Setup" extends "User Setup"
{

    actions
    {
        addlast(Processing)
        {
            action(HeadlineSegments)
            {
                Caption = 'User Headline Segments';
                ToolTip = 'Select the segments attached to this user';
                Image = Departments;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "BAC User Headline Segments";
                RunPageLink = "User ID" = field("User ID");
            }
        }
    }
}