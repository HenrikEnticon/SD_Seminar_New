pageextension 123456700 ResourceCardExt extends "Resource Card"
//Documentation comes here
{
    layout
    {
        addlast(General)
        {
            field("CSD_Resource Type";"CSD_Resource Type")
            {

            }
        }
        addafter("Personal Data")
        {
            group(Room)
            {
                field("CSD_Maximum Participants";"CSD_Maximum Participants")
                {
                    Visible = ShowMaxField;
                }
                field("CSD_Quantity Per Day";"CSD_Quantity Per Day")
                {

                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    var
        [InDataSet]
        ShowMaxField : Boolean;
    
    trigger OnOpenPage();
    var
        
    begin
        ShowMaxField := (type = type::Machine);
        CurrPage.Update(false);
    end;
}