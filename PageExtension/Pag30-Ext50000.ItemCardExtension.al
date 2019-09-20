pageextension 50000 ItemCardExtension extends "Item card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action(ImportItemPicture)
            {
                Caption = 'Import Item Picture';
                ApplicationArea = All;
                Image = Import;

                Trigger OnAction()
                Var
                    ImageMngt: Codeunit ImageMgt;
                Begin
                    ImageMngt.ImportItemPicture(Rec);
                End;
            }

            action(ExportItemPicture)
            {
                Caption = 'Export Item Picture';
                ApplicationArea = All;
                Image = Export;

                Trigger OnAction()
                Var
                    ImageMngt: Codeunit ImageMgt;
                Begin
                    ImageMngt.ExportItemPicture(Rec);
                End;
            }
        }
    }

    var
        myInt: Integer;
}