report 123456701 SeminarRegParticipantList
{
    UsageCategory = ReportsAndAnalysis;
    caption = 'Seminar Reg.-Participants List';
    DefaultLayout = RDLC;

    dataset
    {

        dataitem(SeminarRegistrationHeader; "Seminar Registration Header")
        {
            DataItemTableView = sorting ("No.");
            RequestFilterFields = "No.", "Seminar No.";

            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(SeminarNo_; "Seminar No.")
            {
                IncludeCaption = true;
            }
            column(SeminarName; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(StartingDate; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Duration; Duration)
            {
                IncludeCaption = true;
            }
            column(InstructorName; "Instructor Name")
            {
                IncludeCaption = true;
            }
            column(RoomName; "Room Name")
            {
                IncludeCaption = true;
            }
            dataitem(SeminarRegistrationLine; "Seminar Registration Line")

            {
                DataItemTableView = sorting ("Document No.", "Line No.");
                DataItemLink = "Document No." = field ("No.");

                column(BilltoCustomerNo_; "Bill-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantContactNo_; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantName; "Participant Name")
                {
                    IncludeCaption = true;
                }
            }
        }
        dataitem(CompanyInformation; "Company Information")
        {
            column(Company_Name; Name)
            {

            }

        }

    }
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Registration Header';
    }
}