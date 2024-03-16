<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="courseinstructor.aspx.vb" Inherits="Elearningcw.courseinstructor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Instructor Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="INSTRUCTURE_ID" HeaderText="INSTRUCTURE_ID" SortExpression="INSTRUCTURE_ID" />
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT INSTRUCTURE_ID, COURSE_ID FROM &quot;Course-Instructor&quot;"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
        </div>
       
    </form>
</body>
</html>
