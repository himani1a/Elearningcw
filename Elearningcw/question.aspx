<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="question.aspx.vb" Inherits="Elearningcw.question" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QUESTION_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="QUESTION_ID" HeaderText="QUESTION_ID" ReadOnly="True" SortExpression="QUESTION_ID"></asp:BoundField>
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" SortExpression="INSTRUCTOR_ID"></asp:BoundField>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID"></asp:BoundField>
                    <asp:BoundField DataField="ASK_DATE" HeaderText="ASK_DATE" SortExpression="ASK_DATE"></asp:BoundField>
                    <asp:BoundField DataField="QUESTION_TEXT" HeaderText="QUESTION_TEXT" SortExpression="QUESTION_TEXT"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <div>&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                 SelectCommand="SELECT QUESTION_ID, INSTRUCTOR_ID, STUDENT_ID, ASK_DATE, QUESTION_TEXT FROM QUESTION" 
             DeleteCommand="DELETE FROM QUESTION WHERE QUESTION_ID = :QUESTION_ID" 
  InsertCommand="INSERT INTO QUESTION (QUESTION_ID, INSTRUCTOR_ID, STUDENT_ID, ASK_DATE, QUESTION_TEXT) VALUES (:QUESTION_ID, :INSTRUCTOR_ID, :STUDENT_ID, :ASK_DATE, :QUESTION_TEXT)" 
            UpdateCommand="UPDATE QUESTION SET INSTRUCTOR_ID = :INSTRUCTOR_ID, STUDENT_ID = :STUDENT_ID, ASK_DATE = :ASK_DATE, QUESTION_TEXT = :QUESTION_TEXT  QUESTION_ID = :QUESTION_ID">
            <DeleteParameters>
                <asp:Parameter Name="QUESTION_ID" Type="Decimal"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="QUESTION_ID" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="ASK_DATE" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="QUESTION_TEXT" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="ASK_DATE" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="QUESTION_TEXT" Type="String"></asp:Parameter>
                <asp:Parameter Name="QUESTION_ID" Type="Decimal"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
        <div>&nbsp;    <asp:FormView ID="FormViewquestion" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <InsertItemTemplate>
            INSTRUCTURE_ID:
    <asp:DropDownList ID="INSTRUCTURE_IDDropDownList" runat="server"
        DataSourceID="SqlDataSourceCourses"
        DataTextField="INSTRUCTURE_NAME"
        DataValueField="INSTRUCTURE_ID"
        SelectedValue='<%# Bind("INSTRUCTURE_ID") %>'>
    </asp:DropDownList>
            <br />

            STUDENT_ID:
    <asp:DropDownList ID="STUDENT_IDDropDownList" runat="server"
        DataSourceID="SqlDataSourceStudents"
        DataTextField="STUDENT_NAME"
        DataValueField="STUDENT_ID"
        SelectedValue='<%# Bind("STUDENT_ID") %>'>
    </asp:DropDownList>
            <br />

            ASK_DATE: 
<asp:TextBox ID="ASK_DATETextBox" runat="server" Text='<%# Bind("ASK_DATE") %>' TextMode="Date" /> <br />
QUESTION_TEXT:
<asp:TextBox ID="QUESTION_TEXTTextBox" runat="server" Text='<%# Bind("QUESTION_TEXT") %>' /> <br />
QUESTION_ID:
<asp:TextBox ID="QUESTION_IDTextBox" runat="server" Text='<%# Bind("QUESTION_ID") %>' /> <br />
           

            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert Data" />
        </InsertItemTemplate>
    </asp:FormView>
</div>
<!-- The SqlDataSource for Courses -->
<asp:SqlDataSource ID="SqlDataSourceCourses" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT INSTRUCTURE_ID, INSTRUCTURE_NAME FROM INSTRUCTOR"></asp:SqlDataSource>

<!-- The SqlDataSource for Students -->
<asp:SqlDataSource ID="SqlDataSourceStudents" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT STUDENT_ID, STUDENT_NAME FROM STUDENT"></asp:SqlDataSource>
     
    </form>
</body>
</html>
