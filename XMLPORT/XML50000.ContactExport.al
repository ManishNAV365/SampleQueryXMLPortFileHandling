xmlport 50000 ContactExport
{
    Direction = Export;
    Format = VariableText;
    Caption = 'Contact Export';
    FieldDelimiter = '"';
    FieldSeparator = ',';
    TableSeparator = '<None>';
    RecordSeparator = '<NewLine>';
    schema
    {
        textelement(NodeName1)
        {
            tableelement(Contact; Contact)
            {
                fieldattribute("No."; Contact."No.")
                { }
                fieldelement(Name; Contact.Name)
                { }
                fieldelement(name2; Contact."Name 2")
                { }
            }
        }
    }

    requestpage
    {
        layout
        { }
    }

    var
        myInt: Integer;
}