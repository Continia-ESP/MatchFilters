pageextension 60101 "CDC Template Card Ext." extends "CDC Template Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Functions)
        {
            action("CDC OpenMacthFilters")
            {
                CaptionML = ENU = 'Open Match Filters', ESP = 'Abrir filtros personalizados';
                ApplicationArea = All;
                Image = FilterLines;
                ToolTipML = ENU = 'Open page to define custom filters', ESP = 'Abre la página para definir los filtros personalizados.';
                trigger OnAction();
                var
                    MatchFilters: Record "CDC Match Filters";
                    MatchFilterPage: page "CDC Match Filters";
                begin
                    MatchFilters.SetRange("Template No.", Rec."No.");
                    MatchFilterPage.SetTableView(MatchFilters);
                    MatchFilterPage.run;
                end;
            }
        }
    }

    var
        myInt: Integer;
}