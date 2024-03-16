<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="lesson.aspx.vb" Inherits="Elearningcw.lesson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Lesson</title>
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
                            Lesson Table
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="custom-grid table  table-sm">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM LESSON WHERE LESSON_NO = :LESSON_NO"
                    InsertCommand="INSERT INTO LESSON (LESSON_NO, LESSON_TITLE, CONTENT_TYPE) VALUES (:LESSON_NO, :LESSON_TITLE, :CONTENT_TYPE)"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT LESSON_NO, LESSON_TITLE, CONTENT_TYPE FROM LESSON"
                    UpdateCommand="UPDATE LESSON SET LESSON_TITLE = :LESSON_TITLE, CONTENT_TYPE = :CONTENT_TYPE WHERE LESSON_NO = :LESSON_NO">

                    <DeleteParameters>
                        <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="LESSON_TITLE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CONTENT_TYPE" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LESSON_TITLE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CONTENT_TYPE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>

                <div>
                    <div class="col-md-4">

                        <asp:FormView ID="FormViewLesson" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                            <InsertItemTemplate>
                                <div class="container mt-3">
                                    <div class="card">
                                        <div class="card-header">
                                            Add New Lesson
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="LESSON_NOTextBox">LESSON_NO:</label>
                                                <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="LESSON_TITLETextBox">LESSON_TITLE:</label>
                                                <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="CONTENT_TYPETextBox">CONTENT_TYPE:</label>
                                                <asp:TextBox ID="CONTENT_TYPETextBox" runat="server" Text='<%# Bind("CONTENT_TYPE") %>' CssClass="form-control" />
                                            </div>

                                            <asp:Button ID="InsertButtonCourse" runat="server" CommandName="Insert" Text="Insert Data" CssClass="btn btn-primary" Style="background-color: #004d99; color: white;" />
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

