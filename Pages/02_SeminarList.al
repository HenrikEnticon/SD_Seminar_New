page 123456702 "Seminar List"
{
    PageType = List;
    SourceTable = Seminar;
    Caption = 'Seminar List';
    CardPageId = "Seminar Card";
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    
                }
                field(Name;Name)
                {
                    
                }
                field("Seminar Duration";"Seminar Duration")
                {
                    
                }
                field("Seminar Price";"Seminar Price")
                {

                }
                field("Minimum Participants";"Minimum Participants")
                {
                    
                }
                
                field("Maximum Participants";"Maximum Participants")
                {
                    
                }
            }
        }
        area(factboxes)
        {
             systempart("Links"; Links)
            {

            }
            systempart("Notes"; Notes)
            {

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}