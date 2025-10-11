page 78503 "BAC Select RoleCenters"
{
    Caption = 'Select RoleCenters';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = AllObjWithCaption;
    SourceTableView = where("Object Type" = const(Page), "Object Subtype" = filter('RoleCenter'));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Object ID"; Rec."Object ID")
                {

                }
                field("Object Name"; Rec."Object Name")
                {

                }
                field(RoleCenterSelected; RoleCenterSelected)
                {
                    trigger OnValidate()
                    var
                        RCSelection: Record "BAC Headline Selection";
                    begin
                        if RCSelection.Get(Rec."Object ID") then begin
                            RCSelection.Selected := RoleCenterSelected;
                            RCSelection.Modify();
                        end else begin
                            RCSelection.Init();
                            RCSelection."Object ID" := Rec."Object ID";
                            RCSelection.Insert();
                        end;
                    end;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    trigger OnAfterGetRecord()
    var
        RCSelection: Record "BAC Headline Selection";
    begin
        if RCSelection.Get(Rec."Object ID") then
            RoleCenterSelected := RCSelection.Selected
        else
            clear(RoleCenterSelected);
    end;

    var
        RoleCenterSelected: Boolean;
}