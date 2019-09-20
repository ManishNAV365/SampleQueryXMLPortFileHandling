pageextension 50001 ContactCardExtension extends "Contact Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("C&ontact")
        {
            action("Export Contact Xmlport")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Export Contact XML';
                Image = ExportContact;
                trigger OnAction()
                Var
                    mycodeunit: codeunit MyTempBlobMgt;
                begin
                    mycodeunit.StreamingExample1();
                end;
            }
        }
    }
}