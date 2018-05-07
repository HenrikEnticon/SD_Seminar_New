pageextension 123456700 ResourceCardExt extends "Resource Card"
//Documentation comes here
{
    layout
    {
        addlast(General)
        {
            field("CSD_Resource Type"; "CSD_Resource Type")
            {

            }
            field("CSD_Quantity Per Day"; "CSD_Quantity Per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group(Room)
            {
                field("CSD_Maximum Participants"; "CSD_Maximum Participants")
                {
                    Visible = ShowMaxField;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage();
    var

    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
}