pageextension 60102 "CDC Purch. Invoice Match Ext." extends "CDC Purch. Invoice Match"
{
    actions
    {
        addlast(Functions)
        {
            action("CDC ApplyMacthFilters")
            {
                CaptionML = ENU = 'Apply customer Filters', ESP = 'Aplicar filltros personalizados';
                ApplicationArea = All;
                Image = ContactFilter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTipML = ENU = 'Apply custom filters setup on template card.', ESP = 'Aplica los filtros personalizados configurados desde la ficha de plantilla';
                trigger OnAction();
                begin
                    CurrPage.ReceiptLines.PAGE.SetFilters(Rec);
                end;
            }
        }
        addlast(Template)
        {
            action("CDC OpenMatchFilters")
            {
                CaptionML = ENU = 'Open customer Filters', ESP = 'Abrir filltros personalizados';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Image = FilterLines;
                ToolTipML = ENU = 'Open custom filters setup.', ESP = 'Aplica los filtros personalizados';
                trigger OnAction()
                var
                    MatchFilters: Record "CDC Match Filters";
                    MatchFilterPage: page "CDC Match Filters";
                begin
                    MatchFilters.SetRange("Template No.", Rec."Template No.");
                    MatchFilterPage.SetTableView(MatchFilters);
                    MatchFilterPage.run;
                end;

            }
        }
    }
}