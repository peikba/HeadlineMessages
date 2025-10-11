page 78502 "BAC Headline Pages"
{
    Caption = 'Headline Pages';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = AllObjWithCaption;
    SourceTableView = where("Object Type" = const(Page), "Object Subtype" = const('HeadlinePart'));

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
                field("Object Type"; Rec."Object Type")
                {

                }
                field("Object Subtype"; Rec."Object Subtype")
                {

                }
                field(FieldSelected; FieldSelected)
                {
                    Caption = 'Headline Selected';
                    trigger OnValidate()
                    var
                        RCSelection: Record "BAC Headline Selection";
                    begin
                        if RCSelection.Get(Rec."Object ID") then begin
                            RCSelection.Selected := FieldSelected;
                            RCSelection.Modify();
                        end else begin
                            RCSelection.Init();
                            RCSelection."Object ID" := Rec."Object ID";
                            RCSelection.Selected := FieldSelected;
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

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin
                    //Rec.GetOrCreateHeadline();                   
                end;
            }
        }
    }
    var
        FieldSelected: Boolean;
        RoleCenterFilter: Text;

    trigger OnAfterGetRecord()
    var
        RCSelection: Record "BAC Headline Selection";
    begin
        if RCSelection.Get(Rec."Object ID") then begin
            FieldSelected := RCSelection.Selected;
        end else
            Clear(FieldSelected);
    end;

    trigger OnOpenPage()
    begin
        exit;
        RoleCenterFilter := '1442|'; //Accountant
        RoleCenterFilter += '1441|'; //Order Processor
        RoleCenterFilter += '1440|'; //Business Manager
        RoleCenterFilter += '1456|'; //Whse Basic
        RoleCenterFilter += '1446|'; //Team Member
        RoleCenterFilter += '1447|'; //Prod Planner
        RoleCenterFilter += '1445|'; //Aministrator
        RoleCenterFilter += '1455|'; //Ship & Receive
        RoleCenterFilter += '1457|'; //Whse Worker
        RoleCenterFilter += '1443|'; //Project Manager
        RoleCenterFilter += '1448|'; //Service Dispatcher
        RoleCenterFilter += '1444|'; //Relarionship Mgr
        AddRCHeadlinePagesToSelection(RoleCenterFilter);
        if RoleCenterFilter.EndsWith('|') then
            RoleCenterFilter := DelChr(RoleCenterFilter, '>', '|');
        Rec.SetFilter("Object ID", RoleCenterFilter);
    end;

    [IntegrationEvent(false, false)]
    local procedure AddRCHeadlinePagesToSelection(var AddedRCHeadlineObjectID: Text)
    begin
    end;
}