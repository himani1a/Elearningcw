<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="teachcins.aspx.vb" Inherits="Elearningcw.teachcins" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Instructor Course Details</title>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="WITH QualifiedInstructors AS (
        SELECT INSTRUCTURE_ID
        FROM &quot;Course-Instructor&quot;
        GROUP BY INSTRUCTURE_ID
        HAVING COUNT(COURSE_ID) &gt;= 2
    )
    SELECT c.COURSE_ID, c.COURSE_TITLE, c.ENROLL_COURSE, c.DESCRIPTION, c.COURSE_LVL,
        i.INSTRUCTURE_ID, i.INSTRUCTURE_NAME, i.INSTRUCTURE_CONTACT, i.INSTRUCTURE_ADDRESS
    FROM Course c
    JOIN &quot;Course-Instructor&quot; ci ON c.COURSE_ID = ci.COURSE_ID
    JOIN QualifiedInstructors qi ON ci.INSTRUCTURE_ID = qi.INSTRUCTURE_ID
    JOIN Instructor i ON qi.INSTRUCTURE_ID = i.INSTRUCTURE_ID
    WHERE i.INSTRUCTURE_ID = :instructor">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Instructor" />
    </SelectParameters>
</asp:SqlDataSource>

        </div>
        <div>&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT INSTRUCTURE_ID, INSTRUCTURE_NAME FROM INSTRUCTOR"></asp:SqlDataSource>
        </div>
        <div>&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataTextField="INSTRUCTURE_NAME" DataValueField="INSTRUCTURE_ID" DataSourceID="SqlDataSource2" AutoPostBack="True"></asp:DropDownList></div>
        <div>&nbsp;<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
        </div>
    </form>
</body>
</html>
