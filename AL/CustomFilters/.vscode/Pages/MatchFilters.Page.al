page 60100 "CDC Match Filters"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CDC Match Filters";
    CaptionML = ENU = 'Match Filters', ESP = 'Filtros personalizados';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Table No."; Rec."Table No.")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Table No.', ESP = 'Nº tabla';
                    ToolTipML = ENU = 'Specifies the value of the Table No. field.', ESP = 'Especifica el valor del campo Nº de tabla. Debe indicar la tabla sobre la que se aplicará el filtro';

                }
                field("Table Nanme"; Rec."Table Name")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Table Name', ESP = 'Nombre tabla';
                    ToolTipML = ENU = 'Specifies the value of the Table Name field.', ESP = 'Especifica el valor del campo Nombre de tabla. Indica la tabla sobre la que se aplicará el filtro';

                }
                field("Field No."; Rec."Field No.")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Field No.', ESP = 'Nº campo';
                    ToolTipML = ENU = 'Specifies the value of the Field No. field.', ESP = 'Especifica el valor del campo Nº de campo. Debe indicar el número de campo sobre el que se aplicará el filtro';

                }
                field("Field Name"; Rec."Field Name")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Field Name', ESP = 'Nombre campo';
                    ToolTipML = ENU = 'Specifies the value of the Field Name field.', ESP = 'Especifica el valor del campo Nombre de campo. Indica el nombre del campo de la tabla sobre la que se aplicará el filtro';

                }
                field("Filter Field"; Rec."Filter Field")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Filter Field', ESP = 'Campo filtro';
                    ToolTipML = ENU = 'Specifies the value of the Filter field.', ESP = 'Especifica el valor del campo Campo Filtro. Debe indicar el campo con el que se capturará el valor del filtro deseado';

                }
            }
        }

    }

}