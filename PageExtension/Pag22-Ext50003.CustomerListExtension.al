pageextension 50003 CustomerListExtension extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("&Customer")
        {
            action("Run Query XML")
            {
                ApplicationArea = All;
                Image = XMLFile;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Query in XML';
                trigger OnAction()
                var
                    mycu: Codeunit QueryDemo;
                begin
                    mycu.StreamyQueryToXML();
                end;
            }
            action("Run Query CSV")
            {
                ApplicationArea = All;
                Image = Filed;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Query in CSV';
                trigger OnAction()
                var
                    mycu: Codeunit QueryDemo;
                begin
                    mycu.StreamyQueryToCSV();
                end;
            }
        }
    }

    var
        myInt: Integer;
}