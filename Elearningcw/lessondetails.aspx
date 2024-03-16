<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="lessondetails.aspx.vb" Inherits="Elearningcw.lessondetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Lesson Details</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
     .navbar-custom {
         background-color: #004d99; /* Custom background color */
         color: #ffffff; /* Custom text color */
     }
     .navbar-custom .navbar-brand,
     .navbar-custom .navbar-nav .nav-link {
         color: #ffffff; /* Custom text color for brand and links */
     }
 </style>
</head>
<body>
    <form id="form1" runat="server">
                        <nav class="navbar navbar-expand-lg navbar-custom">
    <a class="navbar-brand" href="#">E-Learning</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="home.aspx">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="student.aspx">Student</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="instructor.aspx">Instructor</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="lesson.aspx">Lesson</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="course.aspx">Course</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="lessondetails.aspx">Lesson Details</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="studentenroll.aspx">Student Enrollment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="teachcins.aspx">Instructor coursedetail</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="bestcourse.aspx">Best Courses</a>
            </li>
        </ul>
    </div>
</nav>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                    <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" SortExpression="LESSON_NO"></asp:BoundField>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID"></asp:BoundField>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID"></asp:BoundField>
                    <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS"></asp:BoundField>
                    <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT LESSON_NO, COURSE_ID, STUDENT_ID, LESSON_STATUS, LAST_ACCESSED_DATE FROM &quot;Lesson-Details&quot;"
                DeleteCommand="DELETE FROM &quot;Lesson-Details&quot; WHERE LESSON_NO = :LESSON_NO AND COURSE_ID = :COURSE_ID AND STUDENT_ID = :STUDENT_ID AND LESSON_STATUS = :LESSON_STATUS AND LAST_ACCESSED_DATE = :LAST_ACCESSED_DATE"

                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                InsertCommand="INSERT INTO &quot;Lesson-Details&quot; (LESSON_NO, COURSE_ID, STUDENT_ID, LESSON_STATUS, LAST_ACCESSED_DATE) VALUES (:LESSON_NO, :COURSE_ID, :STUDENT_ID, :LESSON_STATUS, :LAST_ACCESSED_DATE)"
                UpdateCommand="UPDATE &quot;Lesson-Details&quot; SET LESSON_STATUS = :LESSON_STATUS, LAST_ACCESSED_DATE = :LAST_ACCESSED_DATE WHERE LESSON_NO = :LESSON_NO AND COURSE_ID = :COURSE_ID AND STUDENT_ID = :STUDENT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
<asp:Parameter Name="COURSE_ID" Type="Decimal" />
<asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="LESSON_STATUS" Type="String" />
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                </DeleteParameters>

                <InsertParameters>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="LESSON_STATUS" Type="String" />
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="LESSON_STATUS" Type="String" />
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:FormView ID="FormViewLesson" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                <InsertItemTemplate>
                    LESSON_NO:
                    <asp:DropDownList ID="LESSON_NODropDownList" runat="server"
                        DataSourceID="SqlDataSourceLessons"
                        DataTextField="LESSON_TITLE"
                        DataValueField="LESSON_NO"
                        SelectedValue='<%# Bind("LESSON_NO") %>'>
                    </asp:DropDownList>
                    <br />

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
                    LESSON_STATUS:
        <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                    <br />

                    LAST_ACCESSED_DATE:
        <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" 
             Text='<%# Bind("LAST_ACCESSED_DATE", "{0:MM/dd/yyyy}") %>' />
</br>




                    <asp:Button ID="InsertButtonCourse" runat="server" CommandName="Insert" Text="Insert Data" />
                </InsertItemTemplate>
            </asp:FormView>
        </div>
        <!-- The SqlDataSource for Lessons -->
        <asp:SqlDataSource ID="SqlDataSourceLessons" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT LESSON_NO, LESSON_TITLE FROM LESSON"></asp:SqlDataSource>

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
