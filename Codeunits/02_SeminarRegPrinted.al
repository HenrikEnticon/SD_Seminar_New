codeunit 123456702 SeminarRegPrinted
{
    TableNo = "Seminar Registration Header";

    trigger OnRun();
    begin
        find;
        "No. Printed" += 1;
        Modify;
        Commit;
    end;
}