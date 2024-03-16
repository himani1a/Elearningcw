<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="bestcourse.aspx.vb" Inherits="Elearningcw.bestcourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Best Courses</title>
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

        .custom-grid, .custom-grid th, .custom-grid td {
    background-color: #E0F7FA !important;
}


     
    </style>
</head>
<body>
    <form id="form1" runat="server" >
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
        <div class="pl-3">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT *
FROM (
  SELECT c.COURSE_ID,
         c.COURSE_TITLE,
         c.ENROLL_COURSE,
         c.DESCRIPTION,
         c.COURSE_LVL,
         COUNT(cs.STUDENT_ID) AS TOTAL_ENROLLMENTS
  FROM Course c
  JOIN &quot;Course-Student&quot; cs ON c.COURSE_ID = cs.COURSE_ID
  WHERE cs.ENROLL_DATE BETWEEN TO_DATE('2023-03-01', 'YYYY-MM-DD') AND TO_DATE('2023-03-31', 'YYYY-MM-DD')
  GROUP BY c.COURSE_ID, c.COURSE_TITLE, c.ENROLL_COURSE, c.DESCRIPTION, c.COURSE_LVL
  ORDER BY TOTAL_ENROLLMENTS DESC
)
WHERE ROWNUM  &lt;= 3"></asp:SqlDataSource>
        </div>
        <div>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT c.COURSE_ID,
    c.COURSE_TITLE,
    c.ENROLL_COURSE,
    c.DESCRIPTION,
    c.COURSE_LVL,
    TO_CHAR(cs.ENROLL_DATE, 'MM-YYYY') AS ENROLL_MONTH_YEAR,
    COUNT(cs.STUDENT_ID) AS TOTAL_ENROLLMENTS
FROM
    Course c
    JOIN &quot;Course-Student&quot; cs ON c.COURSE_ID = cs.COURSE_ID
WHERE
    TO_CHAR(cs.ENROLL_DATE, 'MM-YYYY') = :SelectedMonthYear
GROUP BY
    c.COURSE_ID,
    c.COURSE_TITLE,
    c.ENROLL_COURSE,
    c.DESCRIPTION,
    c.COURSE_LVL,
    TO_CHAR(cs.ENROLL_DATE, 'MM-YYYY')
ORDER BY
    ENROLL_MONTH_YEAR,
    TOTAL_ENROLLMENTS DESC">

                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" DbType="String" Name="SelectedMonthYear" />
                </SelectParameters>
            </asp:SqlDataSource>


        </div>
        <asp:SqlDataSource ID="SqlDataSourceForDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT DISTINCT TO_CHAR(cs.ENROLL_DATE, 'MM-YYYY') AS ENROLL_MONTH_YEAR
                   FROM &quot;Course-Student&quot; cs
                   ORDER BY TO_CHAR(cs.ENROLL_DATE, 'MM-YYYY')"></asp:SqlDataSource>

        <div>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSE_ID, STUDENT_ID, ENROLL_DATE FROM &quot;Course-Student&quot;"></asp:SqlDataSource>
        </div>
        <div>
            &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataTextField="ENROLL_MONTH_YEAR" DataValueField="ENROLL_MONTH_YEAR" DataSourceID="SqlDataSourceForDropDown" AutoPostBack="True"></asp:DropDownList>
        </div>
        <div>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
        </div>
      
        <div >

            <label style="font-weight: bold;">Top 3 best e learning courses:</label>
            &nbsp;<asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" CssClass="custom-grid"></asp:GridView>
        </div>
         <br>
        <div>
            <label style="font-weight: bold;">E-Learning Course on the basis of month:</label>
            &nbsp;<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="COURSE_ID" CssClass="custom-grid">
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID"></asp:BoundField>
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE"></asp:BoundField>
                    <asp:BoundField DataField="ENROLL_COURSE" HeaderText="ENROLL_COURSE" SortExpression="ENROLL_COURSE"></asp:BoundField>
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION"></asp:BoundField>
                    <asp:BoundField DataField="COURSE_LVL" HeaderText="COURSE_LVL" SortExpression="COURSE_LVL"></asp:BoundField>
                    <asp:BoundField DataField="ENROLL_MONTH_YEAR" HeaderText="ENROLL_MONTH_YEAR" SortExpression="ENROLL_MONTH_YEAR"></asp:BoundField>
                    <asp:BoundField DataField="TOTAL_ENROLLMENTS" HeaderText="TOTAL_ENROLLMENTS" SortExpression="TOTAL_ENROLLMENTS"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
            </div>

    </form>
</body>
</html>
