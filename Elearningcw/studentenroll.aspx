<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="studentenroll.aspx.vb" Inherits="Elearningcw.studentenroll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Student Enrollment</title>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT s.STUDENT_ID, s.STUDENT_NAME, s.CONTACT, s.DOB, s.EMAIL_ADDRESS, s.COUNTRY,
c.COURSE_ID, c.COURSE_TITLE, c.ENROLL_COURSE, c.DESCRIPTION, c.COURSE_LVL
FROM Student s
INNER JOIN &quot;Course-Student&quot; cs ON s.STUDENT_ID = cs.STUDENT_ID
INNER JOIN Course c ON cs.COURSE_ID = c.COURSE_ID where  s.STUDENT_ID =:student">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="student"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" DataSourceID="SqlDataSource2" AutoPostBack="True"></asp:DropDownList></div>
        <div>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STUDENT_ID, STUDENT_NAME FROM STUDENT"></asp:SqlDataSource>
        </div>
        <div>
            &nbsp;<asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
        </div>

    </form>
</body>
</html>
