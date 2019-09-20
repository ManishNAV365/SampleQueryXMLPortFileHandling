query 50000 SimpleCustomerQuery
{
    QueryType = Normal;
    Caption = 'Top Customer Overview';

    elements
    {
        dataitem(Customer; Customer)
        {
            column("Name_"; "Name")
            { }
            column(Country_Region_Code; "Country/Region Code")
            { }
            column(City_; "City")
            { }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            { }
            column(Salesperson_Code; "Salesperson Code")
            { }
            column(Sales__LCY_; "Sales (LCY)")
            { }
            dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
            {
                DataItemLink = code = Customer."Salesperson Code";
                column(SalespersonName; Name)
                { }
                dataitem(Country_Region; "Country/Region")
                {
                    DataItemLink = code = customer."Country/Region Code";
                    column(CountryRegionName; Name)
                    { }
                }
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}