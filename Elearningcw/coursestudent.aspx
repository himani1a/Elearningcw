<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="coursestudent.aspx.vb" Inherits="Elearningcw.coursestudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
            &nbsp;<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT COURSE_ID, STUDENT_ID, ENROLL_DATE FROM &quot;Course-Student&quot;"
                DeleteCommand="DELETE FROM &quot;Course-Student&quot; WHERE COURSE_ID = :COURSE_ID AND STUDENT_ID = :STUDENT_ID"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                InsertCommand="INSERT INTO &quot;Course-Student&quot; (COURSE_ID, STUDENT_ID, LESSON_STATUS, ENROLL_DATE) VALUES (:COURSE_ID, :STUDENT_ID, :ENROLL_DATE)"
                UpdateCommand="UPDATE &quot;Course-Student&quot; SET ENROLL_DATE = :ENROLL_DATE WHERE COURSE_ID = :COURSE_ID AND STUDENT_ID = :STUDENT_ID">
                <DeleteParameters>
                    
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                </DeleteParameters>

                <InsertParameters>
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="ENROLL_DATE" Type="DateTime" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="ENROLL_DATE" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:FormView ID="FormViewCourseStudent" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                <InsertItemTemplate>
                    COURSE_ID:
            <asp:DropDownList ID="COURSE_IDDropDownList" runat="server"
                DataSourceID="SqlDataSourceCourses"
                DataTextField="COURSE_TITLE"
                DataValueField="COURSE_ID"
                SelectedValue='<%# Bind("COURSE_ID") %>'>
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

                    ENROLL_DATE:
                    <asp:TextBox ID="ENROLL_DATETextBox" runat="server" Text='<%# Bind("ENROLL_DATE") %>' TextMode="Date" />
                    <br />
                   

                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert Data" />
                </InsertItemTemplate>
            </asp:FormView>
        </div>
        <!-- The SqlDataSource for Courses -->
        <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COURSE_ID, COURSE_TITLE FROM COURSE"></asp:SqlDataSource>

        <!-- The SqlDataSource for Students -->
        <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT STUDENT_ID, STUDENT_NAME FROM STUDENT"></asp:SqlDataSource>
    </form>
</body>
</html>

