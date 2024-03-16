<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="course.aspx.vb" Inherits="Elearningcw.course" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course</title>
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
            border: 1px solid #dee2e6; /* Bootstrap's default border color */
        }

        .custom-grid {
            border-radius: 0.25rem; /* Rounded corners for the table */
            overflow: hidden; /* Ensures the rounded corners are visible */
            box-shadow: 0 .125rem .25rem rgba(0,0,0,.075); /* Bootstrap's default shadow for cards */
        }

        .table-sm th, .table-sm td {
            padding: 0.3rem; /* Reducing padding to make rows tighter */
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
        <div class="container-fluid pl-3 pt-3">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            Course Table
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="custom-grid table table-sm">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div>
                    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM COURSE WHERE COURSE_ID = :COURSE_ID"
                        InsertCommand="INSERT INTO COURSE (COURSE_ID, COURSE_TITLE, ENROLL_COURSE, DESCRIPTION, COURSE_LVL) VALUES (:COURSE_ID, :COURSE_TITLE, :ENROLL_COURSE, :DESCRIPTION, :COURSE_LVL)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                        SelectCommand="SELECT COURSE_ID, COURSE_TITLE, ENROLL_COURSE, DESCRIPTION, COURSE_LVL FROM COURSE"
                        UpdateCommand="UPDATE COURSE SET COURSE_TITLE = :COURSE_TITLE, ENROLL_COURSE = :ENROLL_COURSE, DESCRIPTION = :DESCRIPTION, COURSE_LVL = :COURSE_LVL WHERE COURSE_ID = :COURSE_ID">

                        <DeleteParameters>
                            <asp:Parameter Name="COURSE_ID" Type="Decimal"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="COURSE_ID" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="COURSE_TITLE" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ENROLL_COURSE" Type="String"></asp:Parameter>
                            <asp:Parameter Name="DESCRIPTION" Type="String"></asp:Parameter>
                            <asp:Parameter Name="COURSE_LVL" Type="Decimal"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="COURSE_TITLE" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ENROLL_COURSE" Type="String"></asp:Parameter>
                            <asp:Parameter Name="DESCRIPTION" Type="String"></asp:Parameter>
                            <asp:Parameter Name="COURSE_LVL" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="COURSE_ID" Type="Decimal"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div>
                <div class="col-md-4">
                    <asp:FormView ID="FormViewCourse" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="container mt-3">
                                <div class="card">
                                    <div class="card-header">
                                        Add New Course
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="COURSE_TITLETextBox">Course Title:</label>
                                            <asp:TextBox ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="COURSE_IDTextBox">Course ID:</label>
                                            <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="ENROLL_COURSETextBox">Enroll Course:</label>
                                            <asp:TextBox ID="ENROLL_COURSETextBox" runat="server" Text='<%# Bind("ENROLL_COURSE") %>' CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="DESCRIPTIONTextBox">Description:</label>
                                            <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="LevelTextBox">Course Level:</label>
                                            <asp:TextBox ID="LevelTextBox" runat="server" Text='<%# Bind("COURSE_LVL") %>' CssClass="form-control" />
                                        </div>
                                        <asp:Button ID="InsertButtonCourse" runat="server" CommandName="Insert" Text="Insert Data" CssClass="btn btn-primary" Style="background-color: #004d99; color: white;" />
                                    </div>
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
