page 78503 "BAC About Headline Messages"
{
    Caption = 'About Headline Messages';
    PageType = Card;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            group("About AL Translation Tool")
            {

                Caption = 'About Headline Message';
                InstructionalText = 'Open-Source Headline Message app. Source code can be located at https://github.com/peikba/HeadlineMessages.';
                ShowCaption = false;
            }
            grid("App")
            {
                ShowCaption = false;
                GridLayout = Columns;
                group("Group2")
                {
                    ShowCaption = false;
                    field("Version"; AppVersion)
                    {
                        Caption = 'Version';
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(AppName; AppName)
                    {
                        Caption = 'App Name';
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(AppPublisher; AppPublisher)
                    {
                        Caption = 'App Publisher';
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
            }
        }
    }
actions
{
    area(Processing)
    {
        action(Disclaimer)
        {
            Caption='Disclaimer';
            image=Warning;
            Promoted=true;
            PromotedCategory=Process;
            ApplicationArea=all;
            trigger OnAction()
            begin
                Hyperlink('https://ba-consult.dk/downloads/warrenty.txt');                
            end;
        }
    }
}
    var
        AppVersion: Text[10];
        AppName: Text;
        AppPublisher: Text;
        AppModuleInfo: ModuleInfo;

    trigger OnOpenPage()
    begin
        if NavApp.GetCurrentModuleInfo(AppModuleInfo) then begin
            AppVersion := format(AppModuleInfo.AppVersion);
            AppName := AppModuleInfo.Name;
            AppPublisher := AppModuleInfo.Publisher;
        end;
    end;
}